//preload because it doesn't load itself all the time

var preload=new Image();
preload.src="(http://www.fimoculous.com/images/bullet-small.gif)";


//shake it
function shakemore(n) {
if (self.moveBy) {
for (i = 15; i > 0; i--) {
for (j = n; j > 0; j--) {
self.moveBy(0,i);
self.moveBy(i,0);
self.moveBy(0,-i);
self.moveBy(-i,0);
         }
      }
setInterval("", 10000);
for (i = 15; i > 0; i--) {
for (j = n; j > 0; j--) {
self.moveBy(0,i);
self.moveBy(i,0);
self.moveBy(0,-i);
self.moveBy(-i,0);
   }
}
setInterval("", 10000);
for (i = 15; i > 0; i--) {
for (j = n; j > 0; j--) {
self.moveBy(0,i);
self.moveBy(i,0);
self.moveBy(0,-i);
self.moveBy(-i,0);
   }
}
}
}

function shake(n) {
if (self.moveBy) {
if (n >10) {
shakemore(n)
}
else{
for (i = 15; i > 0; i--) {
for (j = n; j > 0; j--) {
self.moveBy(0,i);
self.moveBy(i,0);
self.moveBy(0,-i);
self.moveBy(-i,0);
}     
    }
      }
   }
}


//pulldowns
function leapto(form) {
	var myindex=form.rex.selectedIndex
	location.href=(form.rex.options[myindex].value);
}

//popup

var openWin;
var name;
var mywidth;
var myheigth;
var myscroll;

function createWindow(name,mywidth,myheigth,myscroll) {		
		if (openWin == null) {
 			mywindow=eval("window.open(\'" + name + "\',\'popup\',\'width=" + mywidth + ",height=" + myheigth +",scrollbars=" + myscroll +",top=10,left=10,toolbar=no,location=no,resizable=no,status=no,menubar=no\')");
			openWin = '1';
		} else if (openWin == '1') {
			if (mywindow.closed == true) {
 			mywindow=eval("window.open(\'" + name + "\',\'popup\',\'width=" + mywidth + ",height=" + myheigth +",scrollbars=" + myscroll +",top=10,left=10,toolbar=no,location=no,resizable=no,status=no,menubar=no\')");
			} else {
				mywindow.window.close();
 			mywindow=eval("window.open(\'" + name + "\',\'popup\',\'width=" + mywidth + ",height=" + myheigth +",scrollbars=" + myscroll +",top=10,left=10,toolbar=no,location=no,resizable=no,status=no,menubar=no\')");
			}
		}
}

function popupform(myform, windowname)
{
if (! window.focus)return true;
window.open('', windowname, 'toolbar=no,location=no,resizable=no,status=no,menubar=no,top=10,left=50,height=300,width=380,scrollbars=no');
myform.target=windowname;
return true;
}

	
//highlight picture
function high(which2){
	theobject = which2;
	highlighting = setInterval("highlightit(theobject)",50);
}
function low(which2){
	clearInterval(highlighting);
	which2.filters.alpha.opacity=50;
}
function highlightit(cur2){
	if (cur2.filters.alpha.opacity<100)cur2.filters.alpha.opacity+=5;
	else if (window.highlighting)clearInterval(highlighting);
}

//everything below is stolen from metafilter



function pnhEditTextarea(textarea_id, action) {

	// decide what you're addding
	var startTag = "";
	var endTag = "";
	switch (action) {
		case "strong":	
			startTag = "<strong>";
			endTag = "<\/strong>";
			break;
		case "emphasis":	
			startTag = "<em>";
			endTag = "<\/em>";
			break;
		case "a_href":
			var userInput = prompt("Please enter the site you'd like to link", "http://");
			startTag = "<a href=\""+userInput+"\" target=\"_blank\">";
			endTag = "<\/a>";
			break;
		}
	pnhTextareaInsert(textarea_id,startTag,endTag);
	return false;
}
function mouseover(el) {
	el.className = "raise";
	}

function mouseout(el) {
	el.className = "buttons";
}

function mousedown(el) {
	el.className = "press";
}

function mouseup(el) {
	el.className = "raise";
}
	
function pnhTextareaInsert(taID, text1, text2) {
	// grab the textarea off the dom tree
	var ta = document.getElementById(taID);
	if (document.selection) { //IE win
		// code ripped/modified from Meg Hourihan 
		// http://www.oreillynet.com/pub/a/javascript/2001/12/21/js_toolbar.html
		var str = document.selection.createRange().text;
		ta.focus();
		var sel = document.selection.createRange();
		sel.text = text1 + str + text2;
	} else if (ta.selectionStart | ta.selectionStart == 0) { // Mozzzzzzila relies on builds post bug #88049
		// work around Mozilla Bug #190382
		if (ta.selectionEnd > ta.value.length) { ta.selectionEnd = ta.value.length; }

		// decide where to add it and then add it
		var firstPos = ta.selectionStart;
		var secondPos = ta.selectionEnd+text1.length; // cause we're inserting one at a time

		ta.value=ta.value.slice(0,firstPos)+text1+ta.value.slice(firstPos);
		ta.value=ta.value.slice(0,secondPos)+text2+ta.value.slice(secondPos);
		
		// reset selection & focus... after the first tag and before the second 
		ta.selectionStart = firstPos+text1.length;
		ta.selectionEnd = secondPos;
		ta.focus();
	}	
	//showPreview();
}

function showPreview() {
	document.getElementById('textDisplay').innerHTML = '<p>'+document.getElementById('comComment').value.replace(/(\r\n|\n)/g,'<br />').replace(/(<br \/>){2,}/gi,'<'+'/p><p>')+'<'+'/p>';
}