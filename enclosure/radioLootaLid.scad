hyla=6;
hala=7;
h=hyla + hala + 2;
w=28;
l=60;
wall=3;

sisa =  [w,l,h];
ulko = [for (i = sisa) i+wall*2];
usb = [9,4,wall];

translate([wall,0,0.5]) {
rotate([0,90,0]) 
cylinder(r=0.5,h=w);}

difference () {
holed=8;    
cube([w+wall*2,h,3]);
translate ([(wall+2.5+holed/2-holed/2), (hyla+1-0.5-holed/2), 0]) 
    cube(holed,h=10);    
}

translate([wall,h,0.5]) {
rotate([0,90,0]) 
cylinder(r=0.5,h=w);
    }


