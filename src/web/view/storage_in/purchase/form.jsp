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
        <template>
            <el-table :data="ruleForm.in"
                      :key="ruleForm.in.length"
                      size="mini"
                      border
                      style="width: 100%; border-radius: 5px">
                <el-table-column type="index"
                                 width="50">
                </el-table-column>
                <el-table-column prop="commodity_id"
                                 label="货品编码"
                                 width="180">
                    <template slot-scope="scope">
                        {{ getID(scope.row.commodity_name) }}
                    </template>
                </el-table-column>
                <el-table-column prop="commodity_type"
                                 label="货品类别"
                                 width="180">
                    <template slot-scope="scope">
                        {{ getType(scope.row.commodity_name) }}
                    </template>
                </el-table-column>
                <el-table-column prop="commodity_name"
                                 label="货品名称">
                    <template slot-scope="scope">
                        <el-cascader placeholder="请选择地址"
                                     :options="commodities"
                                     v-model="scope.row.commodity_name"
                                     filterable clearable
                                     style="width: 100%">
                        </el-cascader>
                    </template>
                </el-table-column>
                <el-table-column prop="price"
                                 label="单价">
                    <template slot-scope="scope">
                        <el-input oninput="value=value.replace(/[^\d]/g,'')"
                                  v-model="scope.row.price"></el-input>
                    </template>
                </el-table-column>
                <el-table-column prop="inventory"
                                 label="库存数量">
                    <template slot-scope="scope">
                        {{ getInventory(scope.row.commodity_name) }}
                    </template>
                </el-table-column>
                <el-table-column prop="quantity"
                                 label="数量">
                    <template slot-scope="scope">
                        <el-input oninput="value=value.replace(/[^\d]/g,'')"
                                  v-model="scope.row.quantity"></el-input>
                    </template>
                </el-table-column>
                <el-table-column prop="amout"
                                 label="金额">
                    <template slot-scope="scope">
                        {{ getAmount(scope.row.quantity, scope.row.price) }}
                    </template>
                </el-table-column>
            </el-table>
        </template>

        <el-button type="text" @click="addRow">+ 添加</el-button>
    </el-form-item>

</el-form>