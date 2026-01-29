// ============================================================================
// EXAMPLE: Bar Chart - Quarterly Revenue
// ============================================================================

#version 3.7;

#include "bg_core.inc"
#include "bg_charts.inc"

BG_GlobalSettings()

// Camera & Lighting
BG_Camera_Perspective(<0, 4, 0>, 18, 10, 45)
BG_Light_Studio()

// Environment
BG_Environment_Light()
BG_Platform(-8, 8, -3, 6, 0.15)

// Axis System
BG_Axis_X(-7, 7, 0.16, -0.5)
BG_Axis_Y(-7, 0.16, 12, -0.5)
BG_GridLines(-7, 7, 0, 12, -0.5, 2.5)

// Data: Q1=6.5, Q2=8.2, Q3=7.8, Q4=10.5
BG_BarChart_4(
  6.5, 8.2, 7.8, 10.5,
  BG_Blue_1, BG_Blue_2, BG_Blue_3, BG_Blue_4,
  1.8, 2.2, 1.0
)
