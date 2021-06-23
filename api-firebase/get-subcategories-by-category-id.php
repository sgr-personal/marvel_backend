<?php
header('Access-Control-Allow-Origin: *');
header("Content-Type: application/json");
header("Expires: 0");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

include_once('../includes/crud.php');
$db = new Database();
$db->connect();
include_once('../includes/variables.php');
include_once('verify-token.php');
include_once('../includes/custom-functions.php');
$fn = new custom_functions;

/* 
get-subcategories-by-category-id.php
    accesskey:90336 
    category_id:28 
*/

if (!verify_token()) {
    return false;
}
if (isset($_POST['accesskey']) && isset($_POST['category_id'])) {

    $access_key_received = $db->escapeString($fn->xss_clean($_POST['accesskey']));
    $category_id = $db->escapeString($fn->xss_clean($_POST['category_id']));
    if ($access_key_received == $access_key) {
        $sql_query = "SELECT * 
				FROM subcategory WhERE category_id='" . $category_id . "'
				ORDER BY id DESC ";
        $db->sql($sql_query);
        $res = $db->getResult();
        $db->disconnect();
        if (!empty($res)) {
            for ($i = 0; $i < count($res); $i++) {
                $res[$i]['image'] = (!empty($res[$i]['image'])) ? DOMAIN_URL . '' . $res[$i]['image'] : '';
            }
            $response['error'] = "false";
            $response['data'] = $res;
        } else {
            $response['error'] = "true";
            $response['message'] = "No data found!";
        }
        print_r(json_encode($response));
    } else {
        die('accesskey is incorrect.');
    }
} else {
    die('accesskey and category id are required.');
}
