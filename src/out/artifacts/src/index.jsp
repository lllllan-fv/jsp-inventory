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
    <title>仓库管理系统</title>

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
            <div style="font-size: 4vh; margin: 1vh 0 0 20px">仓库管理系统</div>
        </el-header>

        <%-- 套一个布局容器 --%>
        <el-container id="nav-content">

            <%-- 左侧导航栏 --%>
            <el-aside width="250px">
                <jsp:include page="view/menu/index.jsp"></jsp:include>
            </el-aside>

            <%-- 页面内容 --%>
            <el-main style="padding: 0">
                <iframe id="myIframe"
                        :src="iframeSrc"
                        style="height:100%; width:100%; border: none;">
                </iframe>
            </el-main>

        </el-container>

    </el-container>
</div>

<script>
    var pathMap = new Map([
        ["1-1", "view/report_statistics/inventory_inquiry"],
        ["1-2", "view/report_statistics/in_and_out_running_account"],
        ["2-1", "view/setting/add_storehouse"],
        ["2-2", "view/setting/add_commodity_type"],
        ["2-3", "view/setting/add_commodity"],
        ["2-4", "view/setting/add_supplier"],
        ["2-5", "view/setting/add_customer"],
        ["3-1", "view/storage"],
        ["3-2", "view/storage"],
        ["3-3", "view/storage"],
        ["4-1", "view/storage"],
        ["4-2", "view/storage"],
        ["4-3", "view/storage"],
        ["5-1", "view/storage"],
    ]);
    var indexVue = new Vue({
        el: "#indexVue",
        data: {
            currentActive: null,
            iframeSrc: null,
            menuList: [
                {
                    index: '1',
                    icon: 'el-icon-folder-opened',
                    title: '报表统计',
                    children: [
                        {
                            index: '1-1',
                            icon: 'el-icon-data-line',
                            title: '库存查询',
                        },
                        {
                            index: '1-2',
                            icon: 'el-icon-data-line',
                            title: '出入库流水账',
                        },
                    ],
                },
                {
                    index: '2',
                    icon: 'el-icon-folder-opened',
                    title: '基础设置',
                    children: [
                        {
                            index: '2-1',
                            icon: 'el-icon-tickets',
                            title: '新增仓库',
                        },
                        {
                            index: '2-2',
                            icon: 'el-icon-tickets',
                            title: '新增货品类别',
                        },
                        {
                            index: '2-3',
                            icon: 'el-icon-tickets',
                            title: '新增货品',
                        },
                        {
                            index: '2-4',
                            icon: 'el-icon-tickets',
                            title: '新增供应商',
                        },
                        {
                            index: '2-5',
                            icon: 'el-icon-tickets',
                            title: '新增客户',
                        },
                    ],
                },
                {
                    index: '3',
                    icon: 'el-icon-folder-opened',
                    title: '入库管理',
                    children: [
                        {
                            index: '3-1',
                            icon: 'el-icon-box',
                            title: '采购入库',
                        },
                        {
                            index: '3-2',
                            icon: 'el-icon-box',
                            title: '生产入库',
                        },
                        // {
                        //     index: '3-3',
                        //     icon: 'el-icon-box',
                        //     title: '退货入库',
                        // },
                    ],
                },
                {
                    index: '4',
                    icon: 'el-icon-folder-opened',
                    title: '出库管理',
                    children: [
                        {
                            index: '4-1',
                            icon: 'el-icon-box',
                            title: '销售出库',
                        },
                        {
                            index: '4-2',
                            icon: 'el-icon-box',
                            title: '消耗出库',
                        },
                        // {
                        //     index: '4-3',
                        //     icon: 'el-icon-box',
                        //     title: '退货出库',
                        // },
                    ],
                },
                {
                    index: '5',
                    icon: 'el-icon-folder-opened',
                    title: '库存管理',
                    children: [
                        {
                            index: '5-1',
                            icon: 'el-icon-s-marketing',
                            title: '库存调拨',
                        },
                        {
                            index: '5-2',
                            icon: 'el-icon-s-marketing',
                            title: '库存调拨记录',
                        },
                    ],
                },
            ],
        },
        methods: {
            setIframe: function (index) {
                this.currentActive = index;
                this.iframeSrc = pathMap.get(index);
                // 刷新子页面，重新获取页面内容
                $("#myIframe").attr('src', $("#myIframe").attr('src'));
            },
            menuItemClick: function (item) {
                this.setIframe(item.index);
                sessionStorage.setItem("current", item.index);
            }
        },
        created: function () {
        },
        beforeMount: function () {
            var current = sessionStorage.getItem("current");
            this.currentActive = current == null ? "1-1" : current;
            this.setIframe(this.currentActive);
        }
    })
</script>

</body>
</html>