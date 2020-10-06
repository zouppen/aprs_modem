// CSG.scad - Basic example of CSG usage

thinwall=0.8;
backwall=1.7;
cupdepth=8.25;
cupwidth=7.6;
margin=0.2;
backdepth=16.6;

// Square pipe, from origo
module sqpipe(d, w, h, wall) {
    difference() {
        cube([d,w,h]);
        translate([-wall,wall,wall]) {
            cube([d+2*wall,w-2*wall,h-2*wall]);
        }
    }
}

// PowerPolish contact cup, centered on y axis and nudged on z axis
module pole(d, w, h, wall) {
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

union() {
    // Front part
    difference() {
        union() {
            // Upper part
            pole(cupdepth+thinwall, cupwidth, cupwidth/2, thinwall, gap);
            // Lower part
            rotate([180,0,180]) {
                translate([-(cupdepth+thinwall),0,0]) {
                    pole(cupdepth+thinwall, cupwidth-2*thinwall-margin, cupwidth/2-thinwall-margin, thinwall);
                }
            }
        }
        cube([2*cupdepth,cupwidth+margin,margin], center=true);
    }

    // Back part
    translate([cupdepth,-cupwidth/2,-cupwidth/2]) {
        sqpipe(backdepth, cupwidth, cupwidth, backwall);
    }
}
