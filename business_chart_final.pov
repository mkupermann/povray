// BUSINESS CHART - Clean Version (No Labels)
// Add labels in post-processing with 2D tool
#version 3.7;

global_settings {
  assumed_gamma 1.0
}

camera {
  location <10, 12, -16>
  look_at <0, 3, 0>
  angle 45
}

// Soft lighting
light_source { <10, 20, -15> color rgb<0.95, 0.95, 0.95> }
light_source { <-8, 15, -10> color rgb<0.4, 0.4, 0.4> }

// Light gray background
plane { z, 40
  pigment { rgb<0.92, 0.92, 0.94> }
  finish { diffuse 0.6 }
}

// Floor
plane { y, 0
  pigment { rgb<0.88, 0.88, 0.90> }
  finish { diffuse 0.9 }
}

// Base platform
box { <-7, 0, -3>, <7, 0.15, 5>
  pigment { rgb<0.75, 0.75, 0.78> }
  finish { diffuse 0.9 }
}

// Corporate blue palette
#declare Color_Q1 = rgb<0.25, 0.40, 0.55>;
#declare Color_Q2 = rgb<0.35, 0.50, 0.65>;
#declare Color_Q3 = rgb<0.45, 0.58, 0.72>;
#declare Color_Q4 = rgb<0.20, 0.35, 0.50>;

#declare Bar_Finish = finish {
  diffuse 0.85
  phong 0.2
  phong_size 20
}

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

// Axis lines
#declare Axis_Color = rgb<0.5, 0.5, 0.52>;

cylinder { <-6.5, 0.16, -0.3>, <6.5, 0.16, -0.3>, 0.04
  pigment { Axis_Color }
}

cylinder { <-6.5, 0.16, -0.3>, <-6.5, 11, -0.3>, 0.04
  pigment { Axis_Color }
}

// Grid lines
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
