//Dovetail connection modular boxes.
module connector(){
	polygon(points=[[-5,-0.1],[-5,0],[-12.5,10],[12.5,10],[12.5,10],[5,0],[5,-0.1]]);
}
module boxbase_(){
	translate([25,25]) difference(){
		union(){
			square([50,50],center=true);
			for(i=[0,1]) rotate([0,0,-90*i]) union(){
				translate([0,-30]) square([50,10],center=true);
				translate([0,25+0.5]) scale(0.9){
					connector();
					square([10,5],center=true);
				}
			}
		}
		for(i=[0,1]) rotate([0,0,-90*i]) translate([0,-35]) connector();
	}
	translate([-10,-10]) square([10,10]);
}
module boxbase(x=1,y=1){
	for(xn=[0:x-1]) for(yn=[0:y-1]) translate([xn,yn]*50) boxbase_();
}
module box(h=55,x=1,y=1){
	linear_extrude(height=h) boxbase(x=x,y=y);
}
module stuffbox(h=55,x=1,y=1){
	difference(){
		box(h=h,x=x,y=y);
		translate([1,1,2]) cube([50*x-2,50*x-2,h]);
	}
}
boxbase();
translate([60,0]) boxbase();
//stuffbox();
//for(x=[0:]) for(y=[0:1]) translate([60*x,60*y,(x+y)*10]) stuffbox();