toothcount=floor(22*3.141592653589793/2);
echo(toothcount);
module bearing(){
	color([1,1,1]*0.75) difference(){
		cylinder(r=22/2,h=7);
		cylinder(r=8.1/2,h=20,center=true);
	}
}
*for(i=[-1,1]) translate([0,0,7]*i) bearing();
difference(){
	union(){
		cylinder(r=22/2,h=7);
		intersection(){
			cylinder(r=(22+1)/2,h=7);
			translate([0,0,7/2]){
				for(i=[1:toothcount]) rotate([0,0,(360/toothcount)*i])
				for(j=[-1,1]) translate([22/2,0,8/4*j]) rotate([45*j,0,0]) cube([25,0.7071067811865475,9/1.4142135623730951],center=true);
			}
		}
	}
	translate([0,0,6.5/2]) cylinder(r=8,$fn=6,h=20,center=true);
}
