<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <el-form-item label="类别编码">
        <el-col span="8">
            <el-input value="自动生成，无需填写" disabled></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="类别名称" prop="name">
        <el-col span="8">
            <el-input v-model="ruleForm.name"></el-input>
        </el-col>
    </el-form-item>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>