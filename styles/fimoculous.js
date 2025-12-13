//preload because it doesn't load itself all the time

var preload=new Image();
preload.src="(http://www.fimoculous.com/images/bullet-small.gif)";


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

	
//linking popup vs. inline
function targetWin(link){
	if (link) where = "_blank";
	else where = "_self";
	for (var i=0; i<=(document.links.length-1); i++) {
		document.links[i].target = where;
		}
	}
	
//Bookmark Me
function bookmarkMe() {
	window.external.addFavorite('http://www.fimoculous.com/','Fimoculous.com');
	}
	
//write fortune cookie

FortuneCookie = [
	"Travel makes you dumb",
	"How many more days can you act like this?",
	"How good are you? Huh, how good?",
	"You don't need no stinkin blogger!",
	"What was that for? What was that for?",
	"Everything in its right place.",
	"Think Globably, Porn Locally",
	"You are bigger and stronger than your remember.",
	"Jigglypuff.",
	"She doesn't like it when you do that."
	];

function getFortuneCookie() {                               
	var rand = Math.round(Math.random()*(FortuneCookie.length-1)); 
	document.write(FortuneCookie[rand]);                                     
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

// random header image
var theImages = new Array()

theImages[0] = 'logo1.jpg'
theImages[1] = 'logo2.jpg'
theImages[2] = 'logo3.jpg'

var j = 0
var p = theImages.length;
var preBuffer = new Array()
for (i = 0; i < p; i++){
   preBuffer[i] = new Image()
   preBuffer[i].src = theImages[i]
}
var whichImage = Math.round(Math.random()*(p-1));
function showImage(){
document.write('<img width="380" height="72" border="0" src="/header/'+theImages[whichImage]+'">');
}