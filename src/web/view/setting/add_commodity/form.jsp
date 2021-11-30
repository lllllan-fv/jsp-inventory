<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <el-form-item label="货品类别" prop="type">
        <el-col span="8">
            <template>
                <el-select filterable clearable
                           v-model="ruleForm.type"
                           placeholder="请选择"
                           style="width: 100%">
                    <el-option v-for="item in options"
                               :key="item.value"
                               :label="item.label"
                               :value="item.value">
                    </el-option>
                </el-select>
            </template>
        </el-col>
    </el-form-item>
    <el-form-item label="货品编码">
        <el-col span="8">
            <el-input value="自动生成无需填写" disabled></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="货品名称" prop="name">
        <el-col span="8">
            <el-input v-model="ruleForm.name"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="参考进价">
        <el-col span="8">
            <el-input placeholder="功能暂未开通无需填写"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="参考售价">
        <el-col span="8">
            <el-input placeholder="功能暂未开通无需填写"></el-input>
        </el-col>
    </el-form-item>
    <el-form-item label="备注">
        <el-col span="12">
            <el-input type="textarea" placeholder="功能暂未开通无需填写"></el-input>
        </el-col>
    </el-form-item>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>