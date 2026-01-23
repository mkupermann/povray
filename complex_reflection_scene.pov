// Komplexe POV-Ray Szene mit 1000 spiegelnden Kugeln
// Persistence Of Vision Raytracer Scene Description File
// 
// Diese Szene zeigt 1000 Kugeln mit gegenseitiger Spiegelung
// -w800 -h600 +a0.3 +r3 +am2 +mb2

#version 3.7;
global_settings { 
    assumed_gamma 1.0
    max_trace_level 10  // Erhöht für komplexe Spiegelungen
    adc_bailout 0.01
    ambient_light 0
    photons {
        count 20000
        media 100
        spacing 0.1
        gather min_samples 20 max_samples 100
    }
}

// Kamera-Setup für dramatische Perspektive
camera {
    location <0, 15, -30>
    right x*image_width/image_height
    look_at <0, 0, 0>
    angle 60
    aperture 0.5
    blur_samples 20
    focal_point <0, 0, 0>
}

// Komplexe Beleuchtung
light_source { 
    <50, 100, -50> 
    color rgb<1, 1, 0.9> 
    area_light <20, 0, 0>, <0, 20, 0>, 9, 9
    adaptive 1
    jitter
    photons {
        reflection on
        refraction on
    }
}

light_source { 
    <-30, 50, 30> 
    color rgb<0.8, 0.9, 1> 
    area_light <15, 0, 0>, <0, 15, 0>, 7, 7
    adaptive 1
    jitter
}

light_source { 
    <0, 200, 0> 
    color rgb<1, 1, 1>*0.3 
    shadowless
}

// Hintergrund mit Gradient
background { 
    gradient y
    color_map {
        [0.0 color rgb<0.05, 0.05, 0.15>]
        [0.5 color rgb<0.1, 0.1, 0.3>]
        [1.0 color rgb<0.02, 0.02, 0.08>]
    }
}

// Spiegelnder Boden
plane {
    y, -10
    pigment { 
        gradient x
        color_map {
            [0.0 color rgb<0.2, 0.2, 0.3>]
            [0.5 color rgb<0.3, 0.3, 0.4>]
            [1.0 color rgb<0.2, 0.2, 0.3>]
        }
        scale 5
    }
    finish {
        reflection { 0.8, 1.0 }
        specular 0.9
        roughness 0.001
        conserve_energy
    }
    photons { reflection on }
}

// Hauptkugel in der Mitte - große spiegelnde Kugel
sphere {
    <0, 0, 0>, 3
    pigment { color rgb<0.9, 0.9, 1.0> }
    finish {
        reflection { 0.95, 1.0 }
        specular 1.0
        roughness 0.0001
        metallic
        conserve_energy
    }
    photons { 
        reflection on 
        refraction on
    }
    interior {
        ior 1.5
        fade_color rgb<0.8, 0.8, 1.0>
        fade_distance 10
    }
}

// Materialdefinitionen für verschiedene Kugeltypen
#declare ChromeMaterial = 
material {
    texture {
        pigment { color rgb<0.8, 0.8, 0.85> }
        finish {
            reflection { 0.9, 1.0 }
            specular 1.0
            roughness 0.0001
            metallic
            conserve_energy
        }
    }
    interior {
        ior 1.1
    }
}

#declare GoldMaterial = 
material {
    texture {
        pigment { color rgb<1.0, 0.8, 0.3> }
        finish {
            reflection { 0.85, 1.0 }
            specular 1.0
            roughness 0.0001
            metallic
            conserve_energy
        }
    }
    interior {
        ior 1.3
        fade_color rgb<1.0, 0.9, 0.4>
        fade_distance 5
    }
}

#declare GlassMaterial = 
material {
    texture {
        pigment { color rgbf<1, 1, 1, 0.9> }
        finish {
            reflection { 0.1, 0.2 }
            specular 1.0
            roughness 0.0001
            conserve_energy
        }
    }
    interior {
        ior 1.5
        fade_color rgb<1, 1, 1>
        fade_distance 20
    }
}

