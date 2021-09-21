<?php
header('Access-Control-Allow-Origin: *');
include_once('../includes/crud.php');
$db = new Database();
$db->connect();
include_once('../includes/variables.php');
include_once('verify-token.php');
include_once('../includes/custom-functions.php');
$fn = new custom_functions;
if (!verify_token()) {
    return false;
}
if (isset($_POST['accesskey'])) {
    $access_key_received = $db->escapeString($fn->xss_clean($_POST['accesskey']));
    $sort = (isset($_POST['sort']) && !empty($_POST['sort'])) ? $db->escapeString($fn->xss_clean($_POST['sort'])) : 'id';

    $user_id = (isset($_POST['user_id']) && is_numeric($_POST['user_id'])) ? $db->escapeString($fn->xss_clean($_POST['user_id'])) : "";
    $limit = (isset($_POST['limit']) && !empty($_POST['limit']) && is_numeric($_POST['limit'])) ? $db->escapeString($fn->xss_clean($_POST['limit'])) : '10';
    $offset = (isset($_POST['offset']) && !empty($_POST['offset']) && is_numeric($_POST['offset'])) ? $db->escapeString($fn->xss_clean($_POST['offset'])) : '0';

    if ($access_key_received == $access_key) {

        if ($sort == 'new') {
            $sort = 'ORDER BY date_added DESC';
            $price = 'MIN(price)';
            $price_sort = 'pv.price ASC';
        } elseif ($sort == 'old') {
            $sort = 'ORDER BY date_added ASC';
            $price = 'MIN(price)';
            $price_sort = 'pv.price ASC';
        } elseif ($sort == 'high') {
            $sort = 'ORDER BY price DESC';
            $price = 'MAX(price)';
            $price_sort = 'pv.price DESC';
        } elseif ($sort == 'low') {
            $sort = 'ORDER BY price ASC';
            $price = 'MIN(price)';
            $price_sort = 'pv.price ASC';
        } else {
            $sort = 'ORDER BY p.row_order ASC';
            $price = 'MIN(price)';
            $price_sort = 'pv.price ASC';
        }

        $where = [];
        if (isset($_POST['s']) && $_POST['s'] != '') {
            $search = $db->escapeString($fn->xss_clean($_POST['s']));
            $where[] = " (`id` like '%" . $search . "%' OR `name` like '%" . $search . "%' OR `image` like '%" . $search . "%' OR `subcategory_id` like '%" . $search . "%' OR `slug` like '%" . $search . "%' OR `description` like '%" . $search . "%')";
        }

        if (isset($_POST['section']) && intval($_POST['section'])) {
            $sql = "select product_ids from `sections` where sections.id = '" . intval($_POST['section']) . "'";
            $db->sql($sql);
            $categoriesult = $db->getResult();
            $product_ids = [];
            if (isset($categoriesult[0]['product_ids'])) {
                $product_ids = explode(',', $categoriesult[0]['product_ids']);
            }
            $product_ids = implode("','", $product_ids);
            $where[] = " id IN ('" . $product_ids . "')";
        }
        $categoryCondition = [];

        if (isset($_POST['category']) && trim($_POST['category']) != "") {
            $categoryCondition[] = " category_id in ('" . implode("','", explode(",", $_POST['category'])) . "')";
        }
        if (isset($_POST['sub-category']) && trim($_POST['sub-category']) != "") {
            $categoryCondition[] = " subcategory_id in ('" . implode("','", explode(",", $_POST['sub-category'])) . "')";
        }
        if (count($categoryCondition)) {
            $where[] = "(" . implode(") or (", $categoryCondition) . ")";
        }

        if (isset($_POST['attribute-value']) && trim($_POST['attribute-value']) != "") {
            $where[] = " attribute_value_id in ('" . implode("','", explode(",", $_POST['attribute-value'])) . "')";
        }

        if (count($where)) {
            $where = "(" . implode(") and (", $where) . ")";
        } else {
            $where = " 1";
        }
        $sql = "SELECT count(p.id) as total, MIN((select MIN(if(discounted_price > 0, discounted_price, price)) from product_variant where product_variant.product_id = p.id)) as min_price, MAX((select MAX(if(discounted_price > 0, discounted_price, price)) from product_variant where product_variant.product_id = p.id)) as max_price FROM products p LEFT JOIN product_attributes attr ON attr.product_id=p.id WHERE $where ";
        $db->sql($sql);
        $totalResult = $db->getResult();
        $total = $totalResult[0]['total'];
        $min_price = $totalResult[0]['min_price'];
        $max_price = $totalResult[0]['max_price'];

        $sql = "SELECT DISTINCT p.*,(SELECT " . $price . " FROM product_variant pv WHERE pv.product_id=p.id) as price, (select MIN(if(discounted_price > 0, discounted_price, price)) from product_variant where product_variant.product_id = p.id) as min_price, (select MAX(if(discounted_price > 0, discounted_price, price)) from product_variant where product_variant.product_id = p.id) as max_price FROM products p LEFT JOIN product_attributes attr ON attr.product_id=p.id WHERE $where ";
        if (isset($_POST['min_price']) && isset($_POST['max_price']) && intval($_POST['max_price'])) {
            $sql .= " Having min_price > " . intval(intval($_POST['min_price']) - 1) . " and max_price < " . intval(intval($_POST['max_price']) + 1);
        }
        $sql .= " $sort LIMIT $offset, $limit";
        $db->sql($sql);
        $products = $db->getResult();
        $product = array();

        $i = 0;
        foreach ($products as $row) {
            $row['other_images'] = json_decode($row['other_images'], 1);
            $row['other_images'] = (empty($row['other_images'])) ? array() : $row['other_images'];

            for ($j = 0; $j < count($row['other_images']); $j++) {
                $row['other_images'][$j] = DOMAIN_URL . $row['other_images'][$j];
            }
            $row['image'] = DOMAIN_URL . $row['image'];
            if (!empty($user_id)) {
                $sql = "SELECT id from favorites where product_id = " . $row['id'] . " AND user_id = " . $user_id;
                $db->sql($sql);
                $categoriesult = $db->getResult();
                if (!empty($categoriesult)) {
                    $row['is_favorite'] = true;
                } else {
                    $row['is_favorite'] = false;
                }
            } else {
                $row['is_favorite'] = false;
            }

            $product[$i] = $row;
            $sql = "SELECT *,(SELECT short_code FROM unit u WHERE u.id=pv.measurement_unit_id) as measurement_unit_name,(SELECT short_code FROM unit u WHERE u.id=pv.stock_unit_id) as stock_unit_name FROM product_variant pv WHERE pv.product_id=" . $row['id'] . " ORDER BY serve_for ASC ," . $price_sort . "";
            $db->sql($sql);
            $variants = $db->getResult();
            for ($k = 0; $k < count($variants); $k++) {
                if ($variants[$k]['stock'] <= 0) {
                    $variants[$k]['serve_for'] = 'Sold Out';
                } else {
                    $variants[$k]['serve_for'] = 'Available';
                }
                if (!empty($user_id)) {
                    $sql = "SELECT qty as cart_count FROM cart where product_variant_id= " . $variants[$k]['id'] . " AND user_id=" . $user_id;
                    $db->sql($sql);
                    $categories = $db->getResult();
                    if (!empty($categories)) {
                        foreach ($categories as $row1) {
                            $variants[$k]['cart_count'] = $row1['cart_count'];
                        }
                    } else {
                        $variants[$k]['cart_count'] = "0";
                    }
                } else {
                    $variants[$k]['cart_count'] = "0";
                }
            }

            $product[$i]['variants'] = $variants;
            $i++;
        }
        if (!empty($product)) {
            $sql_query = "SELECT *, (select count(*) from products where products.category_id = category.id) as total FROM category ORDER BY name ASC ";
            $db->sql($sql_query);
            $categories = $db->getResult();
            if (!empty($categories)) {
                for ($i = 0; $i < count($categories); $i++) {
                    $categories[$i]['image'] = (!empty($categories[$i]['image'])) ? DOMAIN_URL . '' . $categories[$i]['image'] : '';
                }
                $tmp = [];
                foreach ($categories as $r) {
                    $r['childs'] = [];
                    $db->sql("SELECT *, (select count(*) from products where products.subcategory_id = subcategory.id) as total FROM subcategory WHERE category_id = '" . $r['id'] . "' ORDER BY name ASC");
                    $childs = $db->getResult();
                    if (!empty($childs)) {
                        for ($i = 0; $i < count($childs); $i++) {
                            $childs[$i]['attributes'] = [];
                            if ($childs[$i]['attribute_ids'] != '') {
                                $db->sql("SELECT * FROM attributes WHERE id in ('" . implode("','", explode(",", $childs[$i]['attribute_ids'])) . "') ORDER BY name ASC");
                                $attributes = $db->getResult();
                                if (!empty($attributes)) {
                                    for ($j = 0; $j < count($attributes); $j++) {
                                        $childs[$i]['attributes'][$attributes[$j]['slug']] = (array)$attributes[$j];
                                    }
                                }
                            }
                            $childs[$i]['image'] = (!empty($childs[$i]['image'])) ? DOMAIN_URL . '' . $childs[$i]['image'] : '';
                            $r['childs'][$childs[$i]['slug']] = (array)$childs[$i];
                        }
                    }
                    $tmp[] = $r;
                }
                $categories = $tmp;
            }
            $output = json_encode(array(
                'error' => false,
                'category' => $categories,
                'total' => $total,
                'min_price' => $min_price ?? 0,
                'max_price' => $max_price ?? 0,
                'data' => $product
            ));
        } else {
            $output = json_encode(array(
                'error' => true,
                'data' => 'No products available'
            ));
        }
    } else {
        $output = json_encode(array(
            'error' => true,
            'message' => 'accesskey is incorrect.'
        ));
    }
} else {
    $output = json_encode(array(
        'error' => true,
        'message' => 'accesskey is required.'
    ));
}
//Output the output.
echo $output;

$db->disconnect();
