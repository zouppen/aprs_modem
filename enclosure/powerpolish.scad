// CSG.scad - Basic example of CSG usage

thinwall=0.8;
backwall=1.7;
cupdepth=8.25;
cupwidth=7.6;
margin=0.2;

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
module poletip(d, w, h, wall) {
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

module pole(backdepth=16.6) {
    // Front part
    difference() {
        union() {
            // Upper part
            poletip(cupdepth+thinwall, cupwidth, cupwidth/2, thinwall);
            // Lower part
            rotate([180,0,180]) {
                translate([-(cupdepth+thinwall),0,0]) {
                    poletip(cupdepth+thinwall, cupwidth-2*thinwall-margin, cupwidth/2-thinwall-margin, thinwall);
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

difference() {
    union() {
        backdepth=16.6;
        polespacing=7.9;

        pole(backdepth);
        translate([0,polespacing,0]) {
            pole(backdepth);
        }

        // Gap filler and hole
        gapwidth=polespacing-cupwidth;
        translate([0,(polespacing-gapwidth)/2,margin/2]) {
            cube([backdepth+cupdepth,gapwidth,cupwidth/2-margin/2]);
        }
        translate([cupdepth, cupwidth/2, -cupwidth/2]) {
            cube([backdepth, gapwidth, cupwidth]);
        }
    }
    translate([10,cupwidth/2,-cupwidth]) {
        cylinder(cupwidth*2, 1, 1, $fn=16);
    }
}
