// Anderson PowerPole like housing
// compatible with original contacts.

thinwall=0.8;
backwall=1.7;
cupdepth=8.25;
cupwidth=7.6;
margin=0.2; // make the lower part a bit smaller
tongue_angle=10;
tongue_thickness=1;
tongue_rise=12.5; // Adjust this with the angle
tongue_depth=2.6; // From connector tip to tongue tip
tongue_width=3.7; // On y axis
conn_spacing=7.9; // Spacing between connectors
hole_x = 10;
hole_r = 1;

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

    translate([tongue_rise+tongue_depth,0,-cupwidth/2+thinwall+margin]) {
        tongue(tongue_angle, tongue_width, tongue_rise, tongue_thickness);
    }

    // Back part
    translate([cupdepth,-cupwidth/2,-cupwidth/2]) {
        sqpipe(backdepth, cupwidth, cupwidth, backwall);
    }
}

module tongue(angle, width, length, thickness) {
    intersection () {
        difference() {
            rotate([0,angle,0]) {
                cube([3*length,width,thickness], center=true);
            }
            translate([0,0,-length]) {
                cube([3*length,width*2,2*length], center=true);
            }
        }
        cube([2*length, 2*width, length*2], center=true); 
    }
}

module poles(count, backdepth=16.6) {
    difference() {
        union() {
            pole(backdepth);
            for (i = [1 : 1: count-1]) {
                translate([0,conn_spacing*i,0]) {
                    pole(backdepth);
                    // Gap filler and hole
                    gapwidth=conn_spacing-cupwidth;
                    translate([0,(-conn_spacing-gapwidth)/2,margin/2]) {
                        cube([backdepth+cupdepth,gapwidth,cupwidth/2-margin/2]);
                    }
                    translate([cupdepth, cupwidth/2-conn_spacing, -cupwidth/2]) {
                        cube([backdepth, gapwidth, cupwidth]);
                    }
                }
            }
        }
        union() {
            for (i = [1 : 1 : count-1]) {
                translate([hole_x,i*conn_spacing-cupwidth/2,-cupwidth]) {
                    cylinder(cupwidth*2, hole_r, hole_r, $fn=16);
                }
            }
        }
    }
}

poles(2,10);
