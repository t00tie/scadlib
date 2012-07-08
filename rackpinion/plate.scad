use <materials.scad>;
include <globals.scad>;
use <rackpinion.scad>;
tslot_d=20;
tslot_boltd=5.1;

module contrapteurrack(length=120){
	    mirror([0,1]) difference(){
			square([length,tslot_d]);
			for(i=[0:ceil(length/20)-1]) translate([(i+0.5)*20,tslot_d/2]) circle(r=tslot_boltd/2);
		}
	    rack(length=length);
}

length_min=120;
length=ceil(length_min/(pin_diam*1.5))*pin_diam*1.5;
//%square([200,300]);

for(i=[0:-1+8]) translate([0,tslot_d+i*(tslot_d+pin_diam*7/4+1)]) contrapteurrack(length);
for(i=[0:-1+5]) translate([length+pitch_diam/2+pin_diam+1,pitch_diam/2+tslot_d/2+(pitch_diam+pin_diam*2+1)*i]) pinholder();

