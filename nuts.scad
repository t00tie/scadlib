for(i=[0:1])
translate([22*i,0,0])
difference(){
	union(){
		cylinder(r=(14)/2,h=20);
		cylinder(r=20/2,h=1);
	}
	cylinder(r=(8+i)/2,h=20);
}