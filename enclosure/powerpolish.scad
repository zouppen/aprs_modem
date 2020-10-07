// Anderson PowerPole like housing
// compatible with original contacts.

thinwall=0.8;
backwall=1.7;
cupdepth=8.25;
cupwidth=7.6;
margin=0.2; // make the lower part a bit smaller
tongue_angle=18;
tongue_thickness=0.8;
tongue_rise=7; // Adjust this with the angle
tongue_depth=2.6; // From connector tip to tongue tip
tongue_width=3.5; // On y axis
conn_spacing=7.9; // Spacing between connectors
hole_x = 10;
hole_r = 1;
wedge_slope = 0.25; // 3D printing aid wedges

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
        translate([0,-w/2,0]) cube([d,w,h]);
        // Inner
        translate([-thinwall,-w/2+wall,-wall]) cube([d,w-2*wall,h]);
    }
}

module pole(backdepth) {
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
    
    // Back weddge to ease printing
    translate([cupdepth+thinwall,-cupwidth/2,cupwidth/2]) rotate([90,180,180]) wedge(cupwidth/2,wedge_slope*cupwidth,cupwidth);
    
    // Front wedge
    lower_height=cupwidth/2-thinwall-1.5*margin;
    translate([thinwall,cupwidth/2-thinwall-margin/2,-lower_height-margin/2]) rotate([90,0,0]) wedge(lower_height,wedge_slope*cupwidth,cupwidth-2*thinwall-margin);
    
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

module poles(count, backdepth=16.6, framing=false) {
    ends = framing ? [0 : 1: count] : [1 : 1: count-1];

    difference() {
        union() {
            // Actual poles
            for (i = [0 : 1: count-1]) {
                translate([0,conn_spacing*i,0]) {
                    pole(backdepth);
                }
            }

            // Fill gaps between the poles
            for (i = ends) {
                translate([0,conn_spacing*i,0]) {
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
        
        // Add holes
        if (!framing) {
            for (i = [1 : 1 : count-1]) {
                translate([hole_x,i*conn_spacing-cupwidth/2,-cupwidth]) {
                    cylinder(cupwidth*2, hole_r, hole_r, $fn=16);
                }
            }
        }
    }
}

module wedge(x, y, z) {
    linear_extrude(z)
        polygon([[0,0], [0,x], [y,0]]);
}

// Test print for "standard" pair of plugs
translate([0,0,cupdepth+16.6]) rotate([0,90,0]) poles(2);

// Test print for casing
translate([20,0,cupdepth+10]) rotate([0,90,0]) poles(2,10, framing=true);
