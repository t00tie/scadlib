include <globals.scad>;
use <MCAD/stepper.scad>;
use <rackpinion.scad>;
use <../lib/materials.scad>;
use <hub.scad>;
$fn=50;
sheet=4;
translate([0,pitch_diam/2+pin_diam]){
	translate([0,0,sheet*2+5]) mirror([0,0,1]) aluminium() hub(5);
	for(i=[-1,1]) translate([0,0,sheet*i]) color([0.1,0.5,0.5]) linear_extrude(height=sheet) pinholder();
	translate([0,0,-sheet]) aluminium() linear_extrude(height=sheet*3) pins();
	translate([0,0,sheet*3]){
		motor();
*		translate([0,0,-sheet+1]) color([1,0.8,1]) linear_extrude(height=sheet) difference(){
			square(2.3*25.4+10,center=true);
			circle(r=1.5/2*25.4);
			for(i=[1:4]) rotate(90*i+45) translate([47.14/2*sqrt(2),0]) circle(r=4.75/2);
		}
	}
}

translate([-120,0]) color([0.2,0.5,0.2]) linear_extrude(height=sheet) rack(20);
