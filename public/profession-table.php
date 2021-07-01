<section class="content-header">
    <h1>Profession /<small><a href="home.php"><i class="fa fa-home"></i> Home</a></small></h1>
    <ol class="breadcrumb">
        <a class="btn btn-block btn-default" href="add-profession.php"><i class="fa fa-plus-square"></i> Add Profession</a>
    </ol>
</section>
<style>
    .btn {
        padding: 9px 12px;
        line-height: 0.42857143;
    }
</style>
<!-- search form -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Profession</h3>
                </div>

                <div class="box-body table-responsive">
                    <table class="table table-hover" id="agent_table" data-toggle="table" data-url="api-firebase/get-bootstrap-table-data.php?table=profession" data-page-list="[5, 10, 20, 50, 100, 200]" data-show-refresh="true" data-show-columns="true" data-side-pagination="server" data-pagination="true" data-search="true" data-trim-on-search="false" data-filter-show-clear="true" data-query-params="queryParams_1" data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="name" data-sortable="true">Name</th>
                            <th data-field="priority" data-sortable="true">Priority</th>
                            <th data-field="operate" data-sortable="true">Action</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
    <!-- /.row (main row) -->
</section>
<script>
</script>
<!-- /.content -->
