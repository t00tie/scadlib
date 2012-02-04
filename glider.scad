module glider(diam,x,y,blobs){
	d=diam*1.25;
	translate([d,d,0]){
		cube([d*x,d*y,1],center=true);
	}
	for(i=[0:x]){
		translate([-d/2+i*d,d,0]) cube([1,d*y,3],center=true);
		for(j=[0:y]){
			translate([d,-d/2+j*d,0]) cube([d*x,1,3],center=true);
			if(blobs[i][j]){
				translate([i*d,j*d,0]) sphere(r=diam/2);
			}
		}
	}
}
hookr=0;
hookt=0;
hookh=0;
module semiglider(){
	difference(){
		union(){
			glider(10,3,3,[[false,true,false],[false,false,true],[true,true,true]]);
			translate([-5*1.25,5*2*1.25,0]) difference(){
				intersection(){
					cylinder(h=1,r=hookr+hookt);
					translate([-hookr*2,0,0]) cube([hookr*4,hookr*4,hookh*2],center=true);
				}
				translate([0,0,0.4]) cylinder(h=hookh,r=hookr);
			}
		}
		translate([0,0,-20])cube([100,100,40],true);
	}
}
rotate([0,0,90]) union(){
	translate([-12.5,-25,0]) semiglider();
	translate([12.5,25,0]) mirror()semiglider();
}