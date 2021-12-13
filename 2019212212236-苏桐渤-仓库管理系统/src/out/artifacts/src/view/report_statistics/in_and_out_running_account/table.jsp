<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<template>
    <el-table
            :data="tableData.filter(data => !search || data.storehouse_in.toLowerCase().includes(search.toLowerCase()))"
            stripe border
            height="100%"
            style="width: 100%; border-radius: 10px">

        <template v-for="item in tableHeader">
            <template v-if="item.children">
                <el-table-column :label="item.label" align="center">
                    <template v-for="subItem in item.children">
                        <el-table-column :prop="subItem.prop"
                                         :label="subItem.label"
                                         sortable
                                         align="center"
                                         width="160">
                        </el-table-column>
                    </template>
                </el-table-column>
            </template>
            <template v-else>
                <el-table-column :prop="item.prop"
                                 :label="item.label"
                                 sortable
                                 align="center"
                                 width="160">
                </el-table-column>
            </template>
        </template>
        <el-table-column
                width="180"
                fixed="right">
            <template slot="header" slot-scope="scope">
                <el-input
                        v-model="search"
                        size="mini"
                        placeholder="输入关键字搜索"/>
            </template>
        </el-table-column>
    </el-table>
</template>
