module eyebrow(h=5,t=10,stroke=30,circle=10,inc=2){
	difference(){
		union(){
			translate([stroke,circle+t,0])
			intersection(){
				difference(){
					cylinder(h=h,r=circle+t);
					cylinder(h=h*4,r=circle,center=true);
				}
				union(){
					mirror([0,1,0]) translate([0,0,-h]) cube([circle+t,circle+t,h*3]);
					rotate([0,0,45]) mirror([0,1,0]) translate([0,0,-h]) cube([circle+t,circle+t,h*3]);
				}
			}
			cube([stroke,t,h]);
		}
		translate([0.6,-t/2,h/2-inc/2]) cube([stroke,t,inc]);
		translate([stroke,-t/2,h/2-inc/2]) cube([stroke,t,inc]);
	}

	translate([stroke,circle+t,0])intersection(){
		difference(){
			cylinder(h=h,r=circle+t);
			cylinder(h=h*4,r=circle+t-0.6,center=true);
		}
		union(){
			mirror([0,1,0]) translate([0,0,-h]) cube([circle+t,circle+t,h*3]);
		}
	}
}
eyebrow();
translate([30,35,0]) rotate([0,0,180]) eyebrow();
