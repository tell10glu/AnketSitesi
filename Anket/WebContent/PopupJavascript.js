function getElementsByClassName(classname,tag) {
	 if(!tag) tag = "*";
	 var anchs =  document.getElementsByTagName(tag);
	 var total_anchs = anchs.length;
	 var regexp = new RegExp('\\b' + classname + '\\b');
	 var class_items = new Array()
	 
	 for(var i=0;i<total_anchs;i++) { //Go thru all the links seaching for the class name
	  var this_item = anchs[i];
	  if(regexp.test(this_item.className)) {
	   class_items.push(this_item);
	  }
	 }
	 return class_items;
	}
function openPopup() {
 var url = this.href;
 window.open(url, "popup_id", "scrollbars,resizable,width=600,height=400");
 return false;
}
function init() {
 var popups = getElementsByClassName("popup");
 for(var i=0;i<popups.length;i++) {
  popups[i].onclick=openPopup;
 }
}
window.onload=init;