<?php
include_once('includes/functions.php');
$function = new functions;
include_once('includes/custom-functions.php');
$fn = new custom_functions;
?>
<?php
$ID = (isset($_GET['id'])) ? $db->escapeString($fn->xss_clean($_GET['id'])) : "";

if (isset($_POST['btnEdit'])) {
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
        $sql_query = "SELECT * FROM attributes WHERE code = '$code' AND id != $ID";
        $db->sql($sql_query);
        $res_query = $db->getResult();
        if (empty($res_query)) {
            $sql_query = "UPDATE attributes SET name='" . $name . "', code = '" . $code . "' WHERE id = '" . $ID . "'";
            $db->sql($sql_query);

            $update_result = $db->getResult();
            if (!empty($update_result)) {
                $update_result = 0;
            } else {
                $update_result = 1;
            }

            if ($update_result == 1) {
                $error['update_attribute'] = " <section class='content-header'><span class='label label-success'>Subcategory updated Successfully</span></section>";
            } else {
                $error['update_attribute'] = " <span class='label label-danger'>Failed update Subcategory</span>";
            }
        } else {
            $error['update_attribute'] = " <span class='label label-danger'>Attribute code already present</span>";
        }
    }
}

$data = array();
$sql_query = "SELECT * FROM attributes WHERE id =" . $ID;
$db->sql($sql_query);
$res = $db->getResult();
if (isset($_POST['btnCancel'])) { ?>
    <script>
        window.location.href = "attributes.php";
    </script>
<?php } ?>
<section class="content-header">
    <h1>
        Edit Attribute <small><a href='attributes.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Attributes</a></small></h1>
    <small><?php echo isset($error['update_attribute']) ? $error['update_attribute'] : ''; ?></small>
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
                    <h3 class="box-title">Edit Attribute</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form method="post" enctype="multipart/form-data" id="edit_subcategory_form">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputName">Name</label>
                            <div class="msg"><?php echo isset($error['name']) ? $error['name'] : ''; ?></div>
                            <input type="text" class="form-control" name="name" value="<?php echo $res[0]['name']; ?>" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputCode">Code</label>
                            <div class="msg"><?php echo isset($error['code']) ? $error['code'] : ''; ?></div>
                            <input type="text" class="form-control" name="code" value="<?php echo $res[0]['code']; ?>" >
                        </div>
                    </div><!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary" name="btnEdit">Update</button>
                        <button type="submit" class="btn btn-danger" name="btnCancel">Cancel</button>
                    </div>
                </form>
            </div><!-- /.box -->
        </div>
    </div>
</section>

<div class="separator"> </div>
<?php $db->disconnect(); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script>
    $('#edit_subcategory_form').validate({
        rules: {
            name: "required",
            code: "required",
        }
    });
    var data = $('.msg').html();
    if(data != ''){
        $('.msg').show().delay(3000).fadeOut();
    }

</script>
