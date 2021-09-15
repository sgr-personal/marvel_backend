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
$db->select('users', '*', null, 'id=' . $ID);
$res = $db->getResult();

if (isset($_POST['btnEdit'])) {
    if (ALLOW_MODIFICATION == 0 && !defined(ALLOW_MODIFICATION)) {
        echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
        return false;
    }

    $name = $db->escapeString($fn->xss_clean($_POST['name']));
    $priority = $db->escapeString($fn->xss_clean($_POST['priority']));

    $error = array();
    $sql_query = "UPDATE profession SET name='" . $name . "', priority = '" . $priority . "' WHERE id = '" . $ID . "'";

    $db->sql($sql_query);
    $update_result = $db->getResult();
    if (!empty($update_result)) {
        $update_result = 0;
    } else {
        $update_result = 1;
    }

    if ($update_result == 1) {
        $error['update_profession'] = " <section class='content-header'><span class='label label-success'>Profession updated Successfully</span></section>";
    } else {
        $error['update_profession'] = " <span class='label label-danger'>Failed update Profession</span>";
    }
}

$data = array();
$sql_query = "SELECT * FROM profession WHERE id =" . $ID;
$db->sql($sql_query);
$res_query = $db->getResult();
$data = $res_query[0];


if (isset($_POST['btnCancel'])) { ?>
    <script>
        window.location.href = "profession.php";
    </script>
<?php } ?>
<section class="content-header">
    <h1>Edit Profession
        <small><a href='profession.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Profession</a></small>
    </h1>
    <small><?php echo isset($error['update_profession']) ? $error['update_profession'] : ''; ?></small>
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
                    <h3 class="box-title">Edit Profession</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form method="post" enctype="multipart/form-data" id="update_form">
                    <div class="box-body">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">Name</label>
                                <input type="text" class="form-control" name="name" value="<?= $data['name'] ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="">Priority</label>
                                <input type="number" class="form-control" name="priority" maxlength="4" value="<?= $data['priority'] ?>" required>
                            </div>
                        </div><!-- /.box-body -->
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
</script>
