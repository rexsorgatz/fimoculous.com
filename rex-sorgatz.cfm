<!DOCTYPE html>
<html>
<head>
<title>Rex Sorgatz - Writing</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Merriweather:300|Roboto+Slab:400,700" rel="stylesheet">
<style>	
	
/* main */

body {
    font-family: 'Roboto Slab', serif;
    margin: 0 auto;
    padding: 0;
}
h1 {
	font-size: 10vw;
	font-size: 8vmax;
}
h2 {
	font-size: 3vw;
	font-size: 2.5vmax;
	line-height: 3.2vmax;
}
h3 {
	font-size: 1.5vw;
	font-size: 1.5vmax;
}
p {
	font-size: 3vw;
	font-size: 2.5vmax;
	line-height: 5vw;
	line-height: 4vmax;
	margin: 0;
}
p.small {
	font-size: 2vw;
	font-size: 1.7vmax;
	line-height: 3vw;
	line-height: 2.4vmax;
	margin-top: 10px;
	margin-left: 330px;
}
a {
	color: #000;
	text-decoration: none;
}

/* header */

header img#hero {
    width: 100%;
}
header figcaption {
    position: absolute;
    top: 0px;
    width: 100%;
}
header h1 {
	padding-left: 50px;
	text-shadow: 1px 1px 0px #fff;	
}

/* announcement */

section.announcement {
	margin: 100px 100px 30px 100px;
	background: linear-gradient(#ffec51, #fff8bf);
	border: #edde5b 1px solid;
	border-radius: 25px;
	padding: 30px;
	display: block;
	overflow: auto;
}
section.announcement img {
	float: left;
	padding-right: 30px;
	width: 300px;
}
section.announcement p a {
	box-shadow: inset 0 -3px 0 #000;
}

/* newsletter */

section#newsletter {
	background-color: #EAEAEA;
	margin: 80px 100px 80px 100px;
	border: 1px solid black;
	text-align: center;
	border-radius: 10px;
}
section#newsletter p {
	padding: 10px;
}
/* bio */

section#bio {
	background-color: #fff;
	padding: 100px 100px 30px 100px;
}
section#bio p {
	padding: 0 20px 30px 20px;
    font-family: 'Merriweather', serif;
    font-weight: 300;
}
section#bio p a {
	box-shadow: inset 0 -6px 0 #000;
}
section#bio p a:hover {
	background-color: #b1d7fe;
	box-shadow: inset 0 -6px 0 #b1d7fe;
}
section#bio p:first-child:first-letter {
    font-family: 'Roboto Slab', serif;
	float: left; 
	font-size: 9vw;
	line-height: 10.8vw;
	padding-right: 2vw; 
	padding-left: 2vw; 
	font-weight: bold;
	background-color: #000;
	color: #fff;
	margin-right: 2vw; 
	margin-top: 1vw;
}

/* content */

section#content {
	background-color: #000;
	overflow: hidden;
}
section a {
    text-align: center;
}
section h2 {
   padding: 10px;
   text-shadow: 2px 2px 0px #000;
}
section h3 {
    padding: 10px;
    font-family: 'Merriweather', serif;
    font-style: italic;
    font-weight: 100;
}
section figure {
    width: 25%;
    float: left;
    color: #fff;
    font-size: 40px;
    margin: 0;
    padding: 0;
    position: relative;
}
section figure:before {
    content: "";
    display: block;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0,0,0, 0.6);
    -moz-transition: background .3s linear;
    -webkit-transition: background .3s linear;
    -o-transition: background .3s linear;
    transition: background .3s linear;
}
section figure:hover:before {
    background: rgba(0,0,0, 0.85);
	-moz-transition: background .3s linear;
	-webkit-transition: background .3s linear;
	-o-transition: background .3s linear;
	transition: background .3s linear;
}
section figure img {
    width: 100%;
}
section figure figcaption {
    position: absolute;
    top: 0;
    width: 100%;
}

/* footer */

footer {
	clear: both;
	background-color: #000;
}
footer div {
	text-align: center;	
	padding: 50px;
}
footer div a {
	color: #fff;
}

