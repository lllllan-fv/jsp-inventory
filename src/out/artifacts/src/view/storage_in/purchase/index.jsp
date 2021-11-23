<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>purchase</title>

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

    <%--  滚动条样式  --%>
    <link href="../../../style/index.css" rel="stylesheet">

</head>
<body>

<div id="purchaseVue">
    <jsp:include page="form.jsp"></jsp:include>
</div>

<script>
    var commodityMap = new Map([
        ['1', {id: '2', type: '3', inventory: '4'}],
    ]);
    var purchaseVue = new Vue({
        el: '#purchaseVue',
        data: {
            emptyTableData: {
                commodity_id: '',
                commodity_type: '',
                commodity_name: '',
                price: '',
                inventory: '',
                quantity: '',
                amount: '',
            },
            suppliers: [
                {value: '1', label: '2'},
            ],
            commodities: [
                {value: '1', label: '1'},
            ],
            ruleForm: {
                invoice_type: '采购入库',
                supplier: '',
                storehouse: '',
                date: '',
                dealer: '',
                in: [],
            },
            rules: {},
        },
        methods: {
            getID: function (name) {
                if (name !== '') {
                    return commodityMap.get(name['0']).id;
                }
                return '暂无数据';
            },
            getType: function (name) {
                if (name !== '') {
                    return commodityMap.get(name['0']).type;
                }
                return '暂无数据';
            },
            getInventory: function (name) {
                if (name !== '') {
                    return commodityMap.get(name['0']).inventory;
                }
                return '暂无数据';
            },
            getAmount: function (quantity, price) {
                quantity = parseInt(quantity);
                price = parseInt(price);
                if (isNaN(quantity) || quantity === 0) return 0;
                if (isNaN(price) || price === 0) return 0;
                return quantity * price;
            },
            addRow: function () {
                // 深拷贝
                var tmp = {};
                $.extend(true, tmp, this.emptyTableData);
                this.ruleForm.in.push(tmp);
            },
            submitForm: function (formName) {
                console.log(this.ruleForm.position);
                this.$refs[formName].validate(function (valid) {
                    console.log(valid);
                });
            },
            resetForm: function (formName) {
                this.$refs[formName].resetFields();
            },
        },
        created: function () {
        },
        beforeMount: function () {
            this.addRow();
        },
    });
</script>

</body>
</html>
