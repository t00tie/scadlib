r1=10;
r2=9;
h=50;
rimheight=2.5;
rim=1;
xthickness=2;
xsize=10;
xdepth=1;
xdistance=3;

union(){
	cylinder(r1=r1,r2=r2,h=h);
	translate([0,0,h])
	intersection(){
		sphere(r=r2);
		translate([0,0,r2]) cube([2,2,2]*r2,center=true);
	}
	translate([0,0,h-rimheight/2]) cylinder(r=r2+rim,h=rimheight,center=true);

	intersection(){
		cylinder(r1=r1+xdepth,r2=r2+xdepth,h=h);
		translate([0,0,h/2])
		for(i=[-1:1])
			translate([0,0,(xsize/1.4142135623730951+xdistance)*i])
			rotate([90,0,-90]) for(j=[0,90]) rotate([0,0,45+j]) translate([0,0,r1*5])
				cube([xthickness,xsize,r1*10],center=true);
	}
}