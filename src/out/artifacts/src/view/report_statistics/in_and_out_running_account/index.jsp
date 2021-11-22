<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>in and out running account</title>

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
<body>

<div id="inAndOutRunningAccountVue">
    <jsp:include page="table.jsp"></jsp:include>
</div>

<script>
    var inAndOutRunningAccountVue = new Vue({
        el: "#inAndOutRunningAccountVue",
        data: {
            search: '',
            tableHeader: [
                {prop: 'date', label: '业务日期'},
                {prop: 'storehouse', label: '仓库'},
                {prop: 'invoice_type', label: '单据类型'},
                {prop: 'invoice_id', label: '单据编号'},
                {prop: 'commodity_id', label: '货品编码'},
                {prop: 'commodity_type', label: '货品类别'},
                {prop: 'commodity_name', label: '货品名称'},
                {prop: 'in_quantity', label: '入库数量'},
                {prop: 'in_amount', label: '入库金额'},
                {prop: 'out_quantity', label: '出库数量'},
                {prop: 'out_amount', label: '出库金额'},
            ],
            tableData: [
                {
                    date: '',
                    storehouse: '',
                    invoice_type: '',
                    invoice_id: '',
                    commodity_id: '',
                    commodity_type: '',
                    commodity_name: '',
                    description: '',
                    in_quantity: '',
                    in_amount: '',
                    out_quantity: '',
                    out_amount: '',
                },
                {
                    date: '2021-11-22',
                    storehouse: '仓前仓库',
                    invoice_type: '销售出库',
                    invoice_id: '123146',
                    commodity_id: '0001',
                    commodity_type: '武器',
                    commodity_name: '无尽',
                    in_quantity: '',
                    in_amount: '',
                    out_quantity: '4',
                    out_amount: '13600',
                },
            ],
        },
        methods: {}
        , created: function () {

        },
        beforeMount: function () {

        }
    });
</script>

</body>
</html>
