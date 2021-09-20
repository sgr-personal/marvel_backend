<div id="content" class="container col-md-12">
    <?php
    include_once('includes/custom-functions.php');
    $fn = new custom_functions;
    if (isset($_POST['btnDelete'])) {
        $ID = (isset($_GET['id'])) ? $db->escapeString($fn->xss_clean($_GET['id'])) : "";
        // delete data from attributes table
        $sql_query = "DELETE FROM attributes WHERE id =" . $ID;
        $db->sql($sql_query);
        $delete_attributes_result = $db->getResult();
        if (!empty($delete_attributes_result)) {
            $delete_attributes_result = 0;
        }
        $delete_attributes_result = 1;

        if ($delete_attributes_result == 1) {
            header("location: attributes.php");
        }
    }

    if (isset($_POST['btnNo'])) {
        header("location: attributes.php");
    }
    if (isset($_POST['btncancel'])) {
        header("location: attributes.php");
    }

    ?>
    <h1>Confirm Action</h1>
    <hr />
    <form method="post">
        <p>Are you sure want to delete this Attribute?</p>
        <input type="submit" class="btn btn-primary" value="Delete" name="btnDelete" />
        <input type="submit" class="btn btn-danger" value="Cancel" name="btnNo" />
    </form>
    <div class="separator"> </div>
</div>

<?php $db->disconnect(); ?>
