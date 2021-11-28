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
    <title>storage</title>

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
    <link href="../../style/index.css" rel="stylesheet">

    <script src="chineseNumber.js"></script>

</head>
<body style="padding: 30px">

<div id="storageVue">
    <jsp:include page="form.jsp"></jsp:include>
</div>

<script>
    <%-- 货品对应【编码、类别、库存】 --%>
    var commodityMap = new Map([
        ['货品', {id: '2', type: '3', inventory: 4}],
    ]);
    var storageVue = new Vue({
        el: '#storageVue',
        data: {
            task: '',
            // 表格的空对象
            emptyTableData: {
                commodity_id: '',
                commodity_type: '',
                commodity_name: '',
                price: '',
                inventory: '',
                quantity: '',
                amount: '',
            },
            // 供应商列表
            suppliers: [
                {value: '供应商', label: '供应商'},
            ],
            // 客户列表
            customers: [
                {value: '客户', label: '客户'},
            ],
            // 仓库列表
            storehouses: [
                {value: '一号仓库', label: '一号仓库', disabled: false},
                {value: '二号仓库', label: '二号仓库', disabled: false},
                {value: '三号仓库', label: '三号仓库', disabled: false},
            ],
            // 货品列表
            commodities: [
                {value: '货品', label: '货品'},
            ],
            // 表单数据
            ruleForm: {
                invoice_type: '',
                supplier: '',
                customer: '',
                storehouse_in: '',
                storehouse_out: '',
                date: '',
                dealer: '',
                // 表格数据
                table: [],
                total: '',
            },
            // 校验规则
            rules: {
                supplier: [
                    {required: true, message: '请选择供应商', trigger: 'change'},
                ],
                customer: [
                    {required: true, message: '请选择客户', trigger: 'change'},
                ],
                storehouse_in: [
                    {required: true, message: '请选择收货仓库', trigger: 'change'},
                ],
                storehouse_out: [
                    {required: true, message: '请选择发货仓库', trigger: 'change'},
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
            // 设置表格高度适应数据行数
            tableHeight: function () {
                return this.ruleForm.table.length;
            },
            // 返回货品对应的编码
            getID: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).id;
                }
                return '暂无数据';
            },
            // 返回货品对应的类型
            getType: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).type;
                }
                return '暂无数据';
            },
            // 返回货品对应的库存
            getInventory: function (name) {
                if (name.length > 0) {
                    return commodityMap.get(name['0']).inventory;
                }
                return 0;
            },
            // 根据数量和单价计算金额
            getAmount: function (quantity, price) {
                quantity = parseInt(quantity);
                price = parseInt(price);
                if (isNaN(quantity) || quantity === 0) return 0;
                if (isNaN(price) || price === 0) return 0;
                return quantity * price;
            },
            // （如果是出库）校验数量不超过库存
            validateQuantity: function (item) {
                if (this.task.indexOf('出库') !== -1) {
                    var tot = 0;
                    this.ruleForm.table.forEach(function (value) {
                        //?
                    });
                    item.quantity = Math.min(item.quantity - tot, item.inventory);
                }
            },
            // 禁止发货和收货仓库重选
            chooseStorehouse: function (x) {
                var _in = this.ruleForm.storehouse_in;
                var _out = this.ruleForm.storehouse_out
                this.storehouses.forEach(function (item) {
                    if (item.value === _in || item.value === _out) {
                        item.disabled = true;
                    } else {
                        item.disabled = false;
                    }
                })
            },
            // 表格数据中添加一行空数据
            addRow: function () {
                var tmp = {};
                $.extend(true, tmp, this.emptyTableData);
                this.ruleForm.table.push(tmp);
            },
            // 表格删除一行
            removeRow: function (index) {
                this.ruleForm.table.splice(index, 1);
                if (this.ruleForm.table.length === 0) {
                    this.addRow();
                    this.$message({
                        showClose: true,
                        message: '请至少输入一件货品',
                        type: 'warning'
                    });
                }
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
                this.ruleForm.table.splice(0, this.ruleForm.table.length);
                this.addRow();
                this.$refs[formName].resetFields();
            },
        },
        computed: {
            // 实时计算总金额
            getTotalAmount: function () {
                var sum = 0;
                this.ruleForm.table.forEach(function (item) {
                    sum += item.amount;
                });
                return this.ruleForm.total = sum;
            },
            // 总金额对应的大写金额
            getChineseNumber: function () {
                return chineseNumber(this.getTotalAmount);
            }
        },
        created: function () {
        },
        beforeMount: function () {
            this.addRow();
            var current = window.parent.indexVue.currentActive;
            switch (current) {
                case "3-1":
                    this.task = '采购入库';
                    break;
                case "3-2":
                    this.task = '生产入库';
                    break;
                case "3-3":
                    this.task = '退货入库';
                    break;
                case "4-1":
                    this.task = '销售出库';
                    break;
                case "4-2":
                    this.task = '消耗出库';
                    break;
                case "4-3":
                    this.task = '退货出库';
                    break;
                case "5-1":
                    this.task = '库存调拨';
                    break;
            }
            this.ruleForm.invoice_type = this.task;
        },
    });
</script>

</body>
</html>
