<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;
?>
<?php
if (isset($_POST['btnAdd'])) {
    $name = $db->escapeString($fn->xss_clean($_POST['name']));
    $code = $db->escapeString($fn->xss_clean($_POST['code']));

    // create array variable to handle error
    $error = array();

    if (empty($name)) {
        $error['name'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($code)) {
        $error['code'] = " <span class='label label-danger'>Required!</span>";
    }

    if (!empty($name) && !empty($code)) {
        $sql_query = "SELECT * FROM attributes WHERE code = '$code'";
        $db->sql($sql_query);
        $res_query = $db->getResult();
        if (empty($res_query)) {
            $sql_query = "INSERT INTO attributes (name, code, active)
                    VALUES('$name', '$code', 1)";

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
                $error['add_attribute'] = " <section class='content-header'><span class='label label-success'>Attribute Added Successfully</span></section>";
            } else {
                $error['add_attribute'] = " <span class='label label-danger'>Failed add attribute</span>";
            }
        } else {
            $error['add_attribute'] = " <span class='label label-danger'>Attribute code already present</span>";
        }
    }
}

if (isset($_POST['btnCancel'])) {
    header("location:attributes.php");
}

?>
    <section class="content-header">
        <h1>Add Attribute<small><a href='attributes.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Attributes</a></small></h1>
        <?php echo isset($error['add_attribute']) ? $error['add_attribute'] : ''; ?>
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
                        <h3 class="box-title">Add Sub Category</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <form method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="exampleInputName">Name</label><?php echo isset($error['name']) ? $error['name'] : ''; ?>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Code</label><?php echo isset($error['code']) ? $error['code'] : ''; ?>
                                <input type="text" class="form-control" name="code" required>
                            </div>
                        </div><!-- /.box-body -->

                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary" name="btnAdd">ADD</button>
                            <input type="reset" class="btn-warning btn" value="Clear" />
                        </div>
                    </form>
                </div><!-- /.box -->
            </div>
        </div>
    </section>

    <div class="separator"> </div>

<?php $db->disconnect(); ?>
