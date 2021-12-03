<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/28
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>record</title>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 3.4.1 Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

    <!-- bootstrap-icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- 4.1.1 animate.min.css -->
    <link href="https://cdn.bootcdn.net/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

    <!-- 1.1.2 wow.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/wow/1.1.2/wow.min.js"></script>

    <!-- 2.6.9 vue.min.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/vue/2.6.9/vue.min.js"></script>

    <!-- 0.21.1 axios.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.min.js"></script>

    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>

</head>
<body style="padding: 30px">

<div id="recordVue">
    <jsp:include page="table.jsp"></jsp:include>
</div>

<script>
    var recordVue = new Vue({
        el: '#recordVue',
        data: {
            search: '',
            tableHeader: [
                {prop: 'invoice_id', label: '单据编号'},
                {prop: 'storehouse_out', label: '调出仓库'},
                {prop: 'storehouse_in', label: '调入仓库'},
                {prop: 'date', label: '调拨日期'},
                // {prop: 'dealer', label: '经手人'},
                {
                    prop: 'details', label: '调拨明细',
                    children: [
                        {prop: 'commodity_id', label: '货品编码'},
                        {prop: 'commodity_type', label: '货品类别'},
                        {prop: 'commodity_name', label: '货品名称'},
                        {prop: 'quantity', label: '数量'},
                        {prop: 'amount', label: '金额'},
                    ]
                },
                // {prop: 'total', label: '合计金额'},
            ],
            tableData: [
                {
                    storehouse: '',
                    commodity_id: '',
                    commodity_type: '',
                    commodity_name: '',
                    description: '',
                    unit: '',
                    in_quantity: '',
                    in_total_amount: '',
                    out_quantity: '',
                    out_total_amount: '',
                    inventory_quantity: '',
                },
            ],
        },
        methods: {},
        created: function () {
        },
        beforeMount: function () {
            var record = [];
            $.ajax({
                type: "POST",
                url: "/src/select/Record",
                async: false,//取消异步请求
                data: {},
                // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (data) {
                    var json = JSON.parse(data);
                    console.log(json);
                    record = json.code;
                },
                error: function (msg) {
                    console.log(msg);
                }
            });

            var table = [];
            record.forEach(function (value) {
                if (value.invoice_type === '库存调拨') {
                    table.push(value);
                }
            })
            this.tableData = table;
        }
    })
</script>

</body>
</html>