/* breakpoints */

@media only screen and (max-width: 900px) {
    section figure {
       width: 33%;
    }
	section#bio {
		padding: 20px 50px 40px 50px;
	}
	section.announcement, section#newsletter {
		margin: 20px;
	}
	section#bio p a {
		box-shadow: inset 0 -5px 0 #000;
	}
	section.announcement p a {
		box-shadow: inset 0 -2px 0 #000;
	}
	p.small {
		margin-left: 0;
	}
}
@media only screen and (max-width: 590px) {
	header h1 {
		padding-left: 10px;
	}
    section figure {
       width: 50%;
    }
	section#bio {
		padding: 20px 0 0 0;
	}
	section#bio p a {
		box-shadow: inset 0 -3px 0 #000;
	}
	section.announcement img {
		float: none;
		width: 250px;
	}
}

#mc_embed_signup form {display:block; position:relative; text-align:left; padding:10px;}
#mc_embed_signup input {border:1px solid #999; -webkit-appearance:none;}
#mc_embed_signup input[type=checkbox]{-webkit-appearance:checkbox;}
#mc_embed_signup input[type=radio]{-webkit-appearance:radio;}
#mc_embed_signup input:focus {border-color:#333;}
#mc_embed_signup .button {clear:both; background-color: #000; border: 0 none; border-radius:4px; letter-spacing:.03em; color: #FFFFFF; cursor: pointer; display: inline-block; font-size:15px; height: 32px; line-height: 32px; margin: 0 5px 10px 0; padding:0; text-align: center; text-decoration: none; vertical-align: top; white-space: nowrap; width: auto; transition: all 0.23s ease-in-out 0s;}
#mc_embed_signup .button:hover {background-color:#777;}
#mc_embed_signup .small-meta {font-size: 11px; }
#mc_embed_signup .nowrap {white-space:nowrap;}     
#mc_embed_signup .clear {clear:none; display:inline;}

