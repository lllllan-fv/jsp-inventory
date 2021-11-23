<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/23
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <%--=======================================================================--%>
    <el-divider content-position="left">
        <h3>供应商信息</h3>
    </el-divider>

    <el-row>
        <el-col span="8">
            <el-form-item label="供应商编码">
                <el-input value="自动生成无需填写" disabled></el-input>
            </el-form-item>
        </el-col>
        <el-col span="8" offset="4">
            <el-form-item label="供应商名称" prop="name">
                <el-input v-model="ruleForm.name"></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-form-item label="经营地址" prop="position">
        <el-col span="8">
            <el-cascader placeholder="请选择地址"
                         :options="cities"
                         v-model="ruleForm.position"
                         filterable clearable
                         style="width: 100%">
            </el-cascader>
        </el-col>
    </el-form-item>
    <el-form-item>
        <el-col span="8">
            <el-input type="textarea"
                      placeholder="请填写详细地址，算了反正也没有这个功能"></el-input>
        </el-col>
    </el-form-item>

    <el-alert
            title="很抱歉地通知您"
            type="warning"
            description="下方所有功能暂未开通，无需填写反正你也填不了"
            show-icon>
    </el-alert>

    <%--=======================================================================--%>
    <br>
    <el-divider content-position="left">
        <h3>对接人信息</h3>
    </el-divider>

    <el-row>
        <el-col span="6">
            <el-form-item label="姓名">
                <el-input></el-input>
            </el-form-item>
        </el-col>
        <el-col span="6" offset="2">
            <el-form-item label="手机">
                <el-input></el-input>
            </el-form-item>
        </el-col>
        <el-col span="6" offset="2">
            <el-form-item label="电话">
                <el-input></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-row>
        <el-col span="6">
            <el-form-item label="职位">
                <el-input></el-input>
            </el-form-item>
        </el-col>
        <el-col span="6" offset="2">
            <el-form-item label="邮箱">
                <el-input></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <%--=======================================================================--%>
    <br>
    <el-divider content-position="left">
        <h3>财务信息</h3>
    </el-divider>

    <el-row>
        <el-col span="6">
            <el-form-item label="开户银行">
                <el-input></el-input>
            </el-form-item>
        </el-col>
        <el-col span="6" offset="2">
            <el-form-item label="账户">
                <el-input></el-input>
            </el-form-item>
        </el-col>
        <el-col span="6" offset="2">
            <el-form-item label="税号">
                <el-input></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-form-item label="备注">
        <el-col span="12">
            <el-input type="textarea"></el-input>
        </el-col>
    </el-form-item>

    <%--=======================================================================--%>
    <br>
    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>