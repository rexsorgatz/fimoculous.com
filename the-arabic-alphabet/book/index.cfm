<cfset chapter = "Book"><cfinclude template="../_header.cfm">


<script>
function plusSlides(n) {
  showSlides(slideIndex += n);
}
function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>


<article>

	<h1><a href="/">The Arabic Alphabet: A Guided Tour</a></h1>
	<h4>by Michael Beard</h4>
	<h5>illustrated by Houman Mortazavi</h5>
	
		
	<p>Below are some pages design specifically for a physical book. Click through them to see the work of illustrator Houman Mortazavi.</p>
	<br>
	
</article>

<div class="slideshow-container">
	<div class="mySlides fade"><img src="/the-arabic-alphabet/_img/book1.jpg"></div>
	<div class="mySlides fade"><img src="/the-arabic-alphabet/_img/book2.jpg"></div>
	<div class="mySlides fade"><img src="/the-arabic-alphabet/_img/book3.jpg"></div>
	<div class="mySlides fade"><img src="/the-arabic-alphabet/_img/book4.jpg"></div>
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<div class="dots">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
</div>


<div class="signup">
	<p>Signup for announcements, including additional chapters and book releases.</p>
	<form action="https://alifbatourguide.us19.list-manage.com/subscribe/post?u=6dc8022267c2170ee6aa5c523&amp;id=547a2f421d" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
		<input type="email" value="" name="EMAIL" placeholder="enter email" class="required email" id="mce-EMAIL">
		<div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_6dc8022267c2170ee6aa5c523_547a2f421d" tabindex="-1" value=""></div>
		<input type="submit" value="SUBMIT" name="subscribe" id="mc-embedded-subscribe" class="button">
	</form>
</div>


<script>
var slideIndex = 1;
showSlides(slideIndex);
</script>



<cfinclude template="../_footer.cfm">