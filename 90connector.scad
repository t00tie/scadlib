//A connector for connecting sheets at 90° angles, intended for mendel90ish things
module linear_extrude_smart(height=10,center=false,convexity=2,twist=0){
	if(height==0) child(0);
	else{
		linear_extrude(height=height,center=center,convexity=convexity,twist=twist) child(0);
	}
}
module prism(size=[10,10],h=10,center=false,convexity=2,twist=0){
	linear_extrude_smart(height=h,center=center,convexity=convexity,twist=twist)
	polygon([[0,0],[size[0],0],[0,size[1]]]);
}
module polyhole(h,d,center=false){
    n=max(round(2*d),3);
    rotate([0,0,180]) cylinder(h=h,r=(d/2)/cos(180/n),$fn=n,center=center);
}
m=3; //bolt size
w=1; //wall thickness
s=3*m+w;
rotate([90,0,0])
for(i=[0:1]) translate([0,0,s*i])
difference(){
	prism([1,1]*s,h=s,center=true);
	union(){
		translate([1,1]*w) prism([1,1]*s,h=(s-2*w),center=true);
		for(j=[0,1])
				translate([0,0,1.5*s/8]*(j==0?1:-1))
				translate([1,1,0]*s/2) rotate([90,0,90*j])
				polyhole(d=m,h=s*2,center=true);
	}
}
