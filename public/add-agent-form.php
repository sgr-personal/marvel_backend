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
    $email = trim($_POST['email']);
    $mobile = $db->escapeString($fn->xss_clean($_POST['mobile']));
    $commission = $db->escapeString($fn->xss_clean($_POST['commission']));
    $dob = $db->escapeString($fn->xss_clean($_POST['dob']));
    $password = md5($db->escapeString($fn->xss_clean($_POST['password'])));

    // create array variable to handle error
    $error = array();
    if (trim($_POST['password']) != trim($_POST['confirm_password'])) {
        $error['add_agent'] = " <section class='content-header'><span class='label label-danger'>Password didn't match</span></section>";
    }
    if (empty($error)) {
        $sql_query = "INSERT INTO users (name, email, mobile, dob, password, is_agent, commission, status)
                    VALUES('$name', '$email', '$mobile', '$dob', '$password', 1, '$commission', 1)";

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
            $error['add_agent'] = " <section class='content-header'><span class='label label-success'>Agent Added Successfully</span></section>";
        } else {
            $error['add_agent'] = " <span class='label label-danger'>Failed add agent</span>";
        }
    }
}

if (isset($_POST['btnCancel'])) {
    header("location:agents.php");
}

?>
    <section class="content-header">
        <h1>Add Agent<small><a href='agents.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Agents</a></small></h1>
        <?php echo isset($error['add_agent']) ? $error['add_agent'] : ''; ?>
        <ol class="breadcrumb">
            <li><a href="home.php"><i class="fa fa-home"></i> Home</a></li>
        </ol>
        <hr />
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <?php /*if ($permissions['subcategories']['create'] == 0) { */?><!--
                    <div class="alert alert-danger">You have no permission to create subcategory.</div>
                --><?php /*} */?>
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Add Agent</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    <form method="post" enctype="multipart/form-data" id="add_form">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="">Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="">Email</label>
                                <input type="text" class="form-control"  name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                            </div>
                            <div class="form-group">
                                <label for="">Mobile</label>
                                <input type="number" class="form-control" name="mobile" required>
                            </div>
                            <div class="form-group">
                                <label for="">Commission (%)</label>
                                <input type="number" class="form-control" name="commission" id="commission" value=""><br>
                            </div>
                            <div class="form-group">
                                <label for="">Date Of Birth</label>
                                <input type="date" class="form-control" name="dob" id="dob" required>
                            </div>
                            <div class="form-group">
                                <label for="">Password</label>
                                <input type="password" class="form-control" name="password" id="password" required>
                            </div>
                            <div class="form-group">
                                <label for="">Confirm Password</label>
                                <input type="password" class="form-control" name="confirm_password" required>
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
            name: "required",
            mobile: "required",
            password: "required",
            address: "required",
            confirm_password: {
                required: true,
                equalTo: "#password"
            }
        }
    });
</script>

<?php $db->disconnect(); ?>
