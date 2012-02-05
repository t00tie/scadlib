include <stuff.scad>;
diameter=40;
wall=10;
height=30;
flange=20;
module stoolmountbase(){
	difference(){
		hole(d=diameter+(wall*2),h=height,center=true);
		polyhole(d=diameter,h=height+1,center=true);
	}
	for(i=[0:1]) rotate([0,0,180*i])
	difference(){
		translate([diameter/2+flange/2+wall/2,0,0]) cube([flange+wall,wall,height],center=true);
		translate([diameter/2+flange/2+wall,0,0]) rotate([90,0,0]){
			hole(d=4,h=bignumber,center=true);
			if(i==0)
				mirror([0,0,1]) translate([0,0,wall/2-2]) cylinder(r=3,h=10,$fn=6);
		}
	}
}
module semistoolmountbase(){
	intersection(){
		stoolmountbase();
		translate([0,bignumber/2,0]) cube([bignumber,bignumber,bignumber],center=true);
	}
}
semistoolmountbase();
translate([0,-10,0]) rotate([0,0,180]) semistoolmountbase();
