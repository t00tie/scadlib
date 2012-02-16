height=20;
m=3;
m_head_diam=4;
m_head_height=3;
jaw_size=4*(m+1);

jaw_t=jaw_size/2;
jaw_d=jaw_t/2*sqrt(3);

grip_diam=1;

module hole(h,d,r=false,center=false,$fs=0.2){
    r=(r==false)?(d/2):r;
    cylinder(h=h,r=r,center=center,$fs=$fs);
}
module polyhole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    n=max(round(4*r),3);
    rotate([0,0,180])cylinder(h=h,r=r/cos(180/n),$fn=n,center=center);
}

difference(){
	rotate([0,0,180/6]) hole(d=jaw_size,h=height,$fn=6);
	union(){
		polyhole(d=m,h=height*3,center=true);
		translate([0,0,height]) mirror([0,0,1]) polyhole(d=m_head_diam,h=m_head_height);
	}
}
for(r=[1:6]) rotate([0,0,360/6*r])
	for(z=[1:round(height/grip_diam)])	translate([jaw_d,0,grip_diam*(z-0.5)])
		rotate([90,0,0]) hole(d=grip_diam,h=jaw_t,center=true,$fs=0.1);
