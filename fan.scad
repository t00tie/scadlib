angle=45;
height=10;
r=10;
blade_length=10;
blade_width=2;
blades=7;
blade_r=20;
layerheight=0.2;

module polyhole(h, d) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}

module blade(){
	intersection(){
		translate([r-1,blade_r]) 
		difference(){
			circle(r=blade_r);
			circle(r=blade_r-blade_width);
		}
		translate([r-1,0]) square([blade_length,blade_r]);
	}
}
module fan2d(){
	circle(r=r);
	for(i=[1:blades]) rotate([0,0,360/blades*i]) 
		blade();
//		translate([r,0,0]) square([blade_length*2,blade_width],center=true);
}
module fan3d(){
	difference(){
		linear_extrude(height=height,twist=angle,slices=height/layerheight) fan2d();
		polyhole(d=3,h=height);
	}
}
fan3d();

difference(){
	cylinder(r=r+blade_length+1,h=height,$fn=500);
	cylinder(r=r+blade_length,h=height*3,center=true,$fn=500);
}
