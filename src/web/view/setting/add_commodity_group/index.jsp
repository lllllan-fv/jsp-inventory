<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add commodity type</title>

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
<body style="padding: 30px">

<div id="addCommodityTypeVue">
    <jsp:include page="form.jsp"></jsp:include>
</div>

<script>
    var addCommodityTypeVue = new Vue({
        el: '#addCommodityTypeVue',
        data: {
            ruleForm: {
                name: '',
            },
            rules: {
                name: [
                    {required: true, message: '请输入类别名称', trigger: 'blur'},
                    {min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur'}
                ],
            },
        },
        methods: {
            submitForm: function (formName) {

                var status = 0;
                var msg = '';
                var data = this.ruleForm;

                this.$refs[formName].validate(function (valid) {
                    console.log(valid);
                    if (valid) {

                        $.ajax({
                            type: "POST",
                            url: "/src/CommodityGroupServlet",
                            async: false,//取消异步请求
                            data: {
                                name: data.name,
                            },
                            // contentType: "application/x-www-form-urlencoded; charset=utf-8",
                            success: function (data) {
                                var strings = data.trim().split(" ");
                                status = parseInt(strings[0]);
                                msg = strings[1];
                            },
                            error: function (msg) {
                                status = -1;
                                console.log(msg);
                            }
                        });

                    } else {
                        // 有错则滑到页面顶部
                        window.scrollTo(0, 0);
                    }
                });

                if (status === 1) {
                    this.$message.success(msg);
                    this.resetForm('ruleForm');
                } else if (status === 0) {
                    this.$message.warning(msg);
                } else {
                    this.$message.error('出了点错误，添加失败');
                }

            },
            resetForm: function (formName) {
                this.$refs[formName].resetFields();
            },
        },
        beforeMount: function () {
        },
    })
</script>

</body>
</html>
