include <globals.scad>;
use <rackpinion.scad>;
n=100;
translate([-pin_diam*0.25,0])
difference(){
    translate([pin_diam*0.25,0]) square([pin_diam*1.5,pin_diam*2]);
    mirror([0,1]) translate([pin_diam,-pin_diam+pitch_diam/-2,0]) for(i=[0:n-1]) translate([pitch_circumference/n*i/2-pitch_circumference/4,0,0]) rotate([0,0,i/n*360/2]) pins(pins);
}
