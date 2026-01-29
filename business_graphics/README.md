# POV-Ray Business Graphics Framework

Professional 3D business chart rendering framework for POV-Ray.

## Installation

Copy the `business_graphics/` folder to your project.

## Usage

```pov
#version 3.7;
#include "bg_core.inc"
#include "bg_charts.inc"

BG_GlobalSettings()
BG_Camera_Perspective(<0, 4, 0>, 18, 10, 45)
BG_Light_Studio()
BG_Environment_Light()

// Your chart here...
```

## Render Command

```bash
./unix/povray +Iexample_bar_chart.pov +W1920 +H1080 +Ooutput.png +Q9 +A0.2
```

---

## Color Schemes

| Scheme | Variables |
|--------|-----------|
| Blue | `BG_Blue_1` to `BG_Blue_5` |
| Gray | `BG_Gray_1` to `BG_Gray_5` |
| Green | `BG_Green_1` to `BG_Green_5` |
| Orange | `BG_Orange_1` to `BG_Orange_5` |
| Status | `BG_Success`, `BG_Warning`, `BG_Danger`, `BG_Info` |

---

## Camera Presets

```pov
BG_Camera_Perspective(LookAt, Distance, Height, Angle)
BG_Camera_Front(LookAt, Distance)
BG_Camera_Side(LookAt, Distance)
BG_Camera_Top(LookAt, Distance)
```

---

## Lighting Presets

```pov
BG_Light_Studio()   // Default, clean
BG_Light_Soft()     // 3-point, soft shadows
BG_Light_Dramatic() // High contrast
```

---

## Environment

```pov
BG_Environment_Light()  // Light gray background
BG_Environment_Dark()   // Dark background
BG_Platform(MinX, MaxX, MinZ, MaxZ, Height)
```

---

## Chart Macros

### Bar Chart

```pov
// Single bar
BG_Bar(X, Z, Height, Width, Depth, Color)

// 4-bar chart
BG_BarChart_4(V1, V2, V3, V4, C1, C2, C3, C4, BarWidth, BarDepth, Spacing)

// 6-bar chart
BG_BarChart_6(V1, V2, V3, V4, V5, V6, C1, C2, C3, C4, C5, C6, BarWidth, BarDepth, Spacing)
```

### Pie Chart

```pov
// 4-segment pie (percentages must sum to 100)
BG_PieChart_4(X, Y, Z, Radius, Height, P1, P2, P3, P4, C1, C2, C3, C4)
```

### Line Chart Elements

```pov
BG_DataPoint(X, Y, Z, Radius, Color)
BG_DataLine(X1, Y1, Z1, X2, Y2, Z2, Radius, Color)
```

### Indicators

```pov
BG_Arrow_Up(X, Y, Z, Height, BG_Success)
BG_Arrow_Down(X, Y, Z, Height, BG_Danger)
```

---

## Axis & Grid

```pov
BG_Axis_X(StartX, EndX, Y, Z)
BG_Axis_Y(X, StartY, EndY, Z)
BG_GridLines(StartX, EndX, StartY, EndY, Z, Step)
```

---

## Examples

| File | Description |
|------|-------------|
| `example_bar_chart.pov` | Simple quarterly chart |
| `example_comparison.pov` | Year-over-year comparison |
| `example_multi_series.pov` | Multiple product lines |

---

## Post-Processing

POV-Ray renders 3D geometry only. Add text labels in:
- Figma
- PowerPoint / Keynote
- Photoshop / GIMP
- After Effects (for animation)

---

## License

MIT License
