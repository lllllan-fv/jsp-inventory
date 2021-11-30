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
    </el-row>
    <el-row>
        <el-col span="8">
            <el-form-item label="单据编号">
                <el-input value="自动生成无需填写" disabled></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-row>
        <el-col span="8">
            <template v-if="ruleForm.invoice_type.indexOf('采购')!=-1">
                <el-form-item label="供应商" prop="supplier">
                    <el-select v-model="ruleForm.supplier"
                               filterable clearable
                               style="width: 100%">
                        <el-option v-for="item in suppliers"
                                   :key="item.value"
                                   :value="item.value"
                                   :label="item.label">
                        </el-option>
                    </el-select>
                </el-form-item>
            </template>
            <template v-else-if="ruleForm.invoice_type.indexOf('销售')!=-1">
                <el-form-item label="客户" prop="customer">
                    <el-select v-model="ruleForm.customer"
                               filterable clearable
                               style="width: 100%">
                        <el-option v-for="item in customers"
                                   :key="item.value"
                                   :value="item.value"
                                   :label="item.label">
                        </el-option>
                    </el-select>
                </el-form-item>
            </template>
        </el-col>
    </el-row>

    <template v-if="task.indexOf('入库')===-1">
        <el-row>
            <el-col span="8">
                <el-form-item label="发货仓库" prop="storehouse_out">
                    <el-select v-model="ruleForm.storehouse_out"
                               @change="chooseStorehouse"
                               filterable clearable
                               style="width: 100%">
                        <el-option v-for="item in storehouses"
                                   :key="item.value"
                                   :value="item.value"
                                   :label="item.label"
                                   :disabled="item.disabled">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-col>
        </el-row>
    </template>
    <template v-if="task.indexOf('出库')===-1">
        <el-row>
            <el-col span="8">
                <el-form-item label="收货仓库" prop="storehouse_in">
                    <el-select v-model="ruleForm.storehouse_in"
                               @change="chooseStorehouse"
                               filterable clearable
                               style="width: 100%">
                        <el-option v-for="item in storehouses"
                                   :key="item.value"
                                   :value="item.value"
                                   :label="item.label"
                                   :disabled="item.disabled">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-col>
        </el-row>
    </template>

    <el-row>
        <el-col span="8">
            <el-form-item :label="task.substring(2, 4) + '日期'" prop="date">
                <el-date-picker v-model="ruleForm.date"
                                type="date"
                                placeholder="请选择"
                                style="width: 100%;">
                </el-date-picker>
            </el-form-item>
        </el-col>
    </el-row>

    <el-form-item label="经手人" prop="dealer">
        <el-col span="8">
            <el-input v-model="ruleForm.dealer"></el-input>
        </el-col>
    </el-form-item>

    <el-form-item :label="task.substring(2, 4) + '明细'">
        <jsp:include page="table.jsp"></jsp:include>

        <el-button type="text" @click="addRow">+ 添加</el-button>
    </el-form-item>

    <el-row>
        <el-col span="15">
            <el-form-item label="合计金额">
                <el-input v-model="getTotalAmount" disabled></el-input>
            </el-form-item>
        </el-col>
    </el-row>
    <el-row>
        <el-col span="15">
            <el-form-item label="大写金额">
                <el-input v-model="getChineseNumber" disabled></el-input>
            </el-form-item>
        </el-col>
    </el-row>

    <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
        <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>

</el-form>