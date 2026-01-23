#!/usr/bin/env python3
"""
Python Raytracer mit 1000 spiegelnden Kugeln
Benötigt: pip install pygame numpy
"""

import numpy as np
import pygame
from dataclasses import dataclass
from typing import List, Optional, Tuple
import math

@dataclass
class Vec3:
    x: float
    y: float
    z: float
    
    def __add__(self, other):
        return Vec3(self.x + other.x, self.y + other.y, self.z + other.z)
    
    def __sub__(self, other):
        return Vec3(self.x - other.x, self.y - other.y, self.z - other.z)
    
    def __mul__(self, scalar):
        return Vec3(self.x * scalar, self.y * scalar, self.z * scalar)
    
    def __truediv__(self, scalar):
        return Vec3(self.x / scalar, self.y / scalar, self.z / scalar)
    
    def dot(self, other):
        return self.x * other.x + self.y * other.y + self.z * other.z
    
    def length(self):
        return math.sqrt(self.dot(self))
    
    def normalize(self):
        return self / self.length()
    
    def reflect(self, normal):
        return self - normal * (2 * self.dot(normal))
    
    def to_tuple(self):
        return (int(self.x * 255), int(self.y * 255), int(self.z * 255))

@dataclass
class Sphere:
    center: Vec3
    radius: float
    color: Vec3
    reflectivity: float = 0.9
    
    def intersect(self, ray_origin, ray_direction):
        """Ray-Sphere Intersection"""
        oc = ray_origin - self.center
        a = ray_direction.dot(ray_direction)
        b = 2.0 * oc.dot(ray_direction)
        c = oc.dot(oc) - self.radius * self.radius
        
        discriminant = b * b - 4 * a * c
        if discriminant < 0:
            return None
        
        t = (-b - math.sqrt(discriminant)) / (2 * a)
        if t > 0.001:  # Avoid self-intersection
            return t
        
        t = (-b + math.sqrt(discriminant)) / (2 * a)
        if t > 0.001:
            return t
        
        return None

