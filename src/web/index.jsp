<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/21
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>

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

    <link href="style/index.css" rel="stylesheet">

</head>
<body>

<div id="indexVue">

    <%-- 布局容器 --%>
    <el-container>

        <%-- 标题栏 --%>
        <el-header id="nav-head" height="7vh">
            <h2>仓库管理系统</h2>
        </el-header>

        <%-- 套一个布局容器 --%>
        <el-container id="nav-content">

            <%-- 左侧导航栏 --%>
            <el-aside width="250px">
                <jsp:include page="view/menu.jsp"></jsp:include>
            </el-aside>

            <%-- 页面内容 --%>
            <el-container>
                <el-main>

                </el-main>
            </el-container>

        </el-container>

    </el-container>
</div>

<script>
    var indexVue = new Vue({
        el: "#indexVue",
        data: {
            current: sessionStorage.getItem("current"),
            currentActive: this.current == null ? '4-1' : this.current,
        },
        methods: {
            handleOpen: function (key, keyPath) {
                console.log(key, keyPath);
            }
            ,
            handleClose: function (key, keyPath) {
                console.log(key, keyPath);
            }
        }
        ,
        created: function () {

        }
    })
</script>

</body>
</html>