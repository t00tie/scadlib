$fn=50;
thickness=10;
rodsize=16;

module torus(thickness,rodsize){
	difference(){
		rotate_extrude(convexity = 10) translate([(rodsize/2)+thickness, 0, 0]) circle(r=thickness);
		translate([0,-rodsize+thickness,0]) rotate([90,0,0])
		union(){
			cylinder($fn=6,r=5,h=thickness);
			cylinder(r=5/2,h=thickness*3);
		}
	}
}


translate([-rodsize/2-thickness,0,0]) torus(thickness,rodsize);
translate([rodsize/2+thickness,0,0]) rotate([90,0,0]) torus(thickness,rodsize);
