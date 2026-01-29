// ============================================================================
// POV-RAY BUSINESS GRAPHICS FRAMEWORK - Core Library
// Version 1.0
// ============================================================================
// Usage: #include "bg_core.inc"
// ============================================================================

#version 3.7;

// ============================================================================
// COLOR SCHEMES
// ============================================================================

// Corporate Blue (Default)
#declare BG_Blue_1 = rgb<0.20, 0.35, 0.55>;
#declare BG_Blue_2 = rgb<0.30, 0.45, 0.65>;
#declare BG_Blue_3 = rgb<0.40, 0.55, 0.75>;
#declare BG_Blue_4 = rgb<0.50, 0.65, 0.85>;
#declare BG_Blue_5 = rgb<0.60, 0.75, 0.90>;

// Corporate Gray
#declare BG_Gray_1 = rgb<0.25, 0.25, 0.28>;
#declare BG_Gray_2 = rgb<0.40, 0.40, 0.43>;
#declare BG_Gray_3 = rgb<0.55, 0.55, 0.58>;
#declare BG_Gray_4 = rgb<0.70, 0.70, 0.73>;
#declare BG_Gray_5 = rgb<0.85, 0.85, 0.88>;

// Corporate Green
#declare BG_Green_1 = rgb<0.15, 0.40, 0.25>;
#declare BG_Green_2 = rgb<0.20, 0.50, 0.30>;
#declare BG_Green_3 = rgb<0.30, 0.60, 0.40>;
#declare BG_Green_4 = rgb<0.45, 0.70, 0.50>;
#declare BG_Green_5 = rgb<0.60, 0.80, 0.65>;

// Corporate Orange
#declare BG_Orange_1 = rgb<0.70, 0.35, 0.15>;
#declare BG_Orange_2 = rgb<0.80, 0.45, 0.20>;
#declare BG_Orange_3 = rgb<0.90, 0.55, 0.25>;
#declare BG_Orange_4 = rgb<0.95, 0.65, 0.35>;
#declare BG_Orange_5 = rgb<1.00, 0.75, 0.50>;

// Status Colors
#declare BG_Success = rgb<0.20, 0.65, 0.35>;
#declare BG_Warning = rgb<0.90, 0.70, 0.20>;
#declare BG_Danger = rgb<0.75, 0.25, 0.25>;
#declare BG_Info = rgb<0.25, 0.55, 0.80>;

// Neutral
#declare BG_White = rgb<0.95, 0.95, 0.96>;
#declare BG_Black = rgb<0.10, 0.10, 0.12>;
#declare BG_Background = rgb<0.92, 0.92, 0.94>;
#declare BG_Floor = rgb<0.88, 0.88, 0.90>;
#declare BG_PlatformColor = rgb<0.75, 0.75, 0.78>;
#declare BG_Axis = rgb<0.50, 0.50, 0.52>;
#declare BG_Grid = rgb<0.70, 0.70, 0.72>;

// ============================================================================
// MATERIALS / FINISHES
// ============================================================================

#declare BG_Matte = finish {
  diffuse 0.85
  ambient 0.15
}

#declare BG_Satin = finish {
  diffuse 0.80
  phong 0.2
  phong_size 20
  ambient 0.12
}

#declare BG_Gloss = finish {
  diffuse 0.75
  phong 0.5
  phong_size 60
  ambient 0.10
}

#declare BG_Metal = finish {
  diffuse 0.6
  phong 0.8
  phong_size 100
  metallic
  ambient 0.08
}

// ============================================================================
// GLOBAL SETTINGS PRESETS
// ============================================================================

#macro BG_GlobalSettings()
  global_settings {
    assumed_gamma 1.0
  }
#end

// ============================================================================
// CAMERA PRESETS
// ============================================================================

#macro BG_Camera_Perspective(LookAtPoint, Distance, Height, Angle)
  camera {
    location LookAtPoint + <Distance * 0.6, Height, -Distance>
    look_at LookAtPoint
    angle Angle
  }
#end

#macro BG_Camera_Front(LookAtPoint, Distance)
  camera {
    location LookAtPoint + <0, Distance * 0.3, -Distance>
    look_at LookAtPoint
    angle 45
  }
#end

#macro BG_Camera_Side(LookAtPoint, Distance)
  camera {
    location LookAtPoint + <Distance, Distance * 0.5, 0>
    look_at LookAtPoint
    angle 45
  }
#end

#macro BG_Camera_Top(LookAtPoint, Distance)
  camera {
    location LookAtPoint + <0, Distance, -Distance * 0.1>
    look_at LookAtPoint
    angle 45
  }
#end

// ============================================================================
// LIGHTING PRESETS
// ============================================================================

#macro BG_Light_Studio()
  light_source { <12, 20, -15> color rgb<0.95, 0.95, 0.95> }
  light_source { <-10, 15, -10> color rgb<0.40, 0.40, 0.42> }
#end

#macro BG_Light_Soft()
  light_source { <10, 25, -12> color rgb<0.85, 0.85, 0.85> }
  light_source { <-8, 18, -8> color rgb<0.35, 0.35, 0.38> }
  light_source { <0, 30, 5> color rgb<0.25, 0.25, 0.25> }
#end

#macro BG_Light_Dramatic()
  light_source { <15, 25, -20> color rgb<1.0, 0.98, 0.95> }
  light_source { <-12, 10, -5> color rgb<0.20, 0.22, 0.28> }
#end

// ============================================================================
// BACKGROUND & ENVIRONMENT
// ============================================================================

#macro BG_Environment_Light()
  plane { z, 50
    pigment { BG_Background }
    finish { diffuse 0.6 }
  }
  plane { y, 0
    pigment { BG_Floor }
    finish { diffuse 0.9 }
  }
#end

#macro BG_Environment_Dark()
  plane { z, 50
    pigment { rgb<0.15, 0.17, 0.22> }
    finish { diffuse 0.6 }
  }
  plane { y, 0
    pigment { rgb<0.12, 0.14, 0.18> }
    finish { diffuse 0.9 }
  }
#end

#macro BG_Platform(PMinX, PMaxX, PMinZ, PMaxZ, PHeight)
  box { <PMinX, 0, PMinZ>, <PMaxX, PHeight, PMaxZ>
    pigment { BG_PlatformColor }
    finish { BG_Satin }
  }
#end

// ============================================================================
// AXIS SYSTEM
// ============================================================================

#macro BG_Axis_X(StartX, EndX, Y, Z)
  cylinder { <StartX, Y, Z>, <EndX, Y, Z>, 0.04
    pigment { BG_Axis }
    finish { BG_Matte }
  }
#end

#macro BG_Axis_Y(X, StartY, EndY, Z)
  cylinder { <X, StartY, Z>, <X, EndY, Z>, 0.04
    pigment { BG_Axis }
    finish { BG_Matte }
  }
#end

#macro BG_GridLine_H(StartX, EndX, Y, Z)
  cylinder { <StartX, Y, Z>, <EndX, Y, Z>, 0.02
    pigment { BG_Grid }
    finish { BG_Matte }
  }
#end

#macro BG_GridLines(GStartX, GEndX, GStartY, GEndY, GZ, GStep)
  #local GCurrentY = GStartY + GStep;
  #while (GCurrentY < GEndY)
    BG_GridLine_H(GStartX, GEndX, GCurrentY, GZ)
    #local GCurrentY = GCurrentY + GStep;
  #end
#end
