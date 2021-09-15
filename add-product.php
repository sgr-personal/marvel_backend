<?php
	// start session

	session_start();
	// set time for session timeout
	$currentTime = time() + 25200;
	$expired = 3600;

	// if session not set go to login page
	if(!isset($_SESSION['user'])){
		header("location:index.php");
	}

	// if current time is more than session timeout back to login page
	if($currentTime > $_SESSION['timeout']){
		session_destroy();
		header("location:index.php");
	}

	// destroy previous session timeout and create new one
	unset($_SESSION['timeout']);
	$_SESSION['timeout'] = $currentTime + $expired;
?>
<?php include"header.php";?>
<html>
<head>
<title>Add Product | <?=$settings['app_name']?> - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<style>
.asterik {
    font-size: 20px;
    line-height: 0px;
    vertical-align: middle;
}
.select2-results__option[aria-selected=true] {
    display: none;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice {
    color: #000 !important;
}
</style>
</head>
</body>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <?php include('public/add-product-form.php'); ?>
      </div><!-- /.content-wrapper -->
  </body>
</html>
<?php include"footer.php";?>
