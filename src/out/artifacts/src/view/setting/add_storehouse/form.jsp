<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <el-form-item label="仓库名称" prop="name">
        <el-col span="8">
            <el-input v-model="ruleForm.name"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="仓库位置">
        <el-col span="8">
            <el-input v-model="ruleForm.position"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="负责人" prop="principal">
        <el-col span="8">
            <el-input v-model="ruleForm.principal"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="联系电话" prop="telephone">
        <el-col span="8">
            <el-input oninput="value=value.replace(/[^\d]/g,'')"
                      v-model="ruleForm.telephone"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="备注">
        <el-col span="12">
            <el-input type="textarea" v-model="ruleForm.remark"></el-input>
        </el-col>
    </el-form-item>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>