<?php

if(!$_POST) exit;

// Email verification, do not edit.
function isEmail($email_booking ) {
	return(preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/",$email_booking ));
}

if (!defined("PHP_EOL")) define("PHP_EOL", "\r\n");
$adults     = $_POST['adults'];
$senior     = $_POST['senior'];
$student     = $_POST['student'];
$date_pick     = $_POST['date_pick'];
$name_lastname_booking = $_POST['name_lastname_booking'];
$email_booking   = $_POST['email_booking'];
$telephone_booking   = $_POST['telephone_booking'];
$verify_booking   = $_POST['verify_booking'];
$total   = $_POST['total'];
$tour_name   = $_POST['tour_name'];

if(trim($adults) == '') {
	echo '<div class="error_message">Enter adults number.</div>';
	exit();
} else if(trim($senior ) == '') {
	echo '<div class="error_message">Enter senior number.</div>';
	exit();
} else if(trim($student ) == '') {
	echo '<div class="error_message">Enter student number.</div>';
	exit();
} else if(trim($date_pick ) == '') {
	echo '<div class="error_message">Please enter a date.</div>';
	exit();
} else if(trim($name_lastname_booking ) == '') {
	echo '<div class="error_message">Enter your Name and Last name.</div>';
	exit();
} else if(trim($email_booking) == '') {
	echo '<div class="error_message">Please enter a valid email address.</div>';
	exit();
} else if(!isEmail($email_booking)) {
	echo '<div class="error_message">You have enter an invalid e-mail address, try again.</div>';
	exit();
} else if(trim($telephone_booking) == '') {
	echo '<div class="error_message">Please enter a valid phone number.</div>';
	exit();
} else if(!is_numeric($telephone_booking)) {
	echo '<div class="error_message">Phone number can only contain numbers.</div>';
	exit();
} else if(!isset($verify_booking) || trim($verify_booking) == '') {
	echo '<div class="error_message"> Please enter the verification number.</div>';
	exit();
} else if(trim($verify_booking) != '4') {
	echo '<div class="error_message">The verification number you entered is incorrect.</div>';
	exit();
}


//$address = "HERE your email address";
$address = "info@domain.com";


// Below the subject of the email
$e_subject = 'You\'ve been contacted by ' . $name_lastname_booking . '.';

// You can change this if you feel that you need to.
$e_body = "You have been contacted by $name_lastname_booking with additional message as follows." . PHP_EOL . PHP_EOL;
$e_content = "Tour name: $tour_name\nName and Lastname: $name_lastname_booking\nDate: $date_pick\nNumber of adults: $adults\nNumber of seniors: $senior\nNumber of students: $student\n\nTOTAL: $total" . PHP_EOL . PHP_EOL;
$e_reply = "You can contact $name_lastname_booking via email $email_booking or via phone $telephone_booking ";

$msg = wordwrap( $e_body . $e_content . $e_reply, 200 );

$headers = "From: $email_booking" . PHP_EOL;
$headers .= "Reply-To: $email_booking" . PHP_EOL;
$headers .= "MIME-Version: 1.0" . PHP_EOL;
$headers .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$headers .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;

$user = "$email_booking";
$usersubject = "Thank You";
$userheaders = "From: info@bestours.com\n";
$userheaders .= "MIME-Version: 1.0" . PHP_EOL;
$userheaders .= "Content-type: text/plain; charset=utf-8" . PHP_EOL;
$userheaders .= "Content-Transfer-Encoding: quoted-printable" . PHP_EOL;
$usermessage = "Thank you for contact BesTours. We will reply shortly with more details. Here a summary of your request: \n\n$e_content.  \n\n Call 0034 434324  for further information.";
mail($user,$usersubject,$usermessage,$userheaders);

if(mail($address, $e_subject, $msg, $headers)) {

	// Success message
	echo "<div id='success_page' style='padding:10px 20px 30px 20px; text-align:center; font-size:14px;'>";
	echo "<div style='font-size:60px; font-weight:normal;color:#acd373;'><i class='icon_set_1_icon-76'></i></div>";
	echo "<strong >REQUEST SENT</strong><br>";
	echo "Thank you <strong>$name_lastname_booking</strong>,<br> your request has been submitted.<br> We will contact you shortly or call 0043 403043403.<br><br> A summary has been sent to $email_booking <br><small>(check your spam folder)</small>.";
	echo "</div>";

} else {

	echo 'ERROR!';

}
