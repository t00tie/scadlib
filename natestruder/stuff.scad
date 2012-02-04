nema14_width=1.4*25.4;
nema14_hole_spacing=nema14_width/sqrt(2);
m4_nut_diameter=9;
m4_taphole_diameter=3.8;

bignumber=100;

module hole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    cylinder(h=h,r=r,center=center,$fs=0.2);
}
module polyhole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    n=max(round(4*r),3);
    rotate([0,0,180])cylinder(h=h,r=r/cos(180/n),$fn=n,center=center);
}
