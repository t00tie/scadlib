n=3;
difference(){
	cube([24+10*2,5+5*n,15]);
	for(i=[0:n-1]) translate([10,4+i*5,5]) cube([24,2,40]);
}