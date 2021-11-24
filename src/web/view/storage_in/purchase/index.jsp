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

    <script src="chineseNumber.js"></script>

</head>
<body>

<div id="purchaseVue">
    <jsp:include page="form.jsp"></jsp:include>
</div>

<script>
    var commodityMap = new Map([
        ['1', {id: '2', type: '3', inventory: 4}],
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
            storehouses: [
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
            rules: {
                supplier: [
                    {required: true, message: '请选择供应商', trigger: 'change'},
                ],
                storehouse: [
                    {required: true, message: '请选择收货仓库', trigger: 'change'},
                ],
                date: [
                    {required: true, message: '请选择入库日期', trigger: 'change'},
                ],
                dealer: [
                    {required: true, message: '请输入经手人姓名', trigger: 'blur'},
                    {min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur'}
                ],
                commodity_name: [
                    {required: true, message: '请选择货品', trigger: 'change'},
                ],
                price: [
                    {required: true, message: '请输入单价', trigger: 'blur'},
                ],
                quantity: [
                    {required: true, message: '请输入单价', trigger: 'blur'},
                ],
            },
        },
        methods: {
            tableHeight: function () {
                return this.ruleForm.in.length;
            },
            getID: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).id;
                }
                return '暂无数据';
            },
            getType: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).type;
                }
                return '暂无数据';
            },
            getInventory: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).inventory;
                }
                return 0;
            },
            getAmount: function (quantity, price) {
                quantity = parseInt(quantity);
                price = parseInt(price);
                if (isNaN(quantity) || quantity === 0) return 0;
                if (isNaN(price) || price === 0) return 0;
                return quantity * price;
            },
            validateQuantity: function (quantity) {
            },
            addRow: function () {
                // 深拷贝
                var tmp = {};
                $.extend(true, tmp, this.emptyTableData);
                this.ruleForm.in.push(tmp);
            },
            submitForm: function (formName) {
                this.$refs[formName].validate(function (valid) {
                    console.log(valid);
                    if (valid) {

                    } else {
                        // 有错则滑到页面顶部
                        window.scrollTo(0, 0);
                    }
                });
            },
            resetForm: function (formName) {
                this.ruleForm.in.splice(0, this.ruleForm.in.length);
                this.addRow();
                this.$refs[formName].resetFields();
            },
        },
        computed: {
            getTotalAmount: function () {
                var sum = 0;
                this.ruleForm.in.forEach(function (item) {
                    sum += item.amount;
                });
                return sum;
            },
            getChineseNumber: function () {
                return chineseNumber(this.getTotalAmount);
            }
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
