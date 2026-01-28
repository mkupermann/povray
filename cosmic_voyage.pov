// COSMIC VOYAGE - Epic Space Scene
// Featuring planets, moons, asteroids, nebula, and a distant galaxy
#version 3.7;

global_settings {
  assumed_gamma 1.0
  max_trace_level 10
}

// Camera positioned for dramatic view
camera {
  location <0, 5, -40>
  look_at <0, 0, 20>
  angle 60
}

// Distant sun - primary light source
light_source { <100, 50, -50> color rgb<1.0, 0.95, 0.8> }

// Ambient fill light
light_source { <-50, 30, 0> color rgb<0.2, 0.2, 0.4> }

// Deep space background with stars
plane { z, 500
  pigment {
    gradient y
    color_map {
      [0.0 rgb<0.0, 0.0, 0.02>]
      [0.3 rgb<0.02, 0.0, 0.05>]
      [0.5 rgb<0.03, 0.02, 0.08>]
      [0.7 rgb<0.02, 0.0, 0.05>]
      [1.0 rgb<0.0, 0.0, 0.02>]
    }
    scale 200
  }
  finish { ambient 1.0 }
}

// Nebula cloud effect - colorful cosmic gas
sphere { <80, 30, 200>, 120
  pigment { rgbt<0.8, 0.2, 0.5, 0.85> }
  finish { ambient 0.6 }
}

sphere { <60, 20, 180>, 80
  pigment { rgbt<0.3, 0.5, 0.9, 0.88> }
  finish { ambient 0.5 }
}

sphere { <100, 40, 220>, 100
  pigment { rgbt<0.9, 0.4, 0.2, 0.87> }
  finish { ambient 0.5 }
}

// Main planet - Gas giant with bands
sphere { <15, 0, 30>, 12
  pigment {
    gradient y
    color_map {
      [0.0 rgb<0.6, 0.4, 0.3>]
      [0.15 rgb<0.8, 0.6, 0.4>]
      [0.25 rgb<0.7, 0.5, 0.35>]
      [0.35 rgb<0.9, 0.7, 0.5>]
      [0.45 rgb<0.6, 0.4, 0.3>]
      [0.55 rgb<0.8, 0.55, 0.4>]
      [0.65 rgb<0.7, 0.45, 0.35>]
      [0.75 rgb<0.9, 0.65, 0.45>]
      [0.85 rgb<0.6, 0.4, 0.3>]
      [1.0 rgb<0.7, 0.5, 0.4>]
    }
    scale 12
    turbulence 0.3
  }
  finish {
    phong 0.3
    phong_size 50
    ambient 0.1
  }
  rotate <10, -20, 5>
}

// Planet ring system
torus { 18, 3
  pigment {
    gradient x
    color_map {
      [0.0 rgbt<0.7, 0.6, 0.5, 0.3>]
      [0.2 rgbt<0.8, 0.7, 0.6, 0.5>]
      [0.4 rgbt<0.6, 0.5, 0.4, 0.4>]
      [0.6 rgbt<0.7, 0.6, 0.5, 0.3>]
      [0.8 rgbt<0.8, 0.7, 0.6, 0.5>]
      [1.0 rgbt<0.6, 0.5, 0.4, 0.4>]
    }
    turbulence 0.1
  }
  finish { ambient 0.2 phong 0.2 }
  scale <1, 0.02, 1>
  rotate <75, 0, 15>
  translate <15, 0, 30>
}

// Ice moon
sphere { <-5, 8, 25>, 3
  pigment {
    marble
    color_map {
      [0.0 rgb<0.85, 0.9, 0.95>]
      [0.4 rgb<0.7, 0.8, 0.85>]
      [0.7 rgb<0.9, 0.92, 0.95>]
      [1.0 rgb<0.75, 0.82, 0.88>]
    }
    turbulence 0.5
    scale 2
  }
  finish {
    phong 0.5
    phong_size 80
    reflection 0.1
    ambient 0.1
  }
}

// Volcanic moon
sphere { <28, -6, 35>, 2.5
  pigment {
    granite
    color_map {
      [0.0 rgb<0.3, 0.2, 0.15>]
      [0.3 rgb<0.5, 0.3, 0.2>]
      [0.5 rgb<0.8, 0.4, 0.1>]
      [0.7 rgb<0.4, 0.25, 0.15>]
      [1.0 rgb<0.3, 0.2, 0.1>]
    }
    scale 1.5
  }
  finish {
    phong 0.3
    phong_size 30
    ambient 0.15
  }
}

// Rocky planet in distance
sphere { <-25, -5, 60>, 8
  pigment {
    agate
    color_map {
      [0.0 rgb<0.4, 0.35, 0.3>]
      [0.3 rgb<0.5, 0.45, 0.4>]
      [0.6 rgb<0.35, 0.3, 0.25>]
      [1.0 rgb<0.45, 0.4, 0.35>]
    }
    scale 4
  }
  finish {
    phong 0.2
    phong_size 40
    ambient 0.08
  }
}

// Earth-like planet with atmosphere
sphere { <-40, 15, 100>, 15
  pigment {
    marble
    color_map {
      [0.0 rgb<0.1, 0.3, 0.6>]
      [0.3 rgb<0.2, 0.5, 0.3>]
      [0.5 rgb<0.15, 0.35, 0.55>]
      [0.7 rgb<0.25, 0.45, 0.35>]
      [1.0 rgb<0.1, 0.3, 0.5>]
    }
    turbulence 0.4
    scale 8
  }
  finish {
    phong 0.4
    phong_size 60
    ambient 0.1
  }
}

