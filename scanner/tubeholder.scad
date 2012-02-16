d=23;
h=10;
w=2;
flange_length=10;
difference(){
	union(){
		cylinder(r=d/2+w,h=h);
		translate([-d/2-w,0,0]) cube([d+2*w,d/2,h]);
		translate([-d/2-flange_length,d/2-w]) cube([flange_length*2+d,w,h]);
	}
	union(){
		translate([0,0,-1]){
#			cylinder(r=d/2,h=h+2);
			translate([-d/2,0,0]) cube([d,d,2*h]);
		}
		translate([0,0,h/2]) rotate([90,0]){
			cylinder(r=3,$fn=6,h=d/2+1.5);
			cylinder(r=3/2,$fn=100,h=d/2+100);
			for(i=[-1,1]) translate([i*(d/2+flange_length/2),0,-d/2+w/2]) cylinder(r=3/2,$fn=100,h=w*2,center=true);
		}
	}
}
