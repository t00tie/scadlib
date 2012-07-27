plate=false;
module bom(number,type,stuff=false){
    echo("BOM",str(type,(stuff!=false)?"-":"",(stuff!=false)?stuff:""),number);
}
module bom_printed(number,type,stuff=false){
    echo("BOM",str(type,(stuff!=false)?"-":"",(stuff!=false)?stuff:""),(plate==false)?number:-number);
}
