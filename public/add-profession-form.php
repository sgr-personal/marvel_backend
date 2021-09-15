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

    $name = $db->escapeString($fn->xss_clean($_POST['name']));
    $priority = $db->escapeString($fn->xss_clean($_POST['priority']));

    // create array variable to handle error
    $error = array();
    if (trim($_POST['name']) == "") {
        $error['add_profession'] = " <section class='content-header'><span class='label label-danger'>Please enter profession</span></section>";
    }
    if (empty($error)) {
        $sql_query = "INSERT INTO profession (name, priority) VALUES('$name', '$priority')";
        $db->sql($sql_query); // Execute query
        $result = $db->getResult(); // store result
        if (!empty($result)) {
            $result = 0;
        } else {
            $result = 1;
        }
        if ($result == 1) {
            $error['add_profession'] = " <section class='content-header'><span class='label label-success'>Profession Added Successfully</span></section>";
        } else {
            $error['add_profession'] = " <span class='label label-danger'>Failed to add profession</span>";
        }
    }
}

if (isset($_POST['btnCancel'])) {
    header("location:profession.php");
}

?>
<section class="content-header">
    <h1>Add Profession<small><a href='profession.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Profession</a></small></h1>
    <?php echo isset($error['add_profession']) ? $error['add_profession'] : ''; ?>
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
                    <h3 class="box-title">Add Profession</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form method="post" enctype="multipart/form-data" id="add_form">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="">Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="">Priority</label>
                            <input type="number" class="form-control" name="priority" maxlength="4" required>
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

<script>
    $('#add_form').validate({
        rules: {
            name: "required"
        }
    });
</script>

<?php $db->disconnect(); ?>
