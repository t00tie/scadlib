use <tslot.scad>;
module tsocket(){
	translate([-6,-6,12.5])
	difference(){
		cube([12,12,25],center=true);
		makerbeam(15);
		translate([0,0,10-(3.2/2)])
		union(){
			rotate([90,0,0]) cylinder(r=3.2/2,h=100,center=true,$fs=0);
			translate([0,0,2.5]) cube([10,10,7.5],center=true);
		}
	}
}
rotate([ 0, 0, 0]) tsocket();
rotate([90,90, 0]) tsocket();
translate([-12,0,0])
rotate([90,90,90]) tsocket();