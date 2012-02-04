sizex=2;
sizey=2;

module button(h,s){
	translate([s/4,s/4,0])
	minkowski(){
		cube([s/2,s/2,h/2]);
		cylinder(r=s/4,h=h/2);
	}
}
module buttonunit(){
	translate([2.5,2.5,0]) button(5,15);
	cube([20,20,1]);
}
module buttoninside(){
	intersection(){
		translate([2.5,2.5]) button(5,15);
		union(){
			translate([1+2.5,1+2.5,-3]) button(5,13);
			translate([10,10,0]) cylinder(r=5/2,h=5-2);
		}
	}
}
module buttonpad(sizex,sizey,i=false){
	for(x=[0:sizex-1]) for(y=[0:sizey-1]){
		translate([20*x,20*y,0]){
			if(i) buttoninside();
			else buttonunit();
		}
	}
}
module nubs(sizex,sizey){
	translate([5,5,0])
	for(x=[0:1]) for(y=[0:1])
	translate([(20*sizex+10)*x,(20*sizey+10)*y])
	sphere(r=5/2);
}

mirror([0,0,1]) translate([0,0,-10])
difference(){
	union(){
		cube([20*sizex+20,20*sizey+20,9.99]);
		translate() nubs(sizex,sizey);
	}
	translate([10,10,0]) buttonpad(sizex,sizey);
}
translate([20*sizex+20+10,0,0])
union(){
	difference(){
		cube([20*sizex+20,20*sizey+20,10]);
		translate([0,0,10]) nubs(sizex,sizey);
	}
	translate([10,10,10]) buttonpad(2,2,true);
}