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
    $email = trim($_POST['email']);
    $mobile = $db->escapeString($fn->xss_clean($_POST['mobile']));
    $commission = $db->escapeString($fn->xss_clean($_POST['commission']));
    $dob = $db->escapeString($fn->xss_clean($_POST['dob']));
    $id = $db->escapeString($fn->xss_clean($_GET['id']));

    $error = array();
    $sql_query = "UPDATE users SET name='" . $name . "', email = '" . $email . "', mobile = '" . $mobile . "', dob = '" . $dob . "', commission = '".$commission."' WHERE id = '" . $ID . "'";

    $db->sql($sql_query);

    $update_result = $db->getResult();
    if (!empty($update_result)) {
        $update_result = 0;
    } else {
        $update_result = 1;
    }

    if ($update_result == 1) {
        $error['update_agent'] = " <section class='content-header'><span class='label label-success'>Agent updated Successfully</span></section>";
    } else {
        $error['update_agent'] = " <span class='label label-danger'>Failed update Agent</span>";
    }
}

$data = array();
$sql_query = "SELECT * FROM users WHERE id =" . $ID;
$db->sql($sql_query);
$res_query = $db->getResult();
$data = $res_query[0];

if (isset($_POST['btnCancel'])) { ?>
    <script>
        window.location.href = "agents.php";
    </script>
<?php } ?>
<section class="content-header">
    <h1>
        Edit Agent <small><a href='agents.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Agents</a></small></h1>
    <small><?php echo isset($error['update_agent']) ? $error['update_agent'] : ''; ?></small>
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
                    <h3 class="box-title">Edit Agent</h3>
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
                                <label for="">Email</label>
                                <input type="text" class="form-control"  name="email" value="<?= $data['email'] ?>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                            </div>
                            <div class="form-group">
                                <label for="">Mobile</label>
                                <input type="number" class="form-control" name="mobile" value="<?= $data['mobile'] ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="">Commission (%)</label>
                                <input type="number" class="form-control" name="commission" id="commission" value="<?= $data['commission'] ?>"><br>
                            </div>
                            <div class="form-group">
                                <label for="">Date Of Birth</label>
                                <input type="date" class="form-control" name="dob" id="dob" value="<?= $data['dob'] ?>" required>
                            </div>
                            <!--<div class="form-group">
                                <label for="">Password</label>
                                <input type="password" class="form-control" name="password" id="password" value="<?/*= $data['name'] */?>" required>
                            </div>
                            <div class="form-group">
                                <label for="">Confirm Password</label>
                                <input type="password" class="form-control" name="confirm_password" required>
                            </div>-->
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
    $('#update_form').validate({
        rules: {
            update_name: "required",
            update_mobile: "required",
            /*confirm_password: {
                equalTo: "#update_password"
            }*/
        }
    });
    var data = $('.msg').html();
    if(data != ''){
        $('.msg').show().delay(3000).fadeOut();
    }
</script>
