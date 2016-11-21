function lengthdisp(str){
var wlength = str.maxLength - str.value.length;
document.getElementById("zanlength").innerHTML = wlength;
return(str);}