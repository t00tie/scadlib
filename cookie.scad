diam=10;
topthickness=1;
cutthickness=0.1;
topheight=1;
cutheight=5;

module cookie(r=10,rim=1){
	union(){
		difference(){
			square([r,r]);
			square([r-rim,r-rim]);
			circle(r=10);
		}
		difference(){
			circle(r=r);
			circle(r=r-rim);
			square([r-rim,r-rim]);
		}
	}
}
linear_extrude(height=cutheight) cookie(diam,cutthickness);
linear_extrude(height=topheight) cookie(topthickness+diam,cutthickness+topthickness);