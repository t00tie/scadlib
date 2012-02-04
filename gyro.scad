//I was working on a gyroscope or something.
module gyroring(
	r=50,
	rimsize=2,
	holesize=1,
	thickness=3,
	support=0
){
	translate([0,0,thickness/2])
	difference(){
		union(){
			cylinder(r=r,h=thickness,center=true);
			if(support)
				translate([-r,0,-thickness/2]) cube([r*2,r,thickness]);
		}
		union(){
			cylinder(r=r-rimsize,h=thickness*3,center=true);
			for(i=[0:1]) rotate([0,0,90*i])
			cube([holesize,r*3,holesize],center=true);
		}
	}
}
maxr=30;
rimsize=2;
for(i=[1:3]) gyroring(r=maxr-((rimsize+1)*i));
gyroring(r=maxr,thickness=10,support=true);