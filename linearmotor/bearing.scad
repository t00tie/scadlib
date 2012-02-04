module bearing(){
	color([1,1,1]*0.75) difference(){
		translate([0,0,-0.5]) cylinder(r=22/2,h=7.5);
//		cylinder(r=8.1/2,h=20,center=true);
	}
}
difference(){
	cube([30,27,27],center=true);
	union(){
		translate([-9/2,0,0]) rotate([0,-90,0]) bearing();
		cube([9,22,40],center=true);
		translate([9/2,0,0]) rotate([0,90,0]) bearing();
		rotate([0,90,0]) cylinder(r=8.1/2,h=100,center=true);
	}
}
//square(100,center=true);