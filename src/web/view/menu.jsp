<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/21
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-menu
        :default-active="currentActive"
        unique-opened="true"
        class="el-menu-vertical-demo"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b">

    <template v-for="item in menuList">
        <el-submenu :index="item.index">
            <template slot="title">
                <i :class="item.icon"></i>
                <span>{{ item.title }}</span>
            </template>

            <template v-for="child in item.children">
                <el-menu-item :index="child.index">
                    <i :class="child.icon"></i>
                    <span slot="title">{{ child.title }}</span>
                </el-menu-item>
            </template>
        </el-submenu>
    </template>
 
</el-menu>