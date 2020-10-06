// CSG.scad - Basic example of CSG usage

thinwall=0.8;
poledepth=8.9;
gap=0.1;


module pole(d, w, h, wall, nudge) {
    translate([0,0,nudge]) {
        difference() {
            // Outer
            translate([0,-w/2,0]) {
                cube([d,w,h]);
            }
            // Inner
            translate([-thinwall,-w/2+wall,-wall]) {
                cube([d,w-2*wall,h]);
            }
        }
    }
}

pole(poledepth, 7.6, 3.8, thinwall, gap);

rotate([180,0,180]) {
    translate([-poledepth,0,0]) {
        pole(poledepth, 5.9, 2.4, thinwall,gap);
    }
}