// 999 Kugeln in verschiedenen Formationen
#declare SphereCount = 999;
#declare CurrentSphere = 1;

// Spirale Formation
#while (CurrentSphere <= 300)
    #declare Angle = CurrentSphere * 0.2;
    #declare Radius = CurrentSphere * 0.05;
    #declare Height = CurrentSphere * 0.1 - 15;
    
    sphere {
        <cos(Angle)*Radius, Height, sin(Angle)*Radius>, 
        0.2 + CurrentSphere*0.001
        material { 
            #switch (mod(CurrentSphere, 3))
                #case (0) ChromeMaterial #break
                #case (1) GoldMaterial #break
                #case (2) GlassMaterial #break
            #end
        }
        photons { 
            reflection on 
            refraction on
        }
    }
    #declare CurrentSphere = CurrentSphere + 1;
#end

// Kugelgitter Formation
#while (CurrentSphere <= 600)
    #declare GridX = (CurrentSphere - 301) % 10 - 5;
    #declare GridZ = ((CurrentSphere - 301) / 10) % 10 - 5;
    #declare GridY = ((CurrentSphere - 301) / 100) * 3 - 6;
    
    sphere {
        <GridX*2, GridY, GridZ*2>, 
        0.3
        material { 
            #switch (mod(CurrentSphere, 4))
                #case (0) ChromeMaterial #break
                #case (1) GoldMaterial #break
                #case (2) GlassMaterial #break
                #case (3) 
                    material {
                        texture {
                            pigment { color rgb<0.3, 0.8, 0.3> }
                            finish {
                                reflection { 0.7, 1.0 }
                                specular 1.0
                                roughness 0.0001
                                metallic
                                conserve_energy
                            }
                        }
                    }
                #break
            #end
        }
        photons { 
            reflection on 
            refraction on
        }
    }
    #declare CurrentSphere = CurrentSphere + 1;
#end

// Zufällige Wolken Formation
#while (CurrentSphere <= SphereCount)
    #declare RandomX = rand(CurrentSphere) * 40 - 20;
    #declare RandomY = rand(CurrentSphere*2) * 20 - 5;
    #declare RandomZ = rand(CurrentSphere*3) * 40 - 20;
    #declare RandomRadius = rand(CurrentSphere*4) * 0.5 + 0.1;
    
    sphere {
        <RandomX, RandomY, RandomZ>, 
        RandomRadius
        material { 
            #switch (mod(CurrentSphere, 5))
                #case (0) ChromeMaterial #break
                #case (1) GoldMaterial #break
                #case (2) GlassMaterial #break
                #case (3) 
                    material {
                        texture {
                            pigment { color rgb<1.0, 0.3, 0.3> }
                            finish {
                                reflection { 0.8, 1.0 }
                                specular 1.0
                                roughness 0.0001
                                metallic
                                conserve_energy
                            }
                        }
                    }
                #break
                #case (4) 
                    material {
                        texture {
                            pigment { color rgb<0.3, 0.3, 1.0> }
                            finish {
                                reflection { 0.75, 1.0 }
                                specular 1.0
                                roughness 0.0001
                                metallic
                                conserve_energy
                            }
                        }
                    }
                #break
            #end
        }
        photons { 
            reflection on 
            refraction on
        }
    }
    #declare CurrentSphere = CurrentSphere + 1;
#end

// Nebel für Atmosphäre
fog {
    distance 50
    color rgb<0.1, 0.1, 0.2>*0.3
    fog_offset 5
    fog_alt 10
    turbulence 0.2
}

// Media für zusätzliche Atmosphäre
media {
    scattering { 2, 0.01 }
    absorption { 0.01 }
    emission { 0.001 }
    samples 10, 10
    interval 1
    confidence 0.9
    ratio 0.9
}
