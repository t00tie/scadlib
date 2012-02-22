line_length=5;
line_width=0.5;
letterspace=2;
module hexagon(){
	difference(){
		circle(r=line_length+line_width/2,$fn=6);
		union(){
			circle(r=line_length-line_width/2,$fn=6);
			for(i=[1:6]) rotate([0,0,i*360/6]) translate([line_length,0]) circle(r=2/2,$fn=100);
		}
	}
}
module trithing(){
	difference(){
		for(i=[1:3]) rotate([0,0,i*360/3])
		translate([0,line_width/-2]) square([line_length,line_width]);
		circle(r=letterspace/2,$fn=100);
	}
}
linear_extrude(height=1)
difference(){
	circle(r=line_length+1,$fn=50);
	union(){
		hexagon();
		trithing();
	}
}