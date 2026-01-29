// ============================================================================
// POV-RAY BUSINESS GRAPHICS FRAMEWORK - Charts Library
// Version 1.0
// ============================================================================
// Usage: #include "bg_charts.inc"
// Requires: bg_core.inc
// ============================================================================

// ============================================================================
// BAR CHART MACROS
// ============================================================================

#macro BG_Bar(X, Z, Height, Width, Depth, Color)
  box { <0, 0, 0>, <Width, Height, Depth>
    pigment { Color }
    finish { BG_Satin }
    translate <X, 0.15, Z>
  }
#end

#macro BG_Bar_Rounded(X, Z, Height, Width, Depth, Color, Radius)
  union {
    box { <Radius, 0, 0>, <Width - Radius, Height - Radius, Depth>
      pigment { Color }
    }
    box { <0, 0, Radius>, <Width, Height - Radius, Depth - Radius>
      pigment { Color }
    }
    cylinder { <Radius, Height - Radius, Radius>, <Width - Radius, Height - Radius, Radius>, Radius
      pigment { Color }
    }
    cylinder { <Radius, Height - Radius, Depth - Radius>, <Width - Radius, Height - Radius, Depth - Radius>, Radius
      pigment { Color }
    }
    sphere { <Radius, Height - Radius, Radius>, Radius pigment { Color } }
    sphere { <Width - Radius, Height - Radius, Radius>, Radius pigment { Color } }
    sphere { <Radius, Height - Radius, Depth - Radius>, Radius pigment { Color } }
    sphere { <Width - Radius, Height - Radius, Depth - Radius>, Radius pigment { Color } }
    finish { BG_Satin }
    translate <X, 0.15, Z>
  }
#end

#macro BG_BarChart_4(V1, V2, V3, V4, C1, C2, C3, C4, BarWidth, BarDepth, Spacing)
  #local StartX = -(Spacing * 1.5 + BarWidth * 2);
  BG_Bar(StartX, 0, V1, BarWidth, BarDepth, C1)
  BG_Bar(StartX + Spacing + BarWidth, 0, V2, BarWidth, BarDepth, C2)
  BG_Bar(StartX + (Spacing + BarWidth) * 2, 0, V3, BarWidth, BarDepth, C3)
  BG_Bar(StartX + (Spacing + BarWidth) * 3, 0, V4, BarWidth, BarDepth, C4)
#end

#macro BG_BarChart_6(V1, V2, V3, V4, V5, V6, C1, C2, C3, C4, C5, C6, BarWidth, BarDepth, Spacing)
  #local StartX = -(Spacing * 2.5 + BarWidth * 3);
  BG_Bar(StartX, 0, V1, BarWidth, BarDepth, C1)
  BG_Bar(StartX + Spacing + BarWidth, 0, V2, BarWidth, BarDepth, C2)
  BG_Bar(StartX + (Spacing + BarWidth) * 2, 0, V3, BarWidth, BarDepth, C3)
  BG_Bar(StartX + (Spacing + BarWidth) * 3, 0, V4, BarWidth, BarDepth, C4)
  BG_Bar(StartX + (Spacing + BarWidth) * 4, 0, V5, BarWidth, BarDepth, C5)
  BG_Bar(StartX + (Spacing + BarWidth) * 5, 0, V6, BarWidth, BarDepth, C6)
#end

// ============================================================================
// PIE CHART MACROS
// ============================================================================

#macro BG_PieSlice(CenterX, CenterY, CenterZ, Radius, Height, StartAngle, EndAngle, Color)
  #local Steps = 20;
  #local AngleStep = (EndAngle - StartAngle) / Steps;
  prism {
    linear_spline
    0, Height,
    Steps + 2,
    <0, 0>,
    #local I = 0;
    #while (I <= Steps)
      #local A = radians(StartAngle + I * AngleStep);
      <Radius * cos(A), Radius * sin(A)>,
      #local I = I + 1;
    #end
    <0, 0>
    pigment { Color }
    finish { BG_Satin }
    rotate <-90, 0, 0>
    translate <CenterX, CenterY, CenterZ>
  }
#end

#macro BG_PieChart_4(X, Y, Z, Radius, Height, P1, P2, P3, P4, C1, C2, C3, C4)
  #local A1 = 0;
  #local A2 = A1 + P1 * 3.6;
  #local A3 = A2 + P2 * 3.6;
  #local A4 = A3 + P3 * 3.6;
  BG_PieSlice(X, Y, Z, Radius, Height, A1, A2, C1)
  BG_PieSlice(X, Y, Z, Radius, Height, A2, A3, C2)
  BG_PieSlice(X, Y, Z, Radius, Height, A3, A4, C3)
  BG_PieSlice(X, Y, Z, Radius, Height, A4, 360, C4)
#end

// ============================================================================
// LINE CHART MACROS
// ============================================================================

#macro BG_DataPoint(X, Y, Z, Radius, Color)
  sphere { <X, Y, Z>, Radius
    pigment { Color }
    finish { BG_Gloss }
  }
#end

#macro BG_DataLine(X1, Y1, Z1, X2, Y2, Z2, Radius, Color)
  cylinder { <X1, Y1, Z1>, <X2, Y2, Z2>, Radius
    pigment { Color }
    finish { BG_Satin }
  }
#end

#macro BG_LineChart_Point(X, Y, Z, PointRadius, Color)
  BG_DataPoint(X, Y, Z, PointRadius, Color)
#end

// ============================================================================
// AREA CHART MACROS
// ============================================================================

#macro BG_AreaBar(X, Z, Height, Width, Depth, Color, Alpha)
  box { <0, 0, 0>, <Width, Height, Depth>
    pigment { rgbt<Color.red, Color.green, Color.blue, Alpha> }
    finish { BG_Matte }
    translate <X, 0.15, Z>
  }
#end

// ============================================================================
// GAUGE / METER MACROS
// ============================================================================

#macro BG_GaugeArc(CenterX, CenterY, CenterZ, InnerR, OuterR, StartAngle, EndAngle, Color)
  difference {
    cylinder { <0, -0.1, 0>, <0, 0.1, 0>, OuterR }
    cylinder { <0, -0.2, 0>, <0, 0.2, 0>, InnerR }
    box { <-OuterR * 1.1, -0.2, -OuterR * 1.1>, <OuterR * 1.1, 0.2, 0> }
    pigment { Color }
    finish { BG_Satin }
    rotate <90, 0, StartAngle>
    translate <CenterX, CenterY, CenterZ>
  }
#end

// ============================================================================
// COMPARISON ARROWS
// ============================================================================

#macro BG_Arrow_Up(X, Y, Z, Height, Color)
  union {
    cylinder { <0, 0, 0>, <0, Height * 0.7, 0>, 0.1 }
    cone { <0, Height * 0.7, 0>, 0.25, <0, Height, 0>, 0 }
    pigment { Color }
    finish { BG_Satin }
    translate <X, Y, Z>
  }
#end

#macro BG_Arrow_Down(X, Y, Z, Height, Color)
  union {
    cylinder { <0, Height * 0.3, 0>, <0, Height, 0>, 0.1 }
    cone { <0, Height * 0.3, 0>, 0.25, <0, 0, 0>, 0 }
    pigment { Color }
    finish { BG_Satin }
    translate <X, Y, Z>
  }
#end
