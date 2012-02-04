$fn=100;
height=10;
diameter=10;

shaftdiam=6.3;

coupledepth=5;
couplewidth=3;

difference(){
	union(){
		cylinder(h=(height-coupledepth),r=diameter/2);
		translate([0,0,coupledepth])
		intersection(){
			cylinder(h=100,r=diameter/2);
			cube([couplewidth,100,coupledepth*2],center=true);
		}
	}
	cylinder(h=height-coupledepth,r=shaftdiam/2);
}
