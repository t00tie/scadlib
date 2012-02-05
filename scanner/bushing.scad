n=4;
id=38-0.5;
wall=5;
finwidth=5;
space=2;
twist=2.5;
layerheight=1;
tubeholder_wall=5;
tube_diam=23;
tube_bolt=3;

od=id/2+wall+space;

height=tube_diam+tubeholder_wall*2;
tubeholder_depth=height/2;

difference(){
	union(){
		cylinder(r=od,h=height);
		difference(){
			translate([0,-height/2]) cube([od+tubeholder_depth,height,height]);
			translate([od+tubeholder_depth/2,0,height/2]) rotate([90,0])
				cylinder(r=tube_bolt/2,h=100,center=true,$fn=50);
			translate([od+tubeholder_depth+1,0,height/2]) rotate([0,-90])
				cylinder(r=tube_diam/2,h=tubeholder_depth+1);
		}
	}
	cylinder(r=id/2+space,h=height*3,center=true);
}
linear_extrude(height=height,twist=twist*height,slices=height/layerheight) difference(){
		intersection(){
			for(i=[1:n]) rotate([0,0,360*i/n])	translate([id/2+space*2,0]) circle(r=space*2,$fn=20);
			circle(r=id/2+space);
		}
}


