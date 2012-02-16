base_thickness=1;
horizontalspace=75;
wheel_thickness=5;
spacing_side=3;
spacing_bottom=3;
wheel_hole=8;
sidewall_thickness=3;
total_height=75;

wheel_diameter=total_height-spacing_bottom;
base_width=wheel_thickness+spacing_side*2+sidewall_thickness*2;
base_length=wheel_diameter;
union(){
	translate([0,0,base_thickness/2]) cube([base_width,base_length,base_thickness],center=true);
	difference(){
		for(i=[0,180]) rotate([0,0,i]) translate([base_width/2,0]) rotate([0,-90]) linear_extrude(height=sidewall_thickness) polygon([[0,-base_length/2],[0,base_length/2],[wheel_diameter/2+wheel_hole+spacing_bottom,wheel_hole],[wheel_diameter/2+wheel_hole+spacing_bottom,-wheel_hole]]);
		translate([0,0,spacing_bottom]){
//			cube([])
			translate([0,0,wheel_diameter/2]) rotate([0,90]){
				%cylinder(r=wheel_diameter/2,h=wheel_thickness,center=true);
				#cylinder(r=wheel_hole/2,h=100,center=true);
			}
		}
	}
}
echo("wheel_diameter",wheel_diameter);
echo("wheel_diameter",wheel_diameter);