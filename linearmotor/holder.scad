module bearing(){
	color([1,1,1]*0.75) difference(){
		cylinder(r=22/2,h=7);
		translate([0,0,7/2]) cylinder(r=8.1/2,h=20,center=true);
	}
}
cube(
bearing();