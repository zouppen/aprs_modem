//pls don't judge too much
//my first .scad file

hyla=6;
hala=7;
h=hyla + hala + 2;
w=28;
l=60;
wall=3;

sisa =  [w,l,h];
ulko = [for (i = sisa) i+6];
usb = [9,4,wall];

module cube1(){
    difference() {
        translate ([0,0,-wall])cube(ulko);
        translate([wall,wall,0]) cube(sisa);
        }
}

module cube2(){
difference(){
    cube1();
    translate([8+wall,0,0]) cube(usb);
    }

}
module cube3(){
difference(){
    cube2();
    translate([0,(l+wall),0]) 
cube([100,100,h]);
    }
}

module cube4(){
difference(){
    cube3();
    rotate([0,90,0])
    translate([0,(l+wall),wall]) 
    cylinder(r=1,h=w);
    }
}

module cube5(){
difference(){
    cube4();
    rotate([0,90,0])
    translate([-h,(l+wall),wall]) 
    cylinder(r=1,h=w);
    }
}

cube5();
translate([2,0,hala - wall]) cube([wall,l,wall]);
translate([2,0,h-hyla]) cube([wall,l,wall]);

translate([w+1,0,hala - wall]) cube([wall,l,wall]);
translate([w+1,0,h-hyla]) cube([wall,l,wall]);
