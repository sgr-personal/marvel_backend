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
get-categories.php
    accesskey:90336 
*/
if (!verify_token()) {
    return false;
}
if (isset($_POST['accesskey'])) {
    $access_key_received = $db->escapeString($fn->xss_clean($_POST['accesskey']));
    if ($access_key_received == $access_key) {
        // get all category data from category table
        $where = '';
        if (isset($_POST['ids']) && trim($_POST['ids']) != '')
            $where = " id in ('" . implode("','", explode(",", $_POST['ids'])) . "')";
        $sql_query = "SELECT * FROM attributes " . $where . " ORDER BY name ASC ";
        $db->sql($sql_query);
        $res = $db->getResult();
        if (!empty($res)) {
            $tmp = [];
            foreach ($res as $r) {
                $r['values'] = [];

                $db->sql("SELECT * FROM attribute_values WHERE attribute_id = '" . $r['id'] . "' ORDER BY name ASC");
                $values = $db->getResult();
                if (!empty($values)) {
                    for ($i = 0; $i < count($values); $i++) {
                        $r['values'][$values[$i]['slug']] = (array)$values[$i];
                    }
                }
                $tmp[$r['slug']] = $r;
            }
            $res = $tmp;
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
    die('accesskey is require.');
}
$db->disconnect();