// Atmosphere glow
sphere { <-40, 15, 100>, 15.8
  pigment { rgbt<0.5, 0.7, 1.0, 0.92> }
  finish { ambient 0.4 }
}

// Asteroid belt
#declare Asteroid = sphere { <0, 0, 0>, 1
  pigment {
    granite
    color_map {
      [0.0 rgb<0.25, 0.22, 0.2>]
      [0.5 rgb<0.35, 0.32, 0.3>]
      [1.0 rgb<0.3, 0.27, 0.25>]
    }
    scale 0.5
  }
  finish { phong 0.2 ambient 0.1 }
}

// Scattered asteroids
object { Asteroid scale <0.8, 0.5, 0.6> translate <-8, -3, 10> }
object { Asteroid scale <0.6, 0.4, 0.5> translate <-12, 2, 8> }
object { Asteroid scale <1.2, 0.8, 1.0> translate <-5, -5, 15> }
object { Asteroid scale <0.5, 0.3, 0.4> translate <-15, -1, 12> }
object { Asteroid scale <0.9, 0.6, 0.7> translate <-3, 1, 5> }
object { Asteroid scale <0.4, 0.25, 0.35> translate <-10, 4, 7> }
object { Asteroid scale <0.7, 0.5, 0.6> translate <-18, -2, 18> }
object { Asteroid scale <1.0, 0.7, 0.8> translate <-6, -4, 3> }
object { Asteroid scale <0.55, 0.35, 0.45> translate <-14, 3, 14> }
object { Asteroid scale <0.85, 0.55, 0.65> translate <-2, -2, 9> }

// Distant stars - bright points
#declare Star = sphere { <0, 0, 0>, 0.3
  pigment { rgb<1, 1, 1> }
  finish { ambient 1.0 }
}

// Star field
object { Star translate <50, 40, 400> }
object { Star scale 0.7 translate <-60, 50, 380> }
object { Star scale 0.5 translate <30, -30, 420> }
object { Star scale 0.8 translate <-40, -45, 390> }
object { Star scale 0.6 translate <70, 20, 410> }
object { Star scale 0.9 translate <-80, 35, 370> }
object { Star scale 0.4 translate <20, 55, 430> }
object { Star scale 0.7 translate <-30, -20, 400> }
object { Star scale 0.5 translate <55, -40, 385> }
object { Star scale 0.8 translate <-70, 10, 415> }
object { Star scale 0.6 translate <40, 45, 395> }
object { Star scale 0.4 translate <-50, -35, 425> }
object { Star scale 0.9 translate <65, 5, 375> }
object { Star scale 0.5 translate <-25, 60, 405> }
object { Star scale 0.7 translate <35, -15, 435> }
object { Star scale 0.6 translate <-55, 25, 380> }
object { Star scale 0.8 translate <45, 35, 420> }
object { Star scale 0.4 translate <-35, -50, 390> }
object { Star scale 0.5 translate <75, -25, 410> }
object { Star scale 0.9 translate <-65, 45, 400> }

// Comet with tail
union {
  // Comet nucleus
  sphere { <0, 0, 0>, 0.8
    pigment { rgb<0.6, 0.65, 0.7> }
    finish { phong 0.5 ambient 0.2 }
  }
  // Comet coma
  sphere { <0, 0, 0>, 2
    pigment { rgbt<0.7, 0.8, 0.9, 0.85> }
    finish { ambient 0.5 }
  }
  // Comet tail
  cone { <0, 0, 0>, 1.5, <-25, 5, -8>, 0.1
    pigment { rgbt<0.6, 0.75, 0.9, 0.9> }
    finish { ambient 0.6 }
  }
  translate <30, 20, 50>
}

// Space station in orbit
union {
  // Main body
  cylinder { <-3, 0, 0>, <3, 0, 0>, 0.8
    pigment { rgb<0.7, 0.7, 0.75> }
    finish { phong 0.8 phong_size 100 reflection 0.3 metallic }
  }
  // Solar panels
  box { <-4, -0.05, -3>, <-2, 0.05, 3>
    pigment { rgb<0.1, 0.15, 0.3> }
    finish { phong 0.6 reflection 0.2 }
  }
  box { <2, -0.05, -3>, <4, 0.05, 3>
    pigment { rgb<0.1, 0.15, 0.3> }
    finish { phong 0.6 reflection 0.2 }
  }
  // Docking module
  sphere { <0, 0, 0>, 1.2
    pigment { rgb<0.75, 0.75, 0.8> }
    finish { phong 0.8 phong_size 80 reflection 0.25 metallic }
  }
  scale 0.5
  translate <-10, 5, 15>
}

// Distant spiral galaxy
disc { <0, 0, 0>, <0, 0, -1>, 30, 5
  pigment {
    spiral1 8
    color_map {
      [0.0 rgbt<0.9, 0.8, 0.6, 0.7>]
      [0.3 rgbt<0.7, 0.6, 0.9, 0.85>]
      [0.6 rgbt<0.8, 0.7, 0.5, 0.8>]
      [1.0 rgbt<0.6, 0.5, 0.8, 0.9>]
    }
    turbulence 0.2
  }
  finish { ambient 0.8 }
  rotate <60, 30, 0>
  translate <-100, 60, 350>
}
