s=20;
m=3;
w=3;

m_h=m*11/6;
square(100);
rotate([90,90+45,0])
!difference(){
	linear_extrude(height=s) polygon([[0,0],[0,s],[s,0]]);
	translate([s/2,s/2,s/2])
	for(i=[0,-90]) rotate([0,0,i]) rotate([90]){
		cylinder(r=m/2,h=s/2+1,$fn=100);
		cylinder(r=m_h/2,h=s/2-w,$fn=100);
	}
}