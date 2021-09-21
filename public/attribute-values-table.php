<?php
include_once('includes/functions.php');
?>
<section class="content-header">
    <h1>Attribute Values /<small><a href="home.php"><i class="fa fa-home"></i> Home</a></small></h1>
    <ol class="breadcrumb">
        <a class="btn btn-block btn-default" href="add-attribute-values.php"><i class="fa fa-plus-square"></i> Add New Attribute Value</a>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Attribute Values</h3>
                </div>
                <div class="box-body table-responsive">
                    <table class="table table-hover" data-toggle="table"
                           data-url="api-firebase/get-bootstrap-table-data.php?table=attribute-values"
                           data-page-list="[5, 10, 20, 50, 100, 200]"
                           data-show-refresh="true" data-show-columns="true"
                           data-side-pagination="server" data-pagination="true"
                           data-search="true" data-trim-on-search="false"
                           data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="name" data-sortable="true">Name</th>
                            <th data-field="attribute_name" data-sortable="true">Attribute</th>
                            <th data-field="slug" data-sortable="true">Slug</th>
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
