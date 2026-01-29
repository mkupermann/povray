// BUSINESS CHART - Clean Professional Style
// Minimal, corporate design
#version 3.7;

global_settings {
  assumed_gamma 1.0
}

// Camera
camera {
  location <10, 12, -16>
  look_at <0, 3, 0>
  angle 45
}

// Soft, neutral lighting
light_source { <10, 20, -15> color rgb<0.95, 0.95, 0.95> }
light_source { <-8, 15, -10> color rgb<0.4, 0.4, 0.4> }

// Clean white/light gray background
plane { z, 40
  pigment { rgb<0.92, 0.92, 0.94> }
  finish { ambient 0.6 diffuse 0.4 }
}

// Floor - matte, no reflection
plane { y, 0
  pigment { rgb<0.88, 0.88, 0.90> }
  finish { diffuse 0.9 ambient 0.1 }
}

// Base platform - subtle
box { <-7, 0, -3>, <7, 0.15, 5>
  pigment { rgb<0.75, 0.75, 0.78> }
  finish { diffuse 0.9 }
}

// Corporate color palette - muted blues/grays
#declare Color_Q1 = rgb<0.25, 0.40, 0.55>;  // Dark blue-gray
#declare Color_Q2 = rgb<0.35, 0.50, 0.65>;  // Medium blue
#declare Color_Q3 = rgb<0.45, 0.58, 0.72>;  // Light blue
#declare Color_Q4 = rgb<0.20, 0.35, 0.50>;  // Navy

#declare Bar_Finish = finish {
  diffuse 0.85
  phong 0.2
  phong_size 20
  ambient 0.15
}

// Bar dimensions
#declare Bar_W = 1.6;
#declare Bar_D = 2.0;

// Q1 Bar
box { <0, 0, 0>, <Bar_W, 6.5, Bar_D>
  pigment { Color_Q1 }
  finish { Bar_Finish }
  translate <-5, 0.15, 0>
}

// Q2 Bar
box { <0, 0, 0>, <Bar_W, 8.2, Bar_D>
  pigment { Color_Q2 }
  finish { Bar_Finish }
  translate <-2, 0.15, 0>
}

// Q3 Bar
box { <0, 0, 0>, <Bar_W, 7.8, Bar_D>
  pigment { Color_Q3 }
  finish { Bar_Finish }
  translate <1, 0.15, 0>
}

// Q4 Bar
box { <0, 0, 0>, <Bar_W, 10.5, Bar_D>
  pigment { Color_Q4 }
  finish { Bar_Finish }
  translate <4, 0.15, 0>
}

// Simple axis lines - thin, gray
#declare Axis_Color = rgb<0.5, 0.5, 0.52>;

// X-Axis
cylinder { <-6.5, 0.16, -0.3>, <6.5, 0.16, -0.3>, 0.04
  pigment { Axis_Color }
  finish { diffuse 0.8 }
}

// Y-Axis
cylinder { <-6.5, 0.16, -0.3>, <-6.5, 11, -0.3>, 0.04
  pigment { Axis_Color }
  finish { diffuse 0.8 }
}

// Minimal grid lines - very subtle
#declare Grid_Color = rgb<0.7, 0.7, 0.72>;

cylinder { <-6.5, 2.5, -0.3>, <6.5, 2.5, -0.3>, 0.02
  pigment { Grid_Color }
}
cylinder { <-6.5, 5, -0.3>, <6.5, 5, -0.3>, 0.02
  pigment { Grid_Color }
}
cylinder { <-6.5, 7.5, -0.3>, <6.5, 7.5, -0.3>, 0.02
  pigment { Grid_Color }
}
cylinder { <-6.5, 10, -0.3>, <6.5, 10, -0.3>, 0.02
  pigment { Grid_Color }
}

// Text styling - facing camera at <10, 12, -16>
#declare Text_Color = rgb<0.3, 0.3, 0.35>;
#declare Text_Finish = finish { diffuse 0.9 ambient 0.1 }

// Y-Axis labels (values) - flat on left side
text { ttf "crystal.ttf" "0" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.6
  rotate <0, 60, 0>
  translate <-7.2, 0.3, -1.5>
}

text { ttf "crystal.ttf" "25" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.6
  rotate <0, 60, 0>
  translate <-7.4, 2.5, -1.5>
}

text { ttf "crystal.ttf" "50" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.6
  rotate <0, 60, 0>
  translate <-7.4, 5, -1.5>
}

text { ttf "crystal.ttf" "75" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.6
  rotate <0, 60, 0>
  translate <-7.4, 7.5, -1.5>
}

text { ttf "crystal.ttf" "100" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.6
  rotate <0, 60, 0>
  translate <-7.6, 10, -1.5>
}

// X-Axis labels (quarters) - flat on floor facing camera
text { ttf "crystal.ttf" "Q1" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.7
  rotate <-90, 0, 0>
  rotate <0, 60, 0>
  translate <-4.2, 0.17, -1.5>
}

text { ttf "crystal.ttf" "Q2" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.7
  rotate <-90, 0, 0>
  rotate <0, 60, 0>
  translate <-1.2, 0.17, -1.5>
}

text { ttf "crystal.ttf" "Q3" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.7
  rotate <-90, 0, 0>
  rotate <0, 60, 0>
  translate <1.8, 0.17, -1.5>
}

text { ttf "crystal.ttf" "Q4" 0.1, 0
  pigment { Text_Color }
  finish { Text_Finish }
  scale 0.7
  rotate <-90, 0, 0>
  rotate <0, 60, 0>
  translate <4.8, 0.17, -1.5>
}
