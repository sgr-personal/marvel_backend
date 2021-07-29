<div id="content" class="container col-md-12">
    <?php
    include_once('includes/custom-functions.php');
    $fn = new custom_functions;
    if (isset($_POST['btnDelete'])) {
        if (ALLOW_MODIFICATION == 0 && !defined(ALLOW_MODIFICATION)) {
            echo '<label class="alert alert-danger">This operation is not allowed in demo panel!.</label>';
            return false;
        }

        $ID = (isset($_GET['id'])) ? $db->escapeString($fn->xss_clean($_GET['id'])) : "";

        $sql_query = "DELETE FROM users WHERE id =" . $ID;
        $db->sql($sql_query);
        $delete_result = $db->getResult();
        if (!empty($delete_result)) {
            $delete_result = 0;
        }
        $delete_result = 1;
        if ($delete_result == 1) {
            header("location: customers.php");
        }
    }

    if (isset($_POST['btnNo'])) {
        header("location: customers.php");
    }
    if (isset($_POST['btncancel'])) {
        header("location: customers.php");
    }

    ?>
    <h1>Confirm Action</h1>
    <hr />
    <form method="post">
        <p>Are you sure want to delete this Customer?</p>
        <input type="submit" class="btn btn-primary" value="Delete" name="btnDelete" />
        <input type="submit" class="btn btn-danger" value="Cancel" name="btnNo" />
    </form>
    <div class="separator"> </div>
</div>

<?php $db->disconnect(); ?>
