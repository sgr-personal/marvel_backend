<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;

?>
<?php
if (isset($_POST['btnAdd'])) {
    if (ALLOW_MODIFICATION == 0 && !defined(ALLOW_MODIFICATION)) {
        echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
        return false;
    }

    $category_name = $db->escapeString($fn->xss_clean($_POST['category_name']));
    $created_at = date("Y-m-d H:i:s");

    // create array variable to handle error
    $error = array();

    if (empty($category_name)) {
        $error['category_name'] = " <span class='label label-danger'>Required!</span>";
    }

    if (!empty($category_name)) {
        $sql_query = "INSERT INTO custom_product_category (name, created_at) VALUES ('$category_name', '$created_at')";
        $db->sql($sql_query);
        $result = $db->getResult();
        if (!empty($result)) {
            $result = 0;
        } else {
            $result = 1;
        }

        if ($result == 1) {
            $error['add_category'] = " <section class='content-header'><span class='label label-success'>Category Added Successfully</span></section>";
        } else {
            $error['add_category'] = " <span class='label label-danger'>Failed add category</span>";
        }
    }
}
?>
    <section class="content-header">
        <h1>Add Custom Product Category <small><a href='custom_product_category.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Categories</a></small></h1>

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
                        <h3 class="box-title">Add Category</h3>

                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <form method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category Name</label><?php echo isset($error['category_name']) ? $error['category_name'] : ''; ?>
                                <input type="text" class="form-control" name="category_name" required>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" name="btnAdd">Add</button>
                            <input type="reset" class="btn-warning btn" value="Clear" />
                        </div>
                    </form>

                </div><!-- /.box -->
            </div>
        </div>
    </section>

    <div class="separator"> </div>
    <script>

    </script>

<?php $db->disconnect(); ?>
