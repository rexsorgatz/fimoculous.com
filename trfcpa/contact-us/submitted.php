<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Contact - Kays, Lundgren, St. Germain & Co</title>
    <meta name="format-detection" content="telephone=no" />
    <meta name="keywords" content="CPA, Accountant, Tax, Tax Preparation, MN, Minnesota, Thief River Falls, Tom Kays, Charles Lundgren, Ryan St Germain">
    <meta name="description" content="Kays, Lundgren, St. Germain & Co., LLP is a full service tax, accounting and business consulting firm located in Thief River Falls, MN" />
    <meta name="subject" content="Accounting">
    <meta name="og:title" content="Kays, Lundgren, St. Germain & Co" />
    <meta name="og:image" content="http://trfcpa.com/images/logo.png" />
    <meta name="og:phone_number" content="218-683-5351" />
	<meta name="og:fax_number" content="+1-218-683-5353" />
	<meta name="og:street-address" content="216 Pennington Ave" />
	<meta name="og:locality" content="Thief River Falls" />
	<meta name="og:region" content="MN" />
	<meta name="og:postal-code" content="56701" />
	<meta name="og:country-name" content="USA" />
	<link href="../favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link rel="stylesheet" href="../style.css?x=1">
</head>
<body class="sub">
	<header>
		<div id="main-navigation">
			<ul>
				<a href="/"><li><img src="../images/logo-band-small.png" alt="home" /><span>home</span></li></a>
				<a href="/trfcpa/services/"><li>Services</li></a>
				<a href="/trfcpa/about-us/"><li>About Us</li></a>
				<a href="/trfcpa/faqs/"><li>FAQs</li></a>
				<a href="/trfcpa/contact-us/"><li>Contact Us</li></a>
			</ul>
		</div>
		<div id="main-logo">
				<a href="/"><img src="../images/logo-new.png" alt="Kays, Lundgren, St. Germain" /></a>
			</div>
		<div id="main-art">
			<img src="../images/img-trf-sign.jpg" alt="thief river falls" />
		</div>
	</header>
	<article>
		<div class="content">
			<h1>Thank you!</h1>
			<p>We'll be in touch soon. <a href="/">Return to the homepage</a>.<p>
				<?php
					function clean_string($string) {
						$bad = array("content-type","bcc:","to:","cc:","href");
						return str_replace($bad,"",$string);
    				}
					$from_name = $_POST['from_name'];
					$from_email = $_POST['from_email'];
					$from_mess = $_POST['from_mess'];
					$from_phone = $_POST['from_phone'];
					$from_meth = $_POST['from_meth'];
					$to = 'info@trfcpa.com';
					$subject = 'Website - Request Appointment Form';
					$message = 'Name: ' . clean_string($from_name) . "\r\n" . 'Email: ' . clean_string($from_email)  . "\r\n" . 'Phone: ' . clean_string($from_phone) . "\r\n" . 'Preferred Contact Method: ' . clean_string($from_meth) . "\r\n\r\n" . clean_string($from_mess). "\r\n";
					$headers = 'From: info@trfcpa.com' . "\n" .
					    'Reply-To: info@trfcpa.com' . "\n" .
					    'X-Mailer: PHP/' . phpversion();
					if ((strpos($from_name, '5a') === false) && (strpos($from_mess, '.ru') === false) ) {
						//mail($to, $subject, $message, $headers);
					} 
				?> 
		</div>
	</article>
	<footer>
		<div id="footer-halo"><img src="../images/halo.png" alt="logo halo" /></div>
		<div class="info location">
			<div>
				<img src="../images/icon-location.png" alt="Office Location" />
				<p>216 Pennington Ave<br />Suite A<br />PO Box 407<br />Thief River Falls, MN 56701</p>
			</div>
		</div>
		<div class="info contact">
			<div>
				<img src="../images/icon-phone.png" alt="Office Contact" />
				<p>Phone: 218-683-5351<br />Fax: 218-683-5353<br />Email: <a href="mailto:info@trfcpa.com">info@trfcpa.com</a></p>
			</div>
		</div>
		<div class="info hours">
			<div>
				<img src="../images/icon-clock.png" alt="Office Hours" />
				<p>Monday to Friday<br />8:00 am - 5:00 pm</p>
			</div>
		</div>
	</footer>
</body>
</html>
