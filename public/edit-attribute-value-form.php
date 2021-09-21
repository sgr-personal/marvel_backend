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
    $slug = $db->escapeString($fn->xss_clean($_POST['slug']));
    $attribute_id = $db->escapeString($fn->xss_clean($_POST['attribute_id']));

    // create array variable to handle error
    $error = array();
    if (empty($name)) {
        $error['name'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($slug)) {
        $error['slug'] = " <span class='label label-danger'>Required!</span>";
    }
    if (empty($attribute_id)) {
        $error['attribute_id'] = " <span class='label label-danger'>Required!</span>";
    }

    if (!empty($name) && !empty($slug) && !empty($attribute_id)) {
        $sql_query = "SELECT * FROM attribute_values WHERE slug = '$slug' AND id != $ID";
        $db->sql($sql_query);
        $res_query = $db->getResult();
        if (empty($res_query)) {
            $sql_query = "UPDATE attribute_values SET name='" . $name . "', slug = '" . $slug . "', attribute_id = '" . $attribute_id . "'  WHERE id = '" . $ID . "'";
            $db->sql($sql_query);

            $update_result = $db->getResult();
            if (!empty($update_result)) {
                $update_result = 0;
            } else {
                $update_result = 1;
            }

            if ($update_result == 1) {
                $error['update_attribute'] = " <section class='content-header'><span class='label label-success'>Attribute value updated Successfully</span></section>";
            } else {
                $error['update_attribute'] = " <span class='label label-danger'>Failed update Attribute value</span>";
            }
        } else {
            $error['update_attribute'] = " <span class='label label-danger'>Slug already present</span>";
        }
    }
}

$data = array();
$sql_query = "SELECT * FROM attribute_values WHERE id =" . $ID;
$db->sql($sql_query);
$res = $db->getResult();
if (isset($_POST['btnCancel'])) { ?>
    <script>
        window.location.href = "attribute-values.php";
    </script>
<?php } ?>
<section class="content-header">
    <h1>
        Edit Attribute Value<small><a href='attribute-values.php'> <i class='fa fa-angle-double-left'></i>&nbsp;&nbsp;&nbsp;Back to Attribute Values</a></small></h1>
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
                    <h3 class="box-title">Edit Attribute Value</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <form method="post" enctype="multipart/form-data" id="edit_subcategory_form">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1"> Attribute </label><?php echo isset($error['attribute_id']) ? $error['attribute_id'] : ''; ?>
                            <?php
                            $db->select("attributes", 'id,name');
                            $attr = $db->getResult();
                            ?>
                            <select class="form-control" id="attribute_id" name="attribute_id" >
                                <?php foreach ($attr as $attributes) {
                                    echo "<option value=" . $attributes['id'];
                                    if ($attributes['id'] == $res[0]['attribute_id']) {
                                        echo " selected";
                                    }
                                    echo ">" . $attributes['name'] . "</option>";
                                } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputName">Name</label>
                            <div class="msg"><?php echo isset($error['name']) ? $error['name'] : ''; ?></div>
                            <input type="text" class="form-control" name="name" value="<?php echo $res[0]['name']; ?>" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputCode">Slug</label>
                            <div class="msg"><?php echo isset($error['slug']) ? $error['slug'] : ''; ?></div>
                            <input type="text" class="form-control" name="slug" value="<?php echo $res[0]['slug']; ?>" >
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
