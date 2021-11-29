<%--
  Created by IntelliJ IDEA.
  User: lllllan
  Date: 2021/11/29
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<el-form :model="ruleForm"
         :rules="rules"
         ref="ruleForm"
         label-position="top"
         label-width="80px"
         class="demo-ruleForm">

    <%--    <template v-if="group==='仓库">--%>
    <%--        <el-divider content-position="left">--%>
    <%--            <h3>供应商信息</h3>--%>
    <%--        </el-divider>--%>
    <%--    </template>--%>

    <el-form-item :label="group + '名称'" prop="name">
        <el-col span="8">
            <el-input v-model="ruleForm.name"></el-input>
        </el-col>
    </el-form-item>

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

    <template v-if="group==='仓库'">
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
    </template>
    <tempalte v-else>
        <jsp:include page="useless.jsp"></jsp:include>
    </tempalte>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>