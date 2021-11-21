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
        @open="handleOpen"
        @close="handleClose"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b">

    <el-submenu index="1">
        <template slot="title">
            <i class="el-icon-folder-opened"></i>
            <span>报表统计</span>
        </template>

        <el-menu-item index="1-1">
            <i class="el-icon-data-line"></i>
            <span slot="title">库存查询</span>
        </el-menu-item>
        <el-menu-item index="1-2">
            <i class="el-icon-data-line"></i>
            <span slot="title">出入库流水账</span>
        </el-menu-item>
        <el-menu-item index="1-3">
            <i class="el-icon-data-line"></i>
            <span slot="title">收发存汇总</span>
        </el-menu-item>
    </el-submenu>

    <el-submenu index="2">
        <template slot="title">
            <i class="el-icon-folder-opened"></i>
            <span>基础设置</span>
        </template>

        <el-menu-item index="2-1">
            <i class="el-icon-tickets"></i>
            <span slot="title">新增仓库</span>
        </el-menu-item>
        <el-menu-item index="2-2">
            <i class="el-icon-tickets"></i>
            <span slot="title">新增货品类别</span>
        </el-menu-item>
        <el-menu-item index="2-3">
            <i class="el-icon-tickets"></i>
            <span slot="title">新增货品</span>
        </el-menu-item>
        <el-menu-item index="2-4">
            <i class="el-icon-tickets"></i>
            <span slot="title">新增供应商</span>
        </el-menu-item>
        <el-menu-item index="2-5">
            <i class="el-icon-tickets"></i>
            <span slot="title">新增客户</span>
        </el-menu-item>
    </el-submenu>

    <el-submenu index="3">
        <template slot="title">
            <i class="el-icon-folder-opened"></i>
            <span>入库管理</span>
        </template>

        <el-menu-item index="3-1">
            <i class="el-icon-box"></i>
            <span slot="title">采购入库</span>
        </el-menu-item>
        <el-menu-item index="3-2">
            <i class="el-icon-box"></i>
            <span slot="title">退货入库</span>
        </el-menu-item>
        <el-menu-item index="3-3">
            <i class="el-icon-box"></i>
            <span slot="title">生产入库</span>
        </el-menu-item>
    </el-submenu>

    <el-submenu index="4">
        <template slot="title">
            <i class="el-icon-folder-opened"></i>
            <span>报表统计</span>
        </template>

        <el-menu-item index="4-1">
            <i class="el-icon-box"></i>
            <span slot="title">采购出库</span>
        </el-menu-item>
        <el-menu-item index="4-2">
            <i class="el-icon-box"></i>
            <span slot="title">退货出库</span>
        </el-menu-item>
        <el-menu-item index="4-3">
            <i class="el-icon-box"></i>
            <span slot="title">消耗出库</span>
        </el-menu-item>
    </el-submenu>

    <el-submenu index="5">
        <template slot="title">
            <i class="el-icon-folder-opened"></i>
            <span>报表统计</span>
        </template>

        <el-menu-item index="5-1">
            <i class="el-icon-s-marketing"></i>
            <span slot="title">库存调拨</span>
        </el-menu-item>
        <el-menu-item index="5-2">
            <i class="el-icon-s-marketing"></i>
            <span slot="title">库存调拨记录</span>
        </el-menu-item>
    </el-submenu>

</el-menu>