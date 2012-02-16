for(x=[0:1]) for(y=[0]) translate([x,y]*25)
difference(){
	cube(20,center=true);
	union(){
		cylinder(r=8/2,h=100,center=true);
		rotate([90,0]) translate([0,0,8/2]) cylinder(r=8/2,h=100);
	}
}