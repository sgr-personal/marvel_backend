<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;
?>
<?php
if (isset($_POST['btnAdd'])) {
    if(ALLOW_MODIFICATION==0 && !defined (ALLOW_MODIFICATION)){
        echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
        return false;
    }
    $product_name = $db->escapeString($fn->xss_clean($_POST['product_name']));
    $price = floatval($_POST['price']);
    $main_category = $db->escapeString($fn->xss_clean($_POST['main_category_name']));

    // create array variable to handle error
    $error = array();

    if (empty($product_name)) {
        $error['product_name'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($price)) {
        $error['price'] = " <span class='label label-danger'>Required!</span>";
    }

    if (!empty($product_name) && !empty($price)) {
        $sql_query = "INSERT INTO custom_product (category_id, name, price)
                    VALUES('$main_category', '$product_name', '$price')";

        // Execute query
        $db->sql($sql_query);
        // store result
        $result = $db->getResult();
        if (!empty($result)) {
            $result = 0;
        } else {
            $result = 1;
        }
        if ($result == 1) {
            $error['add_category'] = " <section class='content-header'><span class='label label-success'> Custom Product Successfully</span></section>";
        } else {
            $error['add_category'] = " <span class='label label-danger'>Failed Custom Product</span>";
        }
    }
}

if (isset($_POST['btnCancel'])) {
    header("location:custom_product.php");
}

?>
    <section class="content-header">
        <h1>Add Custom Product<small><a href='custom_product.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Sub Categories</a></small></h1>
        <?php echo isset($error['add_category']) ? $error['add_category'] : ''; ?>
        <ol class="breadcrumb">
            <li><a href="home.php"><i class="fa fa-home"></i> Home</a></li>
        </ol>
        <hr />
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Add Custom Product</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <form method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Main Category</label><?php echo isset($error['main_category_name']) ? $error['main_category_name'] : ''; ?>
                                <select class="form-control" id="main_category_name" name="main_category_name" required>
                                    <option value="">--Select Main Category--</option>
                                    <?php
                                        $sql = "SELECT * FROM custom_product_category";
                                        $db->sql($sql);
                                        $res = $db->getResult();
                                        foreach ($res as $category):
                                            echo "<option value='" . $category['id'] . "'>" . $category['name'] . "</option>";
                                        endforeach;
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Product Name</label><?php echo isset($error['product_name']) ? $error['product_name'] : ''; ?>
                                <input type="text" class="form-control" name="product_name" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Price</label><?php echo isset($error['price']) ? $error['price'] : ''; ?>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" name="btnAdd">ADD</button>
                            <input type="reset" class="btn-warning btn" value="Clear" />

                        </div>
                    </form>
                </div><!-- /.box -->
                <?php echo isset($error['check_permission']) ? $error['check_permission'] : ''; ?>
            </div>
        </div>
    </section>

    <div class="separator"> </div>

<?php $db->disconnect(); ?>
