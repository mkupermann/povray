// BUSINESS CHART 3D - Professional 3D Bar Chart Visualization
// Quarterly Revenue Comparison
#version 3.7;

global_settings {
  assumed_gamma 1.0
  max_trace_level 10
}

// Camera - professional presentation angle
camera {
  location <12, 15, -18>
  look_at <0, 3, 0>
  angle 45
}

// Studio lighting setup
light_source { <15, 25, -20> color rgb<1.0, 0.98, 0.95> }
light_source { <-10, 20, -15> color rgb<0.6, 0.65, 0.7> }
light_source { <0, 30, 10> color rgb<0.5, 0.5, 0.5> }

// Clean gradient background
plane { z, 50
  pigment {
    gradient y
    color_map {
      [0.0 rgb<0.15, 0.18, 0.25>]
      [0.5 rgb<0.25, 0.30, 0.40>]
      [1.0 rgb<0.35, 0.40, 0.50>]
    }
    scale 40
  }
  finish { ambient 0.8 }
}

// Floor - polished surface
plane { y, 0
  pigment { rgb<0.12, 0.14, 0.18> }
  finish {
    reflection 0.4
    phong 0.8
    phong_size 100
    ambient 0.1
  }
}

// Base platform
box { <-8, -0.1, -4>, <8, 0.3, 6>
  pigment { rgb<0.2, 0.22, 0.28> }
  finish {
    reflection 0.2
    phong 0.6
    phong_size 80
  }
}

// Chart data - Quarterly Revenue (in units for bar height)
// Q1: 6.5, Q2: 8.2, Q3: 7.8, Q4: 10.5

// Color definitions
#declare Color_Q1 = rgb<0.2, 0.5, 0.9>;   // Blue
#declare Color_Q2 = rgb<0.3, 0.75, 0.4>;  // Green
#declare Color_Q3 = rgb<0.95, 0.7, 0.2>;  // Orange
#declare Color_Q4 = rgb<0.85, 0.25, 0.3>; // Red

#declare Bar_Finish = finish {
  phong 0.9
  phong_size 60
  reflection 0.15
  ambient 0.15
}

#declare Glass_Finish = finish {
  phong 1.0
  phong_size 200
  reflection 0.25
  ambient 0.1
}

// Bar dimensions
#declare Bar_Width = 1.8;
#declare Bar_Depth = 2.5;
#declare Bar_Spacing = 3.5;

// Q1 Bar - Blue
box { <0, 0, 0>, <Bar_Width, 6.5, Bar_Depth>
  pigment { Color_Q1 }
  finish { Bar_Finish }
  translate <-5.5, 0.3, 0>
}

// Q2 Bar - Green
box { <0, 0, 0>, <Bar_Width, 8.2, Bar_Depth>
  pigment { Color_Q2 }
  finish { Bar_Finish }
  translate <-2, 0.3, 0>
}

// Q3 Bar - Orange
box { <0, 0, 0>, <Bar_Width, 7.8, Bar_Depth>
  pigment { Color_Q3 }
  finish { Bar_Finish }
  translate <1.5, 0.3, 0>
}

// Q4 Bar - Red (highest)
box { <0, 0, 0>, <Bar_Width, 10.5, Bar_Depth>
  pigment { Color_Q4 }
  finish { Bar_Finish }
  translate <5, 0.3, 0>
}

// Glass overlay effect on bars (subtle)
box { <0, 0, 0>, <Bar_Width * 0.4, 6.5, Bar_Depth * 0.1>
  pigment { rgbt<1, 1, 1, 0.85> }
  finish { Glass_Finish }
  translate <-5.5, 0.3, -0.05>
}

box { <0, 0, 0>, <Bar_Width * 0.4, 8.2, Bar_Depth * 0.1>
  pigment { rgbt<1, 1, 1, 0.85> }
  finish { Glass_Finish }
  translate <-2, 0.3, -0.05>
}

box { <0, 0, 0>, <Bar_Width * 0.4, 7.8, Bar_Depth * 0.1>
  pigment { rgbt<1, 1, 1, 0.85> }
  finish { Glass_Finish }
  translate <1.5, 0.3, -0.05>
}

box { <0, 0, 0>, <Bar_Width * 0.4, 10.5, Bar_Depth * 0.1>
  pigment { rgbt<1, 1, 1, 0.85> }
  finish { Glass_Finish }
  translate <5, 0.3, -0.05>
}

