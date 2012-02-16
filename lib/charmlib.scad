use <FreeSerif.scad>;
use <holes.scad>;
module charm(
	letter="N",
	base_diameter=40,
	base_thickness=3,
	letter_thickness=0,
	hole_diameter=4,
	hole_distance=5,
	letter_scale=sqrt(0.5),
){
	letter_thickness=(letter_thickness==0)?base_thickness:letter_thickness;
	translate([0,0,-base_thickness]) difference(){
		hole(d=base_diameter,h=base_thickness);
		translate([base_diameter/2-hole_distance,0]) polyhole(d=hole_diameter,h=9001,center=true);
	}
	scale([letter_scale/sqrt(2),letter_scale/sqrt(2),letter_thickness])
		translate([-10*2,0,1/2]) rotate([0,0,-90]) FreeSerif(letter);
}
charm("N");