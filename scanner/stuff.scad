bignumber=500;

module hole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    cylinder(h=h,r=r,center=center,$fs=0.2);
}
module polyhole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    n=max(round(4*r),3);
    rotate([0,0,180])cylinder(h=h,r=r/cos(180/n),$fn=n,center=center);
}