// X-Axis line
cylinder { <-7, 0.35, -0.5>, <7, 0.35, -0.5>, 0.08
  pigment { rgb<0.7, 0.7, 0.75> }
  finish { phong 0.8 metallic }
}

// Y-Axis line
cylinder { <-7, 0.35, -0.5>, <-7, 12, -0.5>, 0.08
  pigment { rgb<0.7, 0.7, 0.75> }
  finish { phong 0.8 metallic }
}

// Y-Axis grid lines
#declare GridLine = cylinder { <-7, 0, -0.5>, <7, 0, -0.5>, 0.03
  pigment { rgb<0.5, 0.5, 0.55> }
  finish { ambient 0.4 }
}

object { GridLine translate <0, 2.5, 0> }
object { GridLine translate <0, 5, 0> }
object { GridLine translate <0, 7.5, 0> }
object { GridLine translate <0, 10, 0> }

// Y-Axis markers (small spheres)
#declare AxisMarker = sphere { <0, 0, 0>, 0.15
  pigment { rgb<0.8, 0.8, 0.85> }
  finish { phong 0.9 metallic }
}

object { AxisMarker translate <-7, 2.5, -0.5> }
object { AxisMarker translate <-7, 5, -0.5> }
object { AxisMarker translate <-7, 7.5, -0.5> }
object { AxisMarker translate <-7, 10, -0.5> }

// Decorative elements - floating data points
sphere { <-4.6, 7.5, 1.25>, 0.25
  pigment { Color_Q1 * 1.3 }
  finish { phong 1.0 reflection 0.3 }
}

sphere { <-1.1, 9.2, 1.25>, 0.25
  pigment { Color_Q2 * 1.3 }
  finish { phong 1.0 reflection 0.3 }
}

sphere { <2.4, 8.8, 1.25>, 0.25
  pigment { Color_Q3 * 1.3 }
  finish { phong 1.0 reflection 0.3 }
}

sphere { <5.9, 11.5, 1.25>, 0.25
  pigment { Color_Q4 * 1.3 }
  finish { phong 1.0 reflection 0.3 }
}

// Trend line connecting the spheres
cylinder { <-4.6, 7.5, 1.25>, <-1.1, 9.2, 1.25>, 0.06
  pigment { rgb<0.9, 0.9, 0.95> }
  finish { phong 0.8 ambient 0.3 }
}

cylinder { <-1.1, 9.2, 1.25>, <2.4, 8.8, 1.25>, 0.06
  pigment { rgb<0.9, 0.9, 0.95> }
  finish { phong 0.8 ambient 0.3 }
}

cylinder { <2.4, 8.8, 1.25>, <5.9, 11.5, 1.25>, 0.06
  pigment { rgb<0.9, 0.9, 0.95> }
  finish { phong 0.8 ambient 0.3 }
}

// Growth arrow (Q4 success indicator)
union {
  // Arrow shaft
  cylinder { <6.8, 8, 3>, <6.8, 11, 3>, 0.12
    pigment { rgb<0.2, 0.8, 0.3> }
  }
  // Arrow head
  cone { <6.8, 11, 3>, 0.35, <6.8, 12, 3>, 0
    pigment { rgb<0.2, 0.8, 0.3> }
  }
  finish { phong 0.9 ambient 0.2 }
}

// Legend box background
box { <-7.5, 0.35, 4>, <-3, 3.5, 4.1>
  pigment { rgbt<0.1, 0.12, 0.15, 0.3> }
  finish { phong 0.5 reflection 0.1 }
}

// Legend color indicators
box { <-7.2, 2.8, 3.95>, <-6.5, 3.2, 4.15>
  pigment { Color_Q1 }
  finish { phong 0.8 }
}

box { <-7.2, 2.1, 3.95>, <-6.5, 2.5, 4.15>
  pigment { Color_Q2 }
  finish { phong 0.8 }
}

box { <-7.2, 1.4, 3.95>, <-6.5, 1.8, 4.15>
  pigment { Color_Q3 }
  finish { phong 0.8 }
}

box { <-7.2, 0.7, 3.95>, <-6.5, 1.1, 4.15>
  pigment { Color_Q4 }
  finish { phong 0.8 }
}

// Decorative corner accent
union {
  box { <6.5, 0.3, 4.5>, <7.5, 0.5, 5.5>
    pigment { rgb<0.3, 0.35, 0.45> }
  }
  sphere { <7, 0.8, 5>, 0.3
    pigment { rgb<0.8, 0.75, 0.2> }
    finish { phong 1.0 reflection 0.4 metallic }
  }
}
