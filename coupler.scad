$fn=100;
height=10;
diameter=15;

shaftdiam=2.3;
shaftflat=5;
shaftlen=10;
shaftextdiam=7;

coupledepth=7.5;
couplewidth=5.4;

echo("Total height is ",shaftlen+coupledepth);

difference(){
	union(){
		cylinder(h=height,r=diameter/2);
		translate([0,0,height]) cylinder(h=shaftlen-(height-coupledepth),r=shaftextdiam/2);
	}
	union(){
		intersection(){
			cylinder(h=100,r=shaftdiam/2);
			union(){
 				translate([-shaftdiam/2,-shaftdiam/2,coupledepth+0.1]) cube([shaftdiam/2,shaftdiam,100]);
				translate([-shaftdiam/2,-shaftdiam/2,shaftflat+coupledepth]) cube([shaftdiam,shaftdiam,100]);
			}
		}
		cube([couplewidth,couplewidth,coupledepth*2],center=true);
	}
}