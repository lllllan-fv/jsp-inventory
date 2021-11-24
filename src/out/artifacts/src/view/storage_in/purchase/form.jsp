<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <el-row>
        <el-col span="8">
            <el-form-item label="单据类型">
                <el-input v-model="ruleForm.invoice_type" disabled></el-input>
            </el-form-item>
        </el-col>
        <el-col span="8" offset="4">
            <el-form-item label="单据编号">
                <el-input value="自动生成无需填写" disabled></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-row>
        <el-col span="8">
            <el-form-item label="采购单号">
                <el-input value="自动生成无需填写" disabled></el-input>
            </el-form-item>
        </el-col>
        <el-col span="8" offset="4">
            <el-form-item label="供应商">
                <el-cascader placeholder="请选择供应商"
                             :options="suppliers"
                             v-model="ruleForm.supplier"
                             filterable clearable
                             style="width: 100%">
                </el-cascader>
            </el-form-item>
        </el-col>
    </el-row>

    <el-form-item label="经手人">
        <el-col span="8">
            <el-input v-model="ruleForm.dealer"></el-input>
        </el-col>
    </el-form-item>

    <el-form-item label="入库明细">
        <jsp:include page="table.jsp"></jsp:include>

        <el-button type="text" @click="addRow">+ 添加</el-button>
    </el-form-item>

    <el-form-item label="合计金额">
        <el-col span="8">
            <el-input v-model="getTotalAmount" disabled></el-input>
        </el-col>
    </el-form-item>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>