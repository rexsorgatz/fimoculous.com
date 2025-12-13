function Area(id, tabId) {
	this.id = id;
	this.tabId = tabId;
	this.show = function() {
		for(var j=0; j < ContentArea.length; j++) {
			if(ContentArea[j].id != this.id){
				document.getElementById(ContentArea[j].id).className = "contentAreaInactive";
				document.getElementById(ContentArea[j].tabId).className = "calunsel";
			} else {
			 	document.getElementById(ContentArea[j].tabId).className = "calunsel";
			}
		}
		document.getElementById(this.id).className = "contentAreaActive";
		document.getElementById(this.tabId).className = "calsel";
	}
}
var ContentArea = [
	new Area("contentArea1", "tab1"),
	new Area("contentArea2", "tab2"),
	new Area("contentArea3", "tab3")
];

