<?php

session_start();

// set time for session timeout
$currentTime = time() + 25200;
$expired = 3600;

// if session not set go to login page
if (!isset($_SESSION['user'])) {
    header("location:index.php");
}

// if current time is more than session timeout back to login page
if ($currentTime > $_SESSION['timeout']) {
    session_destroy();
    header("location:index.php");
}

// destroy previous session timeout and create new one
unset($_SESSION['timeout']);
$_SESSION['timeout'] = $currentTime + $expired;

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<?php include "header.php"; ?>
<html>

<head>
    <title>Orders | <?= $settings['app_name'] ?> - Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
</head>
</body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <?php include('public/orders-table.php'); ?>
</div><!-- /.content-wrapper -->
</body>

</html>
<div class="modal fade" id='shipOrderModal' tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Ship Order</h4>
            </div>

            <div class="modal-body">
                <div class="box-body">
                    <form id="ship_order_form" method="POST" action="public/db-operation.php" data-parsley-validate
                          class="form-horizontal form-label-left">
                        <input type='hidden' name="order_id" id="order_id" value=''/>
                        <input type='hidden' name="ship_order" id="ship_order" value='1'/>

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Height</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="number" class="form-control" name="height" step=".001" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Length</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="number" class="form-control" name="length" step=".001" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Width</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="number" class="form-control" name="width" step=".001" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Weight</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="number" class="form-control" name="weight" step=".001" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <button type="submit" id="ship_btn" class="btn btn-success btn-lg">Ship Order</button>
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-md-offset-3 col-md-8" style="display:none;" id="update_result"></div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<?php include "footer.php"; ?>
<script type="application/javascript">
    $('#ship_order_form').on('submit', function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        if ($("#ship_order_form").validate().form()) {
            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: formData,
                beforeSend: function () {
                    $('#ship_btn').html('Please wait..');
                },
                cache: false,
                contentType: false,
                processData: false,
                success: function (result) {
                    $('#ship_result').html(result);
                    $('#ship_result').show().delay(6000).fadeOut();
                    $('#ship_btn').html('Ship Order');
                    $('#ship_order_form')[0].reset();
                    $('#order_list').bootstrapTable('refresh');
                    setTimeout(function () {
                        $('#shipOrderModal').modal('hide');
                    }, 3000);
                }
            });
        }
    });
</script>