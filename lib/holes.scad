module hole(h,d,d2=false,center=false){
    r=d/2;
    r2=(d2==false)?r:(d2/2);
    cylinder(h=h,r1=r,r2=r2,center=center,$fs=0.2);
}
module polyhole(h,d,d2=false,center=false){
    r=d/2;
    r2=(d2==false)?r:(d2/2);
    n=max(round(4*r),3);
    rotate([0,0,180]) cylinder(h=h,r1=r/cos(180/n),r2=r2/cos(180/n),$fn=n,center=center);
}
module tube(
    od=10,
    id=0,
    id2=false,
    h=1,
    center=false,
    poly=true){
    id2=(id2==false)?id:id2;
    difference(){
        hole(d=od,h=h,center=center);
        if(poly){
                polyhole(d=id,d2=id2,h=h,center=center);
        }
        else{
            hole(d=id,d2=id2,h=h+2,center=center);
        }
    }
}

