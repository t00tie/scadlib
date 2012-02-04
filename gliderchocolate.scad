module semiglidermould(){
	difference(){
		cube([50,50,10]);
		union(){
			translate([12.5,12.5,-0.01]) import_stl("semiglider.stl");
			translate([5.76,25,0]) rotate([90,0,-90]) cylinder(r=2.5,h=20);
		}
	}
}
translate([2.5,0,0]) semiglidermould();
translate([-2.5,0,0]) mirror() semiglidermould();
