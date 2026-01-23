// Simple POV-Ray scene with a sphere
// Persistence Of Vision raytracer sample file.

#version 3.7;
global_settings {assumed_gamma 1.0}

// Camera setup
camera {
  location <0, 0, -5>
  right   x*image_width/image_height
  look_at <0, 0, 0>
}

// Lighting
light_source { <2, 4, -5> color rgb<1, 1, 1> }
light_source { <-2, 2, -3> color rgb<0.5, 0.5, 0.5> }

// Background
background { color rgb<0.2, 0.2, 0.3> }

// Simple sphere
sphere {
  <0, 0, 0>, 1
  pigment { color rgb<1, 0.2, 0.2> }  // Red sphere
  finish { phong 0.8 phong_size 100 }
}

// Floor plane
plane {
  y, -2
  pigment { checker color rgb<0.8, 0.8, 0.8>, color rgb<0.3, 0.3, 0.3> }
  finish { diffuse 0.8 }
}
