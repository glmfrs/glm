1FICHIER et cURL

Connexion et stockage du cookie

$username = 'test';
	$password = 'test';
	$loginUrl = 'http://www.1fichier.com/login.pl';
	$cookie=$_SERVER['DOCUMENT_ROOT'].'/cookies/cookie'.session_id().'.txt';
 
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);	
	curl_setopt($ch, CURLOPT_URL, $loginUrl);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, 'mail='.$username.'&pass='.$password.'&submit=Login');
	curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie);
	curl_setopt($ch,CURLOPT_COOKIESESSION,true);
	$store = curl_exec($ch);
	curl_close($ch);
	
Verification

$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
	curl_setopt($ch, CURLOPT_URL, 'http://www.1fichier.com/');
	curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie);
	curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie);
	$store2 = curl_exec($ch);
	echo $store2;
	curl_close($ch);
