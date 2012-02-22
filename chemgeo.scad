line_length=10;
line_width=0.75;
letterspace=2;
thickness=1;
module hexagon(){
	difference(){
		circle(r=line_length-line_width,$fn=6);
	}
}
module trident(){
	difference(){
		for(i=[1:3]) rotate([0,0,i*360/3])
		translate([0,line_width/-2]) square([line_length,line_width]);
		circle(r=letterspace/2,$fn=100);
	}
}
linear_extrude(height=thickness)
difference(){
	hexagon();
	trident();
}