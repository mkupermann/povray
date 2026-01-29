// ============================================================================
// EXAMPLE: Comparison Chart - Year over Year
// ============================================================================

#version 3.7;

#include "bg_core.inc"
#include "bg_charts.inc"

BG_GlobalSettings()

// Camera & Lighting
BG_Camera_Perspective(<0, 4, 0>, 20, 12, 45)
BG_Light_Studio()

// Environment
BG_Environment_Light()
BG_Platform(-10, 10, -3, 8, 0.15)

// Axis System
BG_Axis_X(-9, 9, 0.16, -0.5)
BG_Axis_Y(-9, 0.16, 12, -0.5)
BG_GridLines(-9, 9, 0, 12, -0.5, 3)

// Grouped Bar Chart: 2024 vs 2025
// Q1
BG_Bar(-7.5, 0, 5.5, 1.2, 2.0, BG_Gray_2)
BG_Bar(-6.0, 0, 6.5, 1.2, 2.0, BG_Blue_2)

// Q2
BG_Bar(-3.5, 0, 7.0, 1.2, 2.0, BG_Gray_2)
BG_Bar(-2.0, 0, 8.2, 1.2, 2.0, BG_Blue_2)

// Q3
BG_Bar(0.5, 0, 6.8, 1.2, 2.0, BG_Gray_2)
BG_Bar(2.0, 0, 7.8, 1.2, 2.0, BG_Blue_2)

// Q4
BG_Bar(4.5, 0, 8.5, 1.2, 2.0, BG_Gray_2)
BG_Bar(6.0, 0, 10.5, 1.2, 2.0, BG_Blue_2)

// Growth Indicators
BG_Arrow_Up(6.8, 10.5, 1, 2, BG_Success)
