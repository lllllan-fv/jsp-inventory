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
            :data="tableData.filter(data => !search || data.name.toLowerCase().includes(search.toLowerCase()))"
            stripe border
            height="100%"
            style="width: 100%; border-radius: 10px">

        <template v-for="item in tableHeader">
            <el-table-column
                    sortable
                    :prop="item.prop"
                    :label="item.label"
                    width="180">
            </el-table-column>
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
