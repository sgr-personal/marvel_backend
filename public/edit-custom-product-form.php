<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;
?>
<?php
$ID = (isset($_GET['id'])) ? $db->escapeString($fn->xss_clean($_GET['id'])) : "";


// create array variable to store subcategory data
$subcategory_data = array();
if (isset($_POST['btnEdit'])) {
    if (ALLOW_MODIFICATION == 0 && !defined(ALLOW_MODIFICATION)) {
        echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
        return false;
    }
    $category = $db->escapeString($fn->xss_clean($_POST['category']));
    $name = $db->escapeString($fn->xss_clean($_POST['name']));
    $price = $db->escapeString($fn->xss_clean($_POST['price']));

    // create array variable to handle error
    $error = array();
    if (empty($name)) {
        $error['name'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($category)) {
        $error['category'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($price)) {
        $error['price'] = " <span class='label label-danger'>Required!</span>";
    }

    if (!empty($name) && !empty($price) && !empty($category)) {
        $sql_query = "UPDATE custom_product SET category_id='" . $category . "', name = '" . $name . "', price = '" . $price . "' WHERE id = '" . $ID . "'";
        $db->sql($sql_query);

        $update_result = $db->getResult();
        if (!empty($update_result)) {
            $update_result = 0;
        } else {
            $update_result = 1;
        }

        if ($update_result == 1) {
            $error['update_product'] = " <section class='content-header'><span class='label label-success'>Custom Product updated Successfully</span></section>";
        } else {
            $error['update_product'] = " <span class='label label-danger'>Failed update Custom Product</span>";
        }
    }

}

$data = array();
$sql_query = "SELECT * FROM custom_product WHERE id =" . $ID;
$db->sql($sql_query);
$res_query = $db->getResult();
if (isset($_POST['btnCancel'])) { ?>
    <script>
        window.location.href = "subcategories.php";
    </script>
<?php } ?>
<section class="content-header">
    <h1>Custom Product <small><a href='custom_product.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Custom Product</a></small></h1>
    <small><?php echo isset($error['update_product']) ? $error['update_product'] : ''; ?></small>
    <ol class="breadcrumb">
        <li><a href="home.php"><i class="fa fa-home"></i> Home</a></li>
    </ol>
</section>

<section class="content">
    <!-- Main row -->
    <div class="row">
        <div class="col-md-6">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Custom Product</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form method="post" enctype="multipart/form-data" id="edit_subcategory_form">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Category</label><?php echo isset($error['category']) ? $error['category'] : ''; ?>
                            <?php
                            $db->select("custom_product_category", 'id,name');
                            $res = $db->getResult();
                            ?>
                            <select class="form-control" id="category" name="category" >
                                <?php foreach ($res as $row) {
                                    echo "<option value=" . $row['id'];
                                    if ($row['id'] == $res_query[0]['category_id']) {
                                        echo " selected";
                                    }
                                    echo ">" . $row['name'] . "</option>";
                                } ?>
                            </select>
                            <?php
                            $db->select('custom_product', '*', null, 'id=' . $ID);
                            $res = $db->getResult();
                            ?>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Name</label>
                            <div class="msg"><?php echo isset($error['name']) ? $error['name'] : ''; ?></div>
                            <input type="text" class="form-control" name="name" value="<?php echo $res[0]['name']; ?>" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Price</label>
                            <div class="msg"><?php echo isset($error['price']) ? $error['price'] : ''; ?></div>
                            <input type="text" class="form-control" name="price" value="<?php echo $res[0]['price']; ?>" >
                        </div>
                    </div><!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary" name="btnEdit">Update</button>
                        <button type="submit" class="btn btn-danger" name="btnCancel">Cancel</button>
                    </div>
                </form>
            </div><!-- /.box -->
            <?php echo isset($error['check_permission']) ? $error['check_permission'] : ''; ?>
        </div>
    </div>
</section>

<div class="separator"> </div>
<?php $db->disconnect(); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script>
    $('#edit_subcategory_form').validate({
        rules: {
            category: "required",
            name: "required",
            price: "required",
        }
    });
    var data = $('.msg').html();
    if(data != ''){
        $('.msg').show().delay(3000).fadeOut();
    }

</script>
