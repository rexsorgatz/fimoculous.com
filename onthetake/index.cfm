<!DOCTYPE html>
<html lang="en">
<head>
<title>On The Take - A Podcast on the Culture of Takes</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/onthetake/fire.ico" type="image/x-icon">
<link rel="icon" href="/onthetake/fire.ico" type="image/x-icon">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- REMOVE -->
<meta content="noindex" name="robots"/>
<meta name="description" content="A weekly investigation into the creation and spread of hot takes."/>
<meta property="og:description" content="A weekly investigation into the creation and spread of hot takes."/>
<meta property="og:url" content="#"/>
<meta property="og:title" content="On the Take"/>
<meta property="og:type" content="website"/>
<meta property="og:image" content="http://www.onthetakeshow.com/onthetake/img/logo.png"/>
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="On the Take"/>
<meta name="twitter:description" content="A weekly investigation into the creation and spread of hot takes."/>
<meta name="twitter:url" content="#"/>
<style>
@font-face {
    font-family: IntLight;
    src: url(/onthetake/fonts/Intro-Light.otf);
}
@font-face {
    font-family: IntThin;
    src: url(/onthetake/fonts/Intro-Thin.otf);
}
@font-face {
    font-family: IntBook;
    src: url(/onthetake/fonts/Intro-Book.otf);
}
body,p,h1,h2,h3,h4,h5{margin:0;padding:0;}
body {
	background-color: #250a46;
}
a {
	color: #422500;
}
h1 {
	font-family: IntBook;
	font-size: 20px;
	color: #bd680b;
	padding: 5px 8px 0 8px;
	text-align: left;
	line-height: 26px;
}
h2 {
	font-family: IntLight;
	font-size: 28px;
	line-height: 36px;
	color: #250a46;
	width: 50%;
	text-align: center;
	margin: 20px auto 20px auto;
}
h3 {
	font-family: IntThin;
	font-size: 28px;
	color: #bd680b;
	text-transform: uppercase;
	margin: 100px 0 30px 0;
	letter-spacing: 3px;
}
h4 {
	font-family: IntLight;
	font-size: 16px;
	color: #ee4e00;
	padding: 5px 8px 10px 8px;
	text-align: left;
}
h5 {
	background: rgba(189, 104, 11, .4); 
	font-family: IntLight;
	font-size: 12px;
	color: #ffef99;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 0 4px 0;
	position:absolute;
	width: 100%;
}
p {
	font-family: sans-serif;
	font-size: 14px;
	padding: 0 8px 10px 8px;
	text-align: left;
	line-height: 22px;
	color: #422500;
}
rect {
  fill: url(#grad1);
}
#stop1 {
  animation: change-color1 4s ease-in-out infinite alternate;
}
#stop2 {
  animation: change-color2 4s ease-in-out infinite alternate;
}
@keyframes change-color1 {
  0% {stop-color: #a93800;} /* deep orange */
  30% {stop-color: #ff7c00;} /* orange */
  100% {stop-color: #250a46;} /* purple */
}
@keyframes change-color2 {
  0% {stop-color: #250a46;} /* purple */
  100% {stop-color: #ffd200;} /* yellow */
}
header {
	position:relative;
	width: 100%;
	padding-bottom: 70px;
}
footer {
	background-image: url("footer-gradient.jpg");
	width: 100%;
	height: 292px;
	background-repeat: no-repeat;
	background-size: cover;
}
#background-header {
	z-index: 1;
	width: 100%;
	height: 580px;
	position: relative;
	width: 100%;
}
#ellipse {
	z-index: 2;
	width: 100%;
	height: 300px;
	position: absolute;
	left: 0;
	right: 0;
	margin: 0 auto;
	top: 530px;
}
#logo {
	z-index: 4;
	width: 100%;
	position: absolute;
	top: 200px;
	left: 0;
	right: 0;
	margin: 0 auto;
	width: 388px;
}
#drop-shadow {
	z-index: 3;
	width: 100%;
	position: absolute;
	top: 550px;
	left: 0;
	right: 0;
	margin: 0 auto;
	width: 518px;
	opacity: .6;
}
#apple-podcasts {
	padding: 0;
	margin: 70px 0 0 0;
}
main {
	position: relative;
	z-index: 5;
	margin: 0 auto;
	text-align: center;
	width: 100%;
	padding-bottom: 80px;
	background-color: #fffdf0;
}
.container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}
.date {
	float: left;
	padding: 0 0 0 5px;
}
.ep {
	float: right;
	padding: 0 5px 0 0;
	opacity: 0;
}
.audio-icon {
	position:absolute; 
	top: 140px; 
	left: 50%; 
	margin-left: -50px;
	opacity: 0;
}
.episode {
	max-width: 250px;
	border: 1px solid #ffe5c9;
	background-color: #fff;
	position: relative;
	float: left;
	margin-right: 15px;
	margin-left: 15px;
	height: 100%;
	transition: .2s ease-in;
}
.container a {
	margin-bottom: 30px;
}
.host {
	position: relative;
	max-width: 390px;
	float: left;
	margin-left: 15px;
	margin-right: 15px;
}
.container .host p {
	padding-left: 0;
}
a div.episode {
	transition: .2s ease-in;
}
a div.episode:hover {
	border-color: #bd680b;
	background-color: #fff;
}
a div.episode h5 {
	transition: .2s ease-in;
}
a div.episode:hover h5 {
	background: rgba(189, 104, 11, .8); 
}
a div.episode .ep {
	transition: .2s ease-in;
}
a div.episode:hover .ep {
	opacity: 1;
}
a div.episode .audio-icon {
	transition: .2s ease-in;
}
a div.episode:hover .audio-icon {
	opacity: 1;
}
.newsletter {
}
.newsletter h3 {
	margin-bottom: 10px;
}
.newsletter p {
	color: #250a46;
	padding-left: 0;
	text-align: center;
}
.newsletter input[type="email"] {
	padding: 15px 0 15px 40px;
	background-color: #ffbf6c;
	border: 1px solid #a03100;
	width: 250px;
	color: #bd680b;
	font-family: IntLight;
	font-size: 18px;
	background-image: url("/onthetake/img/fire-medium.png");
	background-repeat: no-repeat;
	background-position: 2% center;
}
.newsletter input[type="email"]:focus {
	outline-width: 0;
}
.newsletter input::placeholder {
	color: #bd680b;
	font-family: IntLight;
	font-size: 18px;
}
.newsletter input[type="submit"] {
	font-family: IntBook;
	font-size: 18px;
	padding: 15px;
	background-color: #ff8700;
	border: 1px solid #a03100;
	color: #250a46;
	text-transform: uppercase;
	letter-spacing: 2px;
	cursor: pointer; 
}
.btr {
	float:right;
	padding: 170px 100px 0 0;
}
iframe#twitter-widget-0 {
	border: 1px solid #ffe5c9 !important;
}
@media only screen and (max-width: 600px) {
	iframe#twitter-widget-0 {
		width: 250px !important;
	}
    h2 {
		width: 90%;
		font-size: 24px;
		line-height: 30px;
    }
	h3 {
		font-size: 24px;
	}
    .newsletter {
    }
    #logo {
	    width: 250px;
	    top: 320px;
    }
    #logo img {
	    width: 280px;
	    height: 280px;
    }
	#drop-shadow {
		top: 530px;
		width: 280px;
	}
	#drop-shadow img {
		width: 280px;
	}
	.host {
		max-width: 280px;
	}
	.host img {
		width: 280px;
		height: auto;
	}
}
</style>
</head>
<body>
<script>AOS.init();</script>
<header>
	<svg id="background-header">
	  <defs>
	    <linearGradient gradientTransform="rotate(-35)" id="grad1" gradientUnits="userSpaceOnUse">
	      <stop id="stop1" offset="0%"/>
	      <stop id="stop2" offset="100%"/>
	    </linearGradient>
	  </defs>
	  <rect width="100%" height="100%"/>
	</svg>
	<svg id="ellipse" viewBox="0 0 100 70">
		<ellipse fill="#fffdf0" cx="50" cy="50" rx="350" ry="50" />
	</svg>
	<div data-aos="zoom-in" id="logo">
		<img src="/onthetake/img/logo.png?x=1" alt="on the take podcast" width="388" height="388" />
	</div>
	<div id="drop-shadow">
		<img src="/onthetake/img/drop-shadow.png" width="518" height="78">
	</div>
</header>
<main>
	<h2>A weekly investigation into the creation and spread of <em>hot takes</em> &mdash; those provoking, controversial, infectious, and, on occasion, scorchingly ludicrous zingers that corrode modern media.</h2>
	<div class="newsletter">
		<h3>Coming Soon</h3>
		<p>Sign up to be notified when new episodes drop.</p>
		<div id="mc_embed_signup">
		<form action="https://onthetakeshow.us7.list-manage.com/subscribe/post?u=689707c8762cfb426b368c8fd&amp;id=d685f6180c" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
		    <div id="mc_embed_signup_scroll">
				<div class="mc-field-group"><input placeholder="enter email" type="email" value="" name="EMAIL" class="required email" id="mce-EMAIL" /><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
			    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_689707c8762cfb426b368c8fd_d685f6180c" tabindex="-1" value=""></div>
		    </div>
		</form>
		</div>
	</div>
</main>
</body>
</html>
