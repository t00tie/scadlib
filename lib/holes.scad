module hole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    cylinder(h=h,r=r,center=center,$fs=0.2);
}
module polyhole(h,d,r=false,center=false){
    r=(r==false)?(d/2):r;
    n=max(round(4*r),3);
    rotate([0,0,180])cylinder(h=h,r=r/cos(180/n),$fn=n,center=center);
}
module tube(
    od=10,
    id=0,
    h=1,
    center=false,
    poly=true){
    difference(){
    hole(d=od,h=h,center=center);
    translate([0,0,-1])
        if(poly){
            polyhole(d=id,h=h+2,center=center);
        }
        else{
            hole(d=id,h=h+2,center=center);
        }
    }
}

