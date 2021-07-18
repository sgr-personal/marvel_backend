<?php
include_once('includes/functions.php');
?>
<section class="content-header">
    <h1>Custom Product Query /<small><a href="home.php"><i class="fa fa-home"></i> Home</a></small></h1>
    <!--<ol class="breadcrumb">
        <a class="btn btn-block btn-default" href="add-custom-product.php"><i class="fa fa-plus-square"></i> Add Custom Product</a>
    </ol>-->
</section>
<!-- Main content -->
<section class="content">
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Custom Product Query</h3>
                </div>
                <div class="box-body table-responsive">
                    <table class="table table-hover" data-toggle="table"
                           data-url="api-firebase/get-bootstrap-table-data.php?table=custom_product_query"
                           data-page-list="[5, 10, 20, 50, 100, 200]"
                           data-show-refresh="true" data-show-columns="true"
                           data-side-pagination="server" data-pagination="true"
                           data-search="true" data-trim-on-search="false"
                           data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="name" data-sortable="true">Name</th>
                            <th data-field="email" data-sortable="true">Email</th>
                            <th data-field="phone" data-sortable="true">Phone</th>
                            <th data-field="products" data-sortable="true">Products</th>
                            <th data-field="operate">Action</th>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <div class="separator"> </div>
    </div>
</section>
