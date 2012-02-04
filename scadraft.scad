n=1/2.5;
x=20;
y=20;
layer=0.1;
layers=2;

for(z=[0:layers-1]) translate([0,0,layer*z])
for(i=[0:n*x]) if(z%2==0){
	translate([1/n,0,0]*i) cube([layer,y,layer]);
}
else{
	translate([0,1/n,0]*i) cube([x,layer,layer]);
}