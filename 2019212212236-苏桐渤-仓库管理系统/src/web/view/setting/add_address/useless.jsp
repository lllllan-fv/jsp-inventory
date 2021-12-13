<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/29
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<el-alert
        title="很抱歉地通知您"
        type="warning"
        description="下方所有功能暂未开通，无需填写反正你也填不了"
        show-icon>
</el-alert>


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