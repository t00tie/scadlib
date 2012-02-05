n=10;
id=41;
wall=5;
finwidth=2;
space=10;
height=20;
twist=2.5;
linear_extrude(height=height,twist=twist*height){
	difference(){
		circle(r=id/2+wall+space);
		circle(r=id/2+space);
	}
	difference(){
		intersection(){
			for(i=[1:n]) rotate([0,0,360*i/n])
				translate([0,10]/-2) square([1000,finwidth]);
			circle(r=id/2+wall+space);
		}
		circle(r=id/2);
	}
}