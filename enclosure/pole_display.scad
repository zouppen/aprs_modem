use <powerpolish.scad>

// Test print for "standard" pair of plugs
translate([0,0,cupdepth+16.6]) rotate([0,90,0]) poles(2);

// Test print for casing
translate([11,0,cupdepth+wedge_slope*lower_pole_inner_h+thinwall]) rotate([0,90,0]) {
    poles(2,wedge_slope*lower_pole_inner_h+thinwall, framing=true, tongue=false);
}

// Test print for powerpole cap
translate([21,0,cupdepth+cupwidth/2]) rotate([0,90,0]) {
    poles(2,cupwidth/2, tongue=false, cap=true);
}
