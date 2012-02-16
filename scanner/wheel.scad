d=72;
w=5;
h=7;
shaft_d=22;
shaft_w=5;
t=4;
difference(){
	cylinder(r=d/2,h=h);
	union(){
		cylinder(r=shaft_d/2,h=h*3,center=true);
		translate([0,0,t]) difference(){
			cylinder(r=d/2-w,h=h);
			cylinder(r=shaft_d/2+shaft_w,h=h);
		}
	}
}