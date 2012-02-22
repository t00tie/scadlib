line_length=10;
line_width=1;
letterspace=2; //line_length/10;
module line(l=10,t=1){
	hull(){
		translate([(l-t)/ 2,0]) circle(r=t/2,$fn=50);
		translate([(l-t)/-2,0]) circle(r=t/2,$fn=50);
	}
}
module hexagon(){
	for(i=[1:6]) rotate([0,0,i*360/6]) translate([1.5*line_length/sqrt(3),0]) rotate([0,0,90])
		line(line_length-letterspace,line_width);
}
module trident(){
	difference(){
		for(i=[1:3]) rotate([0,0,i*360/3])
		translate([line_length/2,0]) line(line_length-letterspace,line_width);
	}
}
linear_extrude(height=0.2)
difference(){
	circle(r=line_length+1,$fn=6);
	rotate([0,0,360/6/2]) hexagon();
	trident();
}
*union(){
	for(i=[1:6]) rotate([0,0,i*360/6]) translate([line_length*1.5/sqrt(3)+line_width,0])
	cylinder(r=letterspace/2,h=0.3,$fn=50);
	cylinder(r=letterspace/2,h=0.3,$fn=50);
}