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
    var taskMap = new Map([
        ["3-1", '采购入库'],
        ["3-2", '生产入库'],
        ["3-3", '退货入库'],
        ["4-1", '销售出库'],
        ["4-2", '消耗出库'],
        ["4-3", '退货出库'],
        ["5-1", '库存调拨'],
    ]);
    <%-- 货品对应【编码、类别】 --%>
    var commodityMap = new Map([]);
    var inventoryMap = new Map([]);
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
                // inventory: '',
                quantity: '',
                amount: ''
            },
            // 供应商列表
            suppliers: [],
            // 客户列表
            customers: [],
            // 仓库列表
            storehouses: [],
            // 货品列表
            commodities: [],
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
            // 返回货品对应的类型
            getType: function (id) {
                if (id !== undefined) {
                    return commodityMap.get(id.toString()).type;
                }
                return '';
            },
            // 返回货品对应的库存
            getInventory: function (id) {
                if (id !== undefined && this.task.indexOf('入库') === -1) {
                    var store = this.ruleForm.storehouse_out;
                    var inventory = inventoryMap.get(store + '-' + id.toString());
                    return inventory === undefined ? 0 : inventory;
                }
                return '暂无数据';
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
            // 表格中不允许出现多行相同货品
            chooseCommodity: function (x) {
                console.log(x);
                var vis = new Map([]);
                this.ruleForm.table.forEach(function (data) {
                    console.log(data);
                    vis.set(data.commodity_id, 1);
                });
                console.log(vis);
                this.commodities.forEach(function (item) {
                    item.disabled = vis.get(item.value) !== undefined;
                })
                console.log(this.commodities);
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
            checkInventory: function () {
                return false;
            },
            submitForm: function (formName) {
                console.log(this.ruleForm);

                var status = -2;
                var message = '出错了，操作失败';

                var flag = this.checkInventory();
                this.$refs[formName].validate(function (valid) {
                    console.log(valid);
                    if (valid) {

                        if (flag) {

                        } else {
                            status = -1;
                            message = '库存不足';
                        }
                    } else {
                        // 有错则滑到页面顶部
                        window.scrollTo(0, 0);
                    }
                });

                if (status === 1) {
                    this.$message.success(message);
                    this.resetForm('ruleForm');
                } else if (status === 0) {
                    this.$message.warning(message);
                } else if (status === -1) {
                    this.$message.error(message);
                }
            },
            resetForm: function (formName) {
                this.$refs[formName].resetFields();
                this.ruleForm.table.splice(0, this.ruleForm.table.length);
                this.addRow();
            },
            initAddressData: function () {
                var addresses = [];
                $.ajax({
                    type: "POST",
                    url: "/src/select/Address",
                    async: false,//取消异步请求
                    data: {},
                    // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    success: function (data) {
                        var json = JSON.parse(data);
                        console.log(json);
                        addresses = json.code;
                    },
                    error: function (msg) {
                        console.log(msg);
                    }
                });

                var storehouses = [], suppliers = [], customers = [];
                addresses.forEach(function (item) {
                    if (item.type === '仓库') {
                        storehouses.push({value: item.id, label: item.name + " - " + item.address, disabled: false});
                    } else if (item.type === '供应商') {
                        suppliers.push({value: item.id, label: item.name + " - " + item.address});
                    } else {
                        customers.push({value: item.id, label: item.name + " - " + item.address});
                    }
                });
                this.storehouses = storehouses;
                this.suppliers = suppliers;
                this.customers = customers;
            },
            initCommodityData: function () {
                var commodities = [];

                $.ajax({
                    type: "POST",
                    url: "/src/select/Commodity",
                    async: false,//取消异步请求
                    data: {},
                    // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    success: function (data) {
                        var json = JSON.parse(data);
                        console.log(json);
                        commodities = json.code;
                    },
                    error: function (msg) {
                        console.log(msg);
                    }
                });

                var data = [];
                commodities.forEach(function (item) {
                    data.push({value: item.id, label: item.name, type: item.type_name, disabled: false});

                    commodityMap.set(item.id, {name: item.name, type: item.type_name});
                });
                this.commodities = data;
            },
            initInventoryData: function () {
                var inventory = [];

                $.ajax({
                    type: "POST",
                    url: "/src/select/Inventory",
                    async: false,//取消异步请求
                    data: {},
                    // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    success: function (data) {
                        var json = JSON.parse(data);
                        console.log(json);
                        inventory = json.code;
                    },
                    error: function (msg) {
                        console.log(msg);
                    }
                });

                inventory.forEach(function (item) {
                    inventoryMap.set(item.storehouse + '-' + item.commodity_id, item.inventory);
                })

                console.log(inventoryMap);
                console.log(inventoryMap.get('53-1'));
            }
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
            this.ruleForm.invoice_type = this.task = taskMap.get(current);

            // 获取所有 【仓库 | 供应商 | 客户】 的名称和地址
            this.initAddressData();
            // 获取所有仓库货品的库存信息
            this.initInventoryData();
            // 获取所有货品的编码和类别
            this.initCommodityData();
        },
    });
</script>

</body>
</html>
