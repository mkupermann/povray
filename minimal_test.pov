#version 3.7;

global_settings { assumed_gamma 1.0 }

camera {
  location <0, 0, -5>
  look_at <0, 0, 0>
  angle 60
}

light_source { <5, 5, -5> color rgb<1, 1, 1> }

sphere { <0, 0, 0>, 1
  pigment { rgb<1, 0, 0> }
}
