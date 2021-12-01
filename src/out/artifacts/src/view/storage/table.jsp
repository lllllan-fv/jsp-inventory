<%--
  Created by

  telliJ IDEA.
  User: lllllan
  Date: 2021/11/24
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<template>
    <el-table :data="ruleForm.table"
              :key="tableHeight()"
              size="medium"
              border
              style="width: 100%; border-radius: 5px">

        <el-table-column type="index" width="50">
        </el-table-column>

        <el-table-column prop="commodity_id"
                         label="货品编码"
                         width="180">
            <template slot-scope="scope">
                {{ scope.row.commodity_name[0] }}
            </template>
        </el-table-column>
        <el-table-column prop="commodity_type"
                         label="货品类别"
                         width="180">
            <template slot-scope="scope">
                {{ getType(scope.row.commodity_name[0]) }}
            </template>
        </el-table-column>
        <el-table-column prop="commodity_name"
                         label="货品名称">
            <template slot-scope="scope">
                <%-- 表单中的表格验证 --%>
                <el-form-item :prop="'table.'+scope.$index+'.commodity_id'"
                              :rules="rules.commodity_name">
                    <el-select filterable clearable
                               v-model="scope.row.commodity_id"
                               @change="chooseCommodity"
                               placeholder="请选择"
                               style="width: 100%">
                        <el-option v-for="item in commodities"
                                   :key="item.value"
                                   :label="item.label"
                                   :value="item.value"
                                   :disabled="item.disabled">
                        </el-option>
                    </el-select>
                </el-form-item>
            </template>
        </el-table-column>
        <el-table-column prop="price"
                         label="单价">
            <template slot-scope="scope">
                <el-form-item :prop="'table.'+scope.$index+'.price'"
                              :rules="rules.price">
                    <el-input MaxLength="5"
                              oninput="value=value.replace(/[^\d]/g,'')"
                              v-model="scope.row.price"></el-input>
                </el-form-item>
            </template>
        </el-table-column>
        <el-table-column prop="inventory"
                         label="库存数量">
            <template slot-scope="scope">
                {{ getInventory(scope.row.commodity_name[0]) }}
            </template>
        </el-table-column>
        <el-table-column label="数量">
            <template slot-scope="scope">
                <el-form-item :prop="'table.'+scope.$index+'.quantity'"
                              :rules="rules.quantity">
                    <el-input MaxLength="5"
                              @input="validateQuantity(scope.row)"
                              oninput="value=value.replace(/[^\d]/g,'')"
                              v-model="scope.row.quantity"></el-input>
                </el-form-item>
            </template>
        </el-table-column>
        <el-table-column prop="amount"
                         label="金额">
            <template slot-scope="scope">
                {{ scope.row.amount = getAmount(scope.row.quantity, scope.row.price) }}
            </template>
        </el-table-column>
        <el-table-column label="操作"
                         width="60">
            <template slot-scope="scope">
                <el-button @click="removeRow(scope.$index)" type="text">删除</el-button>
            </template>
        </el-table-column>

    </el-table>
</template>