<section class="content-header">
    <h1>Agents /<small><a href="home.php"><i class="fa fa-home"></i> Home</a></small></h1>
    <ol class="breadcrumb">
        <a class="btn btn-block btn-default" href="add-agent.php"><i class="fa fa-plus-square"></i> Add Agent</a>
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
                    <h3 class="box-title">Customers</h3>
                </div>
                <?php $db->sql("SET NAMES 'utf8'");
                $sql = "SELECT * FROM city ORDER BY id + 0 ASC";
                $db->sql($sql);
                $cities = $db->getResult();
                ?>

                <div class="box-body table-responsive">
                    <div class="form-group">
                        <select id="filter_agent" name="filter_agent" required class="form-control" style="width: 300px;">
                            <option value="">Select City</option>
                            <?php foreach ($cities as $row) { ?>
                                <option value='<?= $row['id'] ?>'><?= $row['name'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <table class="table table-hover" id="agent_table" data-toggle="table" data-url="api-firebase/get-bootstrap-table-data.php?table=agents" data-page-list="[5, 10, 20, 50, 100, 200]" data-show-refresh="true" data-show-columns="true" data-side-pagination="server" data-pagination="true" data-search="true" data-trim-on-search="false" data-filter-show-clear="true" data-query-params="queryParams_1" data-sort-name="id" data-sort-order="desc">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="true">ID</th>
                            <th data-field="name" data-sortable="true">Name</th>
                            <th data-field="email" data-sortable="true">Email</th>
                            <th data-field="mobile" data-sortable="true">M.No</th>
                            <th data-field="commission" data-sortable="true">Commission</th>
                            <th data-field="status" data-sortable="true">Status</th>
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
    $('#filter_agent').on('change', function() {
        $('#user_table').bootstrapTable('refresh');

    });

    function queryParams_1(p) {
        return {
            "filter_user": $('#filter_user').val(),
            limit: p.limit,
            sort: p.sort,
            order: p.order,
            offset: p.offset,
            search: p.search
        };
    }
</script>
<!-- /.content -->
