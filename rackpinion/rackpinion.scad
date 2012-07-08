include <globals.scad>;
module import_dxf(file) render() projection(cut=true) linear_extrude(file=file,height=0.1);

module pins(n=pins,pin_diam=pin_diam) for(i=[0:n-1]) rotate([0,0,360/pins*(i+0.5)]) translate([pitch_diam/2,0]) circle(r=pin_diam/2);
module tooth_base() import_dxf("tooth.dxf");
module tooth(){
    translate([pin_diam*1.5/2,0]) intersection(){
        tooth_base();
        square([pin_diam*1.5/2,pin_diam*3]);
    }
    translate([pin_diam*1.5/-2,0]) intersection(){
        tooth_base();
        translate([pin_diam*1.5/2,0]) square([pin_diam*1.5/2,pin_diam*3]);
    }
}
module pinholder() difference(){
    circle(r=pitch_diam/2+pin_diam);
    pins();
    import_dxf("shaft.dxf");
}
module pinholder_center() difference(){
    circle(r=pitch_diam/2-pin_diam*1.25);
    import_dxf("shaft.dxf");
}
module rack(teeth=0,length=0){
    n=(teeth!=0)?teeth:ceil(length/(pin_diam*1.5));
    for(i=[0:n-1]) translate([pin_diam*1.5*i,0,0]) tooth();
    echo(str("Rack: ",n," teeth, ",n*pin_diam*1.5,"mm"));
}