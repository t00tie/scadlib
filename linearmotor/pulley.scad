toothcount=floor(22*3.141592653589793/2);
difference(){
	cylinder(r=(22+1)/2,h=7)
	render() intersection(){
		difference(){
			cylinder(r=(22+1)/2,h=7);
			cylinder(r=22/2,h=20,center=true);
		}
		translate([0,0,7/2]){
			for(i=[1:toothcount]) rotate([0,0,(360/toothcount)*i])
			for(j=[-1,1]) translate([22/2,0,8/4*j]) rotate([45*j,0,0]) cube([25,0.7071067811865475,9/1.4142135623730951],center=true);
		}
	}
}