// ============================================================================
// EXAMPLE: Multi-Series Chart - Product Lines
// ============================================================================

#version 3.7;

#include "bg_core.inc"
#include "bg_charts.inc"

BG_GlobalSettings()

// Camera & Lighting
BG_Camera_Perspective(<0, 5, 2>, 22, 14, 45)
BG_Light_Soft()

// Environment
BG_Environment_Light()
BG_Platform(-10, 10, -2, 10, 0.15)

// Axis System
BG_Axis_X(-9, 9, 0.16, -0.5)
BG_Axis_Y(-9, 0.16, 10, -0.5)
BG_GridLines(-9, 9, 0, 10, -0.5, 2)

// Product A (front row)
BG_Bar(-6, 0, 4.5, 1.5, 1.8, BG_Blue_1)
BG_Bar(-3, 0, 6.2, 1.5, 1.8, BG_Blue_1)
BG_Bar(0, 0, 7.8, 1.5, 1.8, BG_Blue_1)
BG_Bar(3, 0, 8.5, 1.5, 1.8, BG_Blue_1)

// Product B (middle row)
BG_Bar(-6, 2.5, 3.2, 1.5, 1.8, BG_Green_2)
BG_Bar(-3, 2.5, 4.8, 1.5, 1.8, BG_Green_2)
BG_Bar(0, 2.5, 5.5, 1.5, 1.8, BG_Green_2)
BG_Bar(3, 2.5, 6.2, 1.5, 1.8, BG_Green_2)

// Product C (back row)
BG_Bar(-6, 5, 2.0, 1.5, 1.8, BG_Orange_2)
BG_Bar(-3, 5, 3.5, 1.5, 1.8, BG_Orange_2)
BG_Bar(0, 5, 4.2, 1.5, 1.8, BG_Orange_2)
BG_Bar(3, 5, 5.0, 1.5, 1.8, BG_Orange_2)
