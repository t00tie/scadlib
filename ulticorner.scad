display=false;
module bearing(){
	translate([0,0,-0.1]) cylinder(r=22/2,h=7.1,$fn=100);
}
module polyhole(h, d) {
    n=max(round(2*d),3);
    rotate([0,0,180]) cylinder(h=h,r=(d/2)/cos(180/n),$fn=n);
}
module bearingadapter(motor=false){
	difference(){
		union(){
			cylinder(h=1,r=10/2);
			cylinder(h=7,r=8/2);
		}
		translate([0,0,-1]) polyhole(d=5,h=motor?9:7);
	}
}
module motor(wall=3){
	translate([0,0,wall]) linear_extrude(height=100) square(1.7*25.4,center=true);
//	cylinder();
	for(i=[0:3]) rotate([0,0,45+90*i]) translate([1.7*25.4/2,0,0]){
		translate([0,0,-50]) cylinder(r=3/2,h=100);
		translate([0,0,-wall]) cylinder(r=6/2,h=5);
	}
} 
module corner(
motormount=false,
s=(1.7*25.4)+20,
h=(1.7*25.4)+30,
w=15,
w_s=20,
high=false){
//	rotate([0,(motormount==true)?0:-90,0])
	difference(){
		union(){
			linear_extrude(height=h) polygon([[0,0],[1,0],[0,1]]*s);
			if(display) rotate([90]) mirror([0,0,1]) translate([s/2,h/2+(high?-5:5)]) bearing();
		}
		union(){
			if(!display) rotate([90]) mirror([0,0,1]) translate([s/2,h/2+(high?-5:5)]) bearing();
			rotate([90,0,90]) translate([s/2,h/2+(high?5:-5)]){
				bearing();
				if(motormount){
					cylinder(h=9000,r=5/2+1);
					translate([0,0,7]) motor();
				}
			}
			translate([w,w,0]){
				translate([0,0,-1]) linear_extrude(height=h+2) polygon([[0,0],[1,0],[0,1]]*(s-(w*3)));
				translate([0,0,w_s]) linear_extrude(height=h-(2*w_s)) polygon([[0,0],[1,0],[0,1]]*s);
			}
		}
		translate([10/2+2,10/2+2,w_s]) polyhole(d=10,h=h-(2*w_s));
	}
}
rod=200;
for(i=[0:3]) rotate([0,0,90*i]) translate([1,1]*(display?(rod-7)/2:1)){
	corner(i%3==0,high=(i%2==0));
	if(display){
		translate([(1.7*25.4+20)/2,0,(1.7*25.4+30)/2+((i%2==0)?-5:5)]) rotate([90,0]) cylinder(r=5/2,h=rod);
	}
	else{
		translate([1,1]*40) bearingadapter(i%3==0);
	}
}
//motor();
//corner();