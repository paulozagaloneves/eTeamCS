/* popup.js *******************************************************************/

function showOnTopDIV(divId){
styleObj=document.getElementById(divId).style;
/*var scrollY=getScrollY();
var ySize=getYSize();
var newHeight=scrollY+ySize;
styleObj.height=newHeight+'px';
if(ez_OPR||ez_SAF){
styleObj.background="url('web/images/back.png')";
if(ez_MOZ&&ez_isMac){}
}else{
styleObj.backgroundColor="#ffffff";
}*/
styleObj.backgroundColor="#eee";
showDIV(divId);
//aspnm_hideSelectElements(divId);
}
function hideOnTopDIV(divId){
//aspnm_restoreSomeSelectElements(divId);
hideDIV(divId);
}
function hideDIV(divId){
document.getElementById(divId).style.display="none";
}
function showDIV(divId){
document.getElementById(divId).style.display="inline";
}
