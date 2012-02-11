//Handle for a tiny screwdriver I found in an unlabeled box.
difference(){
	translate([20,30,10]/-2) minkowski(){
		cube([20,30,10]);
		cylinder(r=5);
	}
	rotate([90,0,0]) union(){
		translate([0,0,2.5/2]) cube([1.5,3,2.5],center=true);
		mirror([0,0,1]) cylinder(r=3/2,h=9000,$fn=100);
	}
}