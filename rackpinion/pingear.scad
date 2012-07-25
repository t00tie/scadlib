use <../lib/materials.scad>;
include <globals.scad>;
use <rackpinion.scad>;
sheet_thickness=4;
module unsheet(color=true,center=false){
    if(color) color([0.64,0.36,0.11]) linear_extrude(height=sheet_thickness,center=center) child(0);
    else linear_extrude(height=sheet_thickness,center=center) child(0);
}
module pinwheel(){
    steel() linear_extrude(height=sheet_thickness*3,center=true) pins();
    mirror([0,0,1]) translate([0,0,sheet_thickness/2]) unsheet() pinholder();
   translate([0,0,sheet_thickness/2+0.01]) unsheet() pinholder();
    unsheet(center=true) pinholder_center();
}

teeth=20;

ratio=pins/teeth;
n=teeth*10;
two_pitch_diam=pitch_diam/ratio;
difference(){
	circle(r=two_pitch_diam/2+pin_diam/2);
	for(i=[1:n/ratio]) rotate(360/ratio/n*i) translate([0,two_pitch_diam])  rotate(360/ratio/n*i) pins();
}

echo(pitch_diam+pin_diam);