class Raytracer:
    def __init__(self, width=800, height=600):
        self.width = width
        self.height = height
        self.spheres = []
        self.lights = []
        self.max_depth = 5
        
        self.setup_scene()
    
    def setup_scene(self):
        """Erstellt 1000 Kugeln in verschiedenen Formationen"""
        
        # Hauptkugel in der Mitte
        self.spheres.append(Sphere(
            Vec3(0, 0, 0), 3.0,
            Vec3(0.9, 0.9, 1.0), 0.95
        ))
        
        # Spirale Formation (300 Kugeln)
        for i in range(300):
            angle = i * 0.2
            radius = i * 0.05
            height = i * 0.1 - 15
            
            color_choice = i % 3
            if color_choice == 0:
                color = Vec3(0.8, 0.8, 0.85)  # Chrom
            elif color_choice == 1:
                color = Vec3(1.0, 0.8, 0.3)  # Gold
            else:
                color = Vec3(0.3, 0.8, 0.3)  # Grün
            
            self.spheres.append(Sphere(
                Vec3(math.cos(angle) * radius, height, math.sin(angle) * radius),
                0.2 + i * 0.001,
                color, 0.9
            ))
        
        # Gitter Formation (300 Kugeln)
        for i in range(300):
            grid_x = (i % 10) - 5
            grid_z = ((i // 10) % 10) - 5
            grid_y = ((i // 100) * 3) - 6
            
            color_choice = i % 4
            colors = [
                Vec3(0.8, 0.8, 0.85),  # Chrom
                Vec3(1.0, 0.8, 0.3),   # Gold
                Vec3(0.9, 0.9, 1.0),   # Glas
                Vec3(0.3, 0.8, 0.3)    # Grün
            ]
            
            self.spheres.append(Sphere(
                Vec3(grid_x * 2, grid_y, grid_z * 2),
                0.3,
                colors[color_choice], 0.8
            ))
        
        # Zufällige Wolken (399 Kugeln)
        np.random.seed(42)  # Für reproduzierbare Ergebnisse
        for i in range(399):
            pos = np.random.uniform(-20, 20, 3)
            pos[1] = np.random.uniform(-5, 15)  # Y-Bereich anpassen
            radius = np.random.uniform(0.1, 0.5)
            
            color_choice = i % 5
            colors = [
                Vec3(0.8, 0.8, 0.85),  # Chrom
                Vec3(1.0, 0.8, 0.3),   # Gold
                Vec3(0.9, 0.9, 1.0),   # Glas
                Vec3(1.0, 0.3, 0.3),   # Rot
                Vec3(0.3, 0.3, 1.0)    # Blau
            ]
            
            self.spheres.append(Sphere(
                Vec3(pos[0], pos[1], pos[2]),
                radius,
                colors[color_choice], 0.7
            ))
        
        # Lichtquellen
        self.lights = [
            Vec3(50, 100, -50),
            Vec3(-30, 50, 30),
            Vec3(0, 200, 0)
        ]
        
        print(f"Szene erstellt mit {len(self.spheres)} Kugeln")
    
    def find_closest_intersection(self, ray_origin, ray_direction):
        """Findet die nächste Intersection"""
        closest_t = float('inf')
        closest_sphere = None
        
        for sphere in self.spheres:
            t = sphere.intersect(ray_origin, ray_direction)
            if t and t < closest_t:
                closest_t = t
                closest_sphere = sphere
        
        return closest_sphere, closest_t
    
    def compute_lighting(self, point, normal, view_direction, sphere):
        """Berechnet Beleuchtung mit Phong Modell"""
        color = Vec3(0.1, 0.1, 0.15)  # Ambient
        
        for light_pos in self.lights:
            light_dir = (light_pos - point).normalize()
            
            # Diffuse
            diffuse_intensity = max(0, normal.dot(light_dir))
            color = color + sphere.color * diffuse_intensity * 0.7
            
            # Specular
            reflect_dir = light_dir.reflect(normal)
            specular_intensity = max(0, view_direction.dot(reflect_dir)) ** 32
            color = color + Vec3(1, 1, 1) * specular_intensity * 0.3
        
        return color
    
    def trace_ray(self, ray_origin, ray_direction, depth=0):
        """Raytracing mit Reflexionen"""
        if depth >= self.max_depth:
            return Vec3(0.05, 0.05, 0.15)  # Hintergrund
        
        closest_sphere, t = self.find_closest_intersection(ray_origin, ray_direction)
        
        if not closest_sphere:
            return Vec3(0.05, 0.05, 0.15)  # Hintergrund
        
        # Intersection Punkt und Normale berechnen
        hit_point = ray_origin + ray_direction * t
        normal = (hit_point - closest_sphere.center).normalize()
        
        # Beleuchtung berechnen
        color = self.compute_lighting(hit_point, normal, ray_direction * -1, closest_sphere)
        
        # Reflexion
        if closest_sphere.reflectivity > 0:
            reflect_dir = ray_direction.reflect(normal)
            reflect_color = self.trace_ray(hit_point, reflect_dir, depth + 1)
            color = color * (1 - closest_sphere.reflectivity) + reflect_color * closest_sphere.reflectivity
        
        return color
    
    def render(self):
        """Rendert die Szene"""
        pygame.init()
        screen = pygame.display.set_mode((self.width, self.height))
        pygame.display.set_caption("Python Raytracer - 1000 Spiegelnde Kugeln")
        
        # Kamera
        camera_pos = Vec3(0, 15, -30)
        camera_target = Vec3(0, 0, 0)
        
        # Bild rendern
        pixels = np.zeros((self.height, self.width, 3), dtype=np.uint8)
        
        print("Rendering startet...")
        
        for y in range(self.height):
            if y % 50 == 0:
                print(f"Zeile {y}/{self.height}")
            
            for x in range(self.width):
                # Ray direction berechnen
                u = (x - self.width / 2) / (self.width / 2)
                v = -(y - self.height / 2) / (self.height / 2)
                
                ray_direction = Vec3(u, v, 1).normalize()
                
                # Raytracing
                color = self.trace_ray(camera_pos, ray_direction)
                
                # Gamma Korrektur
                color = Vec3(
                    min(1, color.x ** 0.45),
                    min(1, color.y ** 0.45),
                    min(1, color.z ** 0.45)
                )
                
                pixels[y, x] = color.to_tuple()
        
        print("Rendering abgeschlossen!")
        
        # Bild anzeigen
        running = True
        clock = pygame.time.Clock()
        
        # Bild als Surface erstellen
        surface = pygame.surfarray.make_surface(pixels.swapaxes(0, 1))
        
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False
            
            screen.blit(surface, (0, 0))
            pygame.display.flip()
            clock.tick(60)
        
        pygame.quit()

if __name__ == "__main__":
    print("Python Raytracer mit 1000 spiegelnden Kugeln")
    print("Installiere: pip install pygame numpy")
    print()
    
    raytracer = Raytracer(800, 600)
    raytracer.render()
