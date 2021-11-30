<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/29
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add address</title>

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
    <script src="cities.js"></script>

</head>
<body style="padding: 30px">

<div id="addAddressVue">
    <jsp:include page="form.jsp"></jsp:include>
</div>

<script>
    var addAddressVue = new Vue({
        el: '#addAddressVue',
        data: {
            group: '',
            cities: cities,
            ruleForm: {
                group: '',
                name: '',
                position: '',
                principal: '',
                telephone: '',
                remark: '',
            },
            rules: {
                name: [
                    {required: true, message: '请输入具体名称', trigger: 'blur'},
                    {min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur'}
                ],
                position: [{required: true, message: '请选择经营地址', trigger: 'change'}],
                principal: [
                    {required: true, message: '请输入负责人姓名', trigger: 'blur'},
                    {min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur'}
                ],
                telephone: [
                    {required: true, message: '请输入手机号码', trigger: 'blur'},
                    {min: 11, max: 11, message: '请输入11位手机号码', trigger: 'blur'},
                ],
            },
        },
        methods: {
            getAddress: function (i, j) {
                var province = cities[(i - 1)].label;
                this.cities[(i - 1)].children.forEach(function (item) {
                    if (item.value === j) {
                        province += "/" + item.label;
                    }
                })
                return province;
            },
            submitForm: function (formName) {
                var status = -2;
                var message = '';
                var data = this.ruleForm;
                var address = data.position === '' ? null : this.getAddress(data.position[0], data.position[1]);

                this.$refs[formName].validate(function (valid) {
                    console.log(valid);
                    if (valid) {
                        $.ajax({
                            type: "POST",
                            url: "/src/insert/Address",
                            async: false,//取消异步请求
                            data: {
                                group: data.group,
                                name: data.name,
                                address: address,
                                principal: data.principal,
                                telephone: data.telephone,
                            },
                            // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            success: function (data) {
                                var json = JSON.parse(data);
                                status = json.status;
                                message = json.message;
                            },
                            error: function (msg) {
                                status = -1;
                            }
                        });

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
                    this.$message.error("出错了，添加失败");
                }
            },
            resetForm: function (formName) {
                this.$refs[formName].resetFields();
            },
        },
        created: function () {

        },
        beforeMount: function () {
            var current = window.parent.indexVue.currentActive;
            switch (current) {
                case "2-1":
                    this.group = '仓库';
                    break;
                case "2-4":
                    this.group = '供应商';
                    break;
                case "2-5":
                    this.group = '客户';
                    break;
            }
            this.ruleForm.group = this.group;
            console.log(this.group);
        }
    })
</script>

</body>
</html>