#mc_embed_signup label {display:block; font-size:16px; padding-bottom:10px; font-weight:bold;}
#mc_embed_signup input.email {text-align: center; font-family:"Open Sans","Helvetica Neue",Arial,Helvetica,Verdana,sans-serif; font-size: 15px; padding:0 0.4em; margin:0 10px 10px 0; min-height:32px; width:58%; min-width:130px; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px;}
#mc_embed_signup input.button {width:35%; margin:0 0 10px 0; min-width:90px; font-family: 'Roboto Slab', serif;}
#mc_embed_signup_scroll{text-align: center;}
</style>
</head>
<body>
	<header>
		<div><img id="hero" src="img/rex-sorgatz.jpg" alt="Rex Sorgatz" /></div>
		<figcaption>
			<h1>Hi,<br />I'm Rex.</h1>
		</figcaption>
	</header>
	<section class="announcement">
		<a href="http://amzn.to/2DzLJ4R"><img src="http://rexsorgatz.com/images/misinfo-cover.jpg" alt="Encyclopedia of Misinformation" /></a>
		<p>I wrote a book!</p>
		<p class="small">It's a strange little collection of tales and tactics of <b>deception</b> and <b>mischief</b> and <b>subterfuge</b>. I sometimes describe as an <b>interactive essay</b> about fakery. It ricochets through reality television, alternate histories, cognitive psychology, documentary reenactments, evolutionary mimicry, artificial intelligence, linguistic trickery, professional wrestling, sex bots, art forgery, and every topic where <em>things are not what they appear</em>.</p>
		<p class="small">Intrigued? <a href="http://amzn.to/2DzLJ4R">Order it!</a>
	</section>
	<section id="bio">
		<p>Have we met? Probably. I have been an Alaskan <a href="https://medium.com/@rexsorgatz/alaskan-canneries-alt-weeklies-revisited-55e22307435e" target="_blank">fish butcher</a>, a web designer, the editor of a paranormal <a href="http://www.fatemag.com/" target="_blank">magazine</a>, a <a href="http://fimoculous.com/" target="_blank">proto-blogger</a>, the co-founder of a few startups, a <a href="http://kindasortamedia.com/" target="_blank">digital consultant</a> for many media companies, a music critic, a Flash developer, the editor of an <a href="http://hpr1.com/" target="_blank">alt-weekly</a>, a contributing editor at Wired, a dungeon master, <a href="https://www.wired.com/2016/04/the-internet-really-has-changed-everything-heres-the-proof/">a North Dakotan</a>, a failed med student, a director of the Olympics <a href="http://www.nbcolympics.com/" target="_blank">website</a>, an <a href="http://amzn.to/2DzLJ4R">encyclopedian</a>, a Microsoftie, a fast-food <a href="http://ny.eater.com/2010/6/9/6730491/4foods-rex-sorgatz-talks-donut-burgers-fast-food-leader-boards-and" target="_blank">innovator</a>, a public radio tech <a href="http://www.mpr.org/">commentator</a>, a code monkey, a script kiddie, <a href="http://nymag.com/news/media/47958/">a microfame faux-expert</a>, a technology instructor, the editor of a print <a href="https://www.flickr.com/photos/fimoculous/3199876137/in/photolist-5SLcGe" target="_blank">magazine</a> about the web, an early hyperlocal <a href="http://mnspeak.com/">website</a> creator, a first amendment <a href="https://web.archive.org/web/20051029050109/http://www.mnspeak.com/mnspeak/archive/post-733.cfm" target="_blank">defendant</a> against a popular satirist, a <a href="https://www.youtube.com/watch?v=Ev06hpjc7Rc" target="_blank">webshow</a> producer, a kinda shitty <a href="https://www.youtube.com/watch?v=Ns0uNGfCFs0" target="_blank">guitarist</a>, a slightly better poker player, an executive producer at <a href="http://www.msnbc.com/" target="_blank">msnbc.com</a>, a <a href="http://www.grandforksherald.com/">webmaster</a>, and part of a team awarded a <a href="https://www.pulitzer.org/winners/grand-forks-nd-herald">Pulitzer Prize</a>.</p>
		<p>I liked college a little too much. I have three Bachelor's Degrees (Philosophy, Literature, Psychology), two Minors (Art History and Intellectual History), and an unfinished Masters (Digital Media).</p>
		<p>I like to write about the intersection of technology and culture.</p>
	</section>
	<section id="content">
		<a href="https://backchannel.com/the-internet-really-has-changed-everything-here-s-the-proof-928eaead18a8" target="_blank">
			<figure>
				<img src="img/fish-dakota.jpg" alt="">
				<figcaption>
					<h2>The Internet Really Has Changed Everything. Here's the Proof.</h2>
					<h3>Backchannel</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://www.wired.com/story/future-of-television-2018/" target="_blank">
			<figure>
				<img src="img/wired-future-of-tv.jpg" alt="">
				<figcaption>
					<h2>How to Be a TV Futurist in Four Simple Steps</h2>
					<h3>WIRED</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/life-atop-ground-zero-c5ab3a25974e" target="_blank">
			<figure>
				<img src="img/wtc-ground-zero.jpg" alt="">
				<figcaption>
					<h2>Life Atop Ground Zero</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/this-is-not-a-vermeer-67b752b150c0" target="_blank">
			<figure>
				<img src="img/vermeer-selfie.jpg" alt="">
				<figcaption>
					<h2>This Is Not a Vermeer</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://nymag.com/news/media/47958/" target="_blank">
			<figure>
				<img src="img/microfame-game.jpg" alt="">
				<figcaption>
					<h2>The Microfame Game</h2>
					<h3>New York Magazine</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/ode-to-the-last-true-hermit-cdcf40975e29" target="_blank">
			<figure>
				<img src="img/maine-hermit.jpg" alt="">
				<figcaption>
					<h2>Ode to the Last True Hermit</h2>
					<h3>Medium</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://backchannel.com/who-are-the-real-life-models-of-silicon-valley-characters-we-have-them-3507bc890d9a" target="_blank">
			<figure>
				<img src="img/silicon-valley.jpg" alt="Silicon Valley Logo">
				<figcaption>
					<h2>Uncanny Silicon Valley</h2>
					<h3>Backchannel</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.fimoculous.com/archive/post-5738.cfm" target="_blank">
			<figure>
				<img src="img/moot.jpg" alt="">
				<figcaption>
					<h2>Interview with Moot, the Creator of 4chan</h2>
					<h3>Fimoculous</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/how-netflix-broke-the-unbreakable-spoiler-alert-f0215bf930cf" target="_blank">
			<figure>
				<img src="img/netflix.jpg" alt="">
				<figcaption>
					<h2>How Netflix Broke the Spoiler Alert</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/tv-channel-guide-from-the-future-606146061694" target="_blank">
			<figure>
				<img src="img/channel-guide.jpg" alt="">
				<figcaption>
					<h2>TV Channel Guide from the Future</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/mr-pink-and-the-tale-of-internet-certification-49c106312e18" target="_blank">
			<figure>
				<img src="img/steve-buscemi.jpg" alt="">
				<figcaption>
					<h2>Mr. Pink & Internet Certification</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://tribecafilm.com/stories/isolated-vocal-tracks-are-for-creating" target="_blank">
			<figure>
				<img src="img/bowie.jpg" alt="">
				<figcaption>
					<h2>Under Pressure: On the Isolated Vocal Track</h2>
					<h3>Tribeca Film</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.wired.com/2007/10/st-essay-2/" target="_blank">
			<figure>
				<img src="img/game-of-life.jpg" alt="">
				<figcaption>
					<h2>When Reality Feels Like Playing a Game</h2>
					<h3>WIRED</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/you-need-to-hear-this-extremely-rare-recording-27619411e077" target="_blank">
			<figure>
				<img src="img/casey-kasem.jpg" alt="">
				<figcaption>
					<h2>You Need to Hear This Extremely Rare Recording</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://web.archive.org/web/20160706021532/http://www.citypages.com/arts/girl-interrupted-6695281" target="_blank">
			<figure>
				<img src="img/plain-layne.jpg" alt="Plain Layne">
				<figcaption>
					<h2>Girl, Interrupted</h2>
					<h3>City Pages</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/uber-for-art-forgeries-2c9c8bf41608" target="_blank">
			<figure>
				<img src="img/vermeer.jpg" alt="">
				<figcaption>
					<h2>Uber for Art Forgeries</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/the-end-of-authentication-cbbfbcb0c49e" target="_blank">
			<figure>
				<img src="img/the-prcocuress.jpg" alt="">
				<figcaption>
					<h2>The End of Authentication</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/the-artist-the-thief-the-forger-and-her-lover-49dc3df79610" target="_blank">
			<figure>
				<img src="img/art-theft.jpg" alt="">
				<figcaption>
					<h2>The Artist, the Thief, the Forger, and Her Lover</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/friend-or-foe-74a818773084#.5hff3ei9d" target="_blank">
			<figure>
				<img src="img/robots.jpg" alt="">
				<figcaption>
					<h2>Friend or Foe</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/x-should-buy-y-cdcfeead2d7f" target="_blank">
			<figure>
				<img src="img/breaking-bad.jpg" alt="">
				<figcaption>
					<h2>[X] Should Buy [Y]</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/surfing-drowning-diving-122612314fa8" target="_blank">
			<figure>
				<img src="img/water.jpg" alt="">
				<figcaption>
					<h2>Surfing, Drowning, Diving: A Brief History of Inventing New Media</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.niemanlab.org/2011/12/rex-sorgatz-la-is-the-future-kill-me-now/" target="_blank">
			<figure>
				<img src="img/future-la.jpg" alt="">
				<figcaption>
					<h2>L.A. Is the Future, Kill Me Now</h2>
					<h3>Nieman Lab</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/message/archive-fever-2a330b627274" target="_blank">
			<figure>
				<img src="img/cds.jpg" alt="">
				<figcaption>
					<h2>Archive Fever</h2>
					<h3>The Message</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://decider.com/author/rex-sorgatz/" target="_blank">
			<figure>
				<img src="img/oj.jpg" alt="">
				<figcaption>
					<h2>People v. OJ Simpson Recaps</h2>
					<h3>Decider</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.wired.com/2009/03/st-flowchart-2/" target="_blank">
			<figure>
				<img src="img/blowhard.jpg" alt="">
				<figcaption>
					<h2>Flowchart: Which Blowhard Am I?</h2>
					<h3>WIRED</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://tribecafilm.com/stories/trapped-in-the-loop-edward-snowden-gifs-vine-instagram" target="_blank">
			<figure>
				<img src="img/snowden.jpg" alt="">
				<figcaption>
					<h2>Trapped in the Loop</h2>
					<h3>Tribeca Film</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.niemanlab.org/2012/08/rex-sorgatz-what-the-new-york-times-should-do-next-membership/" target="_blank">
			<figure>
				<img src="img/nyt-card.jpg" alt="">
				<figcaption>
					<h2>What the <em>New York Times</em> Should Do Next</h2>
					<h3>Nieman Lab</h2>
				</figcaption>
			</figure>
		</a>
		<a href="http://www.fimoculous.com/archive/post-3813.cfm" target="_blank">
			<figure>
				<img src="img/wired.jpg" alt="">
				<figcaption>
					<h2>Wired 1.1: An Archaeology</h2>
					<h3>Fimoculous</h2>
				</figcaption>
			</figure>
		</a>
		<a href="https://medium.com/@rexsorgatz/alaskan-canneries-alt-weeklies-revisited-55e22307435e" target="_blank">
			<figure>
				<img src="img/alaska.jpg" alt="">
				<figcaption>
					<h2>Dreaming of Dead Fish</h2>
					<h3>High Plains Reader</h2>
				</figcaption>
			</figure>
		</a>
		<!--
		<a href="https://tribecafilm.com/stories/the-internet-is-screaming-at-your-tv" target="_blank">
			<figure>
				<img src="img/zuki-deck.jpg" alt="">
				<figcaption>
					<h2>The Internet Is Screaming at You</h2>
					<h3>Tribeca Film</h2>
				</figcaption>
			</figure>
		</a>
		-->
	</section>
	<section id="newsletter">
		<p class="small" style="margin-left:0;">I have two newsletters.</p>
		<p class="small" style="margin-left:0;">This first contains weekly recommendations from culture, tech, media, design, and science.<br/><a href="http://fimoculous.com/recs/"><u>Sign up for that one over here</u></a>.</p>
		<p class="small" style="margin-left:0;">The other one is more like yearly, and contains updates on big projects. For that one, enter your info below:</p>
		<div id="mc_embed_signup">
		<form action="https://viewsource.us6.list-manage.com/subscribe/post?u=baf0f5b8fa9d9bcf79878b435&amp;id=d6e921d32b" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
		    <div id="mc_embed_signup_scroll">
			<input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required>
		    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
		    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_baf0f5b8fa9d9bcf79878b435_d6e921d32b" tabindex="-1" value=""></div>
		    <div class="clear"><input type="submit" value="SUBSCRIBE" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
		    </div>
		</form>
		</div>
	</section>
	<footer>
		<div><a href="mailto:rexsorgatz@gmail.com" target="_blank">Contact</a> | <a href="http://kindasortamedia.com/" target="_blank">Consulting</a> | <a href="http://twitter.com/fimoculous" target="_blank">Twitter</a> | <a href="https://www.instagram.com/rexsorgatz/" target="_blank">Instagram</a> | <a href="http://www.facebook.com/rexsorgatz/" target="_blank">Facebook</a> | <a href="https://medium.com/@rexsorgatz/" target="_blank">Medium</a> | <a href="https://www.linkedin.com/in/rexsorgatz/" target="_blank">LinkedIn</a></div>
	</footer>
<script>
function loadResize() {
	var divWidth = $('figure').width(); 
    $('figure').height(divWidth);
}
$(window).resize(function(){
	loadResize();
});
$(window).load(function() {
	loadResize();
});
</script>
</body>
</html>