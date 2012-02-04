pi=3.14159265358979323846264338327950288;
module thumbwheel(h=10,r=10,n=10){
	$fn=100;
	ra=(n*r)/(n+2*pi);
	rb=(ra*2*pi)/n;
	cylinder(r=ra,h=h);
	for(i=[1:n]) rotate([0,0,360/n*(i-1)]) translate([ra,0]) cylinder(r=rb,h=h);
}


module nutwheel(m=3,h=5,r=5,n=10){
	$fn=100;
	translate([0,0,h]) difference(){
		mirror([0,0,1]) thumbwheel(h=h,r=r,n=n);
		union(){
			cylinder(r=m,$fn=6,h=6,center=true);
			cylinder(r=m/2,h=h*3,center=true);
			translate([(r+(n*r)/(n+2*pi))/2,0]) cylinder(r=0.5,h=2,center=true);
		}
	}
}
nutwheel(r=10);
