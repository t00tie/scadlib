use <materials.scad>;
use <bom.scad>;
module bolt(n,h,bom=true){
	bzp(){
		mirror([0,0,1]){
			difference(){
				cylinder(r=n,h=n,$fn=50);
				translate([0,0,0.1]) cylinder(r=n/2,$fn=6,h=n+2);
			}
		}
		cylinder(r=n/2,h=h,$fn=50);
	}
	if(bom) bom(1,str("bolt-m",n),h);
}
nut_thickness=   [0,0,0, 3  ,4  , 5  , 6  ,0, 8  ,0,10  ,0,12  ]*0.8;
washer_thickness=[0,0,0, 0.5,0.8, 1.0, 1.6,0, 1.6,0, 2.0,0, 2.5];
washer_id=       [0,0,0, 3.2,4.3, 5.3, 6.4,0, 8.4,0,10.5,0,13.0];
washer_od=       [0,0,0, 7.0,9.0,10.0,12.5,0,17.0,0,21.0,0,24.0];
module nut(n,bom=true){
	bzp() difference(){
		cylinder(r=n,h=nut_thickness[n],$fn=6);
		translate([0,0,-1]) cylinder(r=n/2,h=n+2,$fn=50);
	}
	if(bom) bom(1,str("nut-m",n));
}
module washer(n,bom=true){
    bzp() difference(){
        cylinder(r=washer_od[n]/2,h=washer_thickness[n],$fn=50);
        translate([0,0,-1]) cylinder(r=washer_id[n]/2,h=washer_thickness[n]+2,$fn=50);
    }
	if(bom) bom(1,str("washer-m",n));
}

