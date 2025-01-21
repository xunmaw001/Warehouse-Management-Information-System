<template>
  <div class="main-content">
    <!-- 列表页 -->
    <div v-if="showFlag">
      <el-form :inline="true" :model="searchForm" class="form-content">
        <el-row :gutter="20" class="slt" :style="{justifyContent:contents.searchBoxPosition=='1'?'flex-start':contents.searchBoxPosition=='2'?'center':'flex-end'}">
                <el-form-item :label="contents.inputTitle == 1 ? '货物名称' : ''">
                  <el-input v-if="contents.inputIcon == 1 && contents.inputIconPosition == 1" prefix-icon="el-icon-search" v-model="searchForm.huowumingcheng" placeholder="货物名称" clearable></el-input>
                  <el-input v-if="contents.inputIcon == 1 && contents.inputIconPosition == 2" suffix-icon="el-icon-search" v-model="searchForm.huowumingcheng" placeholder="货物名称" clearable></el-input>
                  <el-input v-if="contents.inputIcon == 0" v-model="searchForm.huowumingcheng" placeholder="货物名称" clearable></el-input>
                </el-form-item>
                <el-form-item :label="contents.inputTitle == 1 ? '货物类型' : ''">
                  <el-input v-if="contents.inputIcon == 1 && contents.inputIconPosition == 1" prefix-icon="el-icon-search" v-model="searchForm.huowuleixing" placeholder="货物类型" clearable></el-input>
                  <el-input v-if="contents.inputIcon == 1 && contents.inputIconPosition == 2" suffix-icon="el-icon-search" v-model="searchForm.huowuleixing" placeholder="货物类型" clearable></el-input>
                  <el-input v-if="contents.inputIcon == 0" v-model="searchForm.huowuleixing" placeholder="货物类型" clearable></el-input>
                </el-form-item>
		<el-form-item class="select" label="仓库" prop="cangku">
		  <el-select  @change="cangkuChange" clearable v-model="searchForm.cangku" placeholder="请选择仓库">
		    <el-option
			v-for="(item,index) in cangkuOptions"
			v-bind:key="index"
			:label="item"
			:value="item">
		    </el-option>
		  </el-select>
		</el-form-item>
          <el-form-item>
            <el-button v-if="contents.searchBtnIcon == 1 && contents.searchBtnIconPosition == 1" icon="el-icon-search" type="success" @click="search()">{{ contents.searchBtnFont == 1?'查询':'' }}</el-button>
            <el-button v-if="contents.searchBtnIcon == 1 && contents.searchBtnIconPosition == 2" type="success" @click="search()">{{ contents.searchBtnFont == 1?'查询':'' }}<i class="el-icon-search el-icon--right"/></el-button>
            <el-button v-if="contents.searchBtnIcon == 0" type="success" @click="search()">{{ contents.searchBtnFont == 1?'查询':'' }}</el-button>
          </el-form-item>
        </el-row>
        <el-row class="ad" :style="{justifyContent:contents.btnAdAllBoxPosition=='1'?'flex-start':contents.btnAdAllBoxPosition=='2'?'center':'flex-end'}">
          <el-form-item>
            <el-button
              v-if="isAuth('huowuxinxi','新增') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1"
              type="success"
              icon="el-icon-plus"
              @click="addOrUpdateHandler()"
            >{{ contents.btnAdAllFont == 1?'新增':'' }}</el-button>
            <el-button
              v-if="isAuth('huowuxinxi','新增') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2"
              type="success"
              @click="addOrUpdateHandler()"
            >{{ contents.btnAdAllFont == 1?'新增':'' }}<i class="el-icon-plus el-icon--right" /></el-button>
            <el-button
              v-if="isAuth('huowuxinxi','新增') && contents.btnAdAllIcon == 0"
              type="success"
              @click="addOrUpdateHandler()"
            >{{ contents.btnAdAllFont == 1?'新增':'' }}</el-button>
            <el-button
              v-if="isAuth('huowuxinxi','删除') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1 && contents.tableSelection"
              :disabled="dataListSelections.length <= 0"
              type="danger"
              icon="el-icon-delete"
              @click="deleteHandler()"
            >{{ contents.btnAdAllFont == 1?'删除':'' }}</el-button>
            <el-button
              v-if="isAuth('huowuxinxi','删除') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2 && contents.tableSelection"
              :disabled="dataListSelections.length <= 0"
              type="danger"
              @click="deleteHandler()"
            >{{ contents.btnAdAllFont == 1?'删除':'' }}<i class="el-icon-delete el-icon--right" /></el-button>
            <el-button
              v-if="isAuth('huowuxinxi','删除') && contents.btnAdAllIcon == 0 && contents.tableSelection"
              :disabled="dataListSelections.length <= 0"
              type="danger"
              @click="deleteHandler()"
            >{{ contents.btnAdAllFont == 1?'删除':'' }}</el-button>


	    <download-excel v-if="isAuth('huowuxinxi','导出')" class = "export-excel-wrapper" :data = "dataList" :fields = "json_fields" name = "货物信息.xls">
		      <!-- 导出excel -->
            	<el-button
              	v-if="contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1"
              	type="danger"
              	icon="el-icon-download"
            	>{{ contents.btnAdAllFont == 1?'导出':'' }}</el-button>
            	<el-button
              	v-if="contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2"
              	type="danger"
            	>{{ contents.btnAdAllFont == 1?'导出':'' }}<i class="el-icon-download el-icon--right" /></el-button>
            	<el-button
              	v-if="contents.btnAdAllIcon == 0"
              	type="danger"
            	>{{ contents.btnAdAllFont == 1?'导出':'' }}</el-button>
       	    </download-excel>


            <el-button
              v-if="isAuth('huowuxinxi','报表') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1"
              type="warning"
              icon="el-icon-s-data"
              @click="chartDialog()"
            >{{ contents.btnAdAllFont == 1?'统计报表':'' }}</el-button>
            <el-button
              v-if="isAuth('huowuxinxi','报表') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2"
              type="warning"
              @click="chartDialog()"
            >{{ contents.btnAdAllFont == 1?'统计报表':'' }}<i class="el-icon-s-data el-icon--right" /></el-button>
            <el-button
              v-if="isAuth('huowuxinxi','报表') && contents.btnAdAllIcon == 0"
              type="warning"
              @click="chartDialog()"
            >{{ contents.btnAdAllFont == 1?'统计报表':'' }}</el-button>

          </el-form-item>
        </el-row>
      </el-form>
      <div class="table-content">
        <el-table class="tables" :size="contents.tableSize" :show-header="contents.tableShowHeader"
            :header-row-style="headerRowStyle" :header-cell-style="headerCellStyle"
            :border="contents.tableBorder"
            :fit="contents.tableFit"
            :stripe="contents.tableStripe"
            :style="{width: '100%',fontSize:contents.tableContentFontSize,color:contents.tableContentFontColor}"
            v-if="isAuth('huowuxinxi','查看')"
            :data="dataList"
            v-loading="dataListLoading"
            @selection-change="selectionChangeHandler">
            <el-table-column  v-if="contents.tableSelection"
                type="selection"
                :header-align="contents.tableAlign"
                align="center"
                width="50">
            </el-table-column>
            <el-table-column label="索引" :align="contents.tableAlign"  v-if="contents.tableIndex" type="index" width="50" />
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="huowubianhao"
                   :header-align="contents.tableAlign"
		    label="货物编号">
		     <template slot-scope="scope">
                       {{scope.row.huowubianhao}}
                     </template>
                </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="huowumingcheng"
                   :header-align="contents.tableAlign"
		    label="货物名称">
		     <template slot-scope="scope">
                       {{scope.row.huowumingcheng}}
                     </template>
                </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="huowuleixing"
                   :header-align="contents.tableAlign"
		    label="货物类型">
		     <template slot-scope="scope">
                       {{scope.row.huowuleixing}}
                     </template>
                </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="huowuguige"
                   :header-align="contents.tableAlign"
		    label="货物规格">
		     <template slot-scope="scope">
                       {{scope.row.huowuguige}}
                     </template>
                </el-table-column>
                  <el-table-column :sortable="contents.tableSortable" :align="contents.tableAlign"  prop="tupian"
                   :header-align="contents.tableAlign"
                    width="200"
                    label="图片">
                    <template slot-scope="scope">
                      <div v-if="scope.row.tupian">
                        <img :src="$base.url+scope.row.tupian.split(',')[0]" width="100" height="100">
                      </div>
                      <div v-else>无图片</div>
                    </template>
                  </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="shuliang"
                   :header-align="contents.tableAlign"
		    label="数量">
		     <template slot-scope="scope">
                       {{scope.row.shuliang}}
                     </template>
                </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="cangku"
                   :header-align="contents.tableAlign"
		    label="仓库">
		     <template slot-scope="scope">
                       {{scope.row.cangku}}
                     </template>
                </el-table-column>
                <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign" 
                    prop="shengchanriqi"
                   :header-align="contents.tableAlign"
		    label="生产日期">
		     <template slot-scope="scope">
                       {{scope.row.shengchanriqi}}
                     </template>
                </el-table-column>
            <el-table-column width="300" :align="contents.tableAlign" 
               :header-align="contents.tableAlign"
                label="操作">
                <template slot-scope="scope">
                <el-button v-if="isAuth('huowuxinxi','查看') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="success" icon="el-icon-tickets" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','查看') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}<i class="el-icon-tickets el-icon--right" /></el-button>
                <el-button v-if="isAuth('huowuxinxi','查看') && contents.tableBtnIcon == 0" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','货物入库') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="success" icon="el-icon-tickets" size="mini" @click="huowurukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物入库':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','货物入库') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="success" size="mini" @click="huowurukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物入库':'' }}<i class="el-icon-tickets el-icon--right" /></el-button>
                <el-button v-if="isAuth('huowuxinxi','货物入库') && contents.tableBtnIcon == 0" type="success" size="mini" @click="huowurukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物入库':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','货物出库') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="success" icon="el-icon-tickets" size="mini" @click="huowuchukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物出库':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','货物出库') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="success" size="mini" @click="huowuchukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物出库':'' }}<i class="el-icon-tickets el-icon--right" /></el-button>
                <el-button v-if="isAuth('huowuxinxi','货物出库') && contents.tableBtnIcon == 0" type="success" size="mini" @click="huowuchukuCrossAddOrUpdateHandler(scope.row,'cross','','','')">{{ contents.tableBtnFont == 1?'货物出库':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','修改') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="primary" icon="el-icon-edit" size="mini" @click="addOrUpdateHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'修改':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','修改') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'修改':'' }}<i class="el-icon-edit el-icon--right" /></el-button>
                <el-button v-if="isAuth('huowuxinxi','修改') && contents.tableBtnIcon == 0" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'修改':'' }}</el-button>




                <el-button v-if="isAuth('huowuxinxi','删除') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="danger" icon="el-icon-delete" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}</el-button>
                <el-button v-if="isAuth('huowuxinxi','删除') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="danger" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}<i class="el-icon-delete el-icon--right" /></el-button>
                <el-button v-if="isAuth('huowuxinxi','删除') && contents.tableBtnIcon == 0" type="danger" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination
          clsss="pages"
          :layout="layouts"
          @size-change="sizeChangeHandle"
          @current-change="currentChangeHandle"
          :current-page="pageIndex"
          :page-sizes="[10, 20, 50, 100]"
          :page-size="Number(contents.pageEachNum)"
          :total="totalPage"
          :small="contents.pageStyle"
          class="pagination-content"
          :background="contents.pageBtnBG"
          :style="{textAlign:contents.pagePosition==1?'left':contents.pagePosition==2?'center':'right'}"
        ></el-pagination>
      </div>
    </div>
    <!-- 添加/修改页面  将父组件的search方法传递给子组件-->
    <add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>

    <huowuruku-cross-add-or-update v-if="huowurukuCrossAddOrUpdateFlag" :parent="this" ref="huowurukuCrossaddOrUpdate"></huowuruku-cross-add-or-update>
    <huowuchuku-cross-add-or-update v-if="huowuchukuCrossAddOrUpdateFlag" :parent="this" ref="huowuchukuCrossaddOrUpdate"></huowuchuku-cross-add-or-update>




    <el-dialog
      title="统计报表"
      :visible.sync="chartVisiable"
      width="800">
        <div id="shuliangChart" style="width:100%;height:600px;"></div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="chartDialog">返回</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import axios from 'axios'
import AddOrUpdate from "./add-or-update";
import huowurukuCrossAddOrUpdate from "../huowuruku/add-or-update";
import huowuchukuCrossAddOrUpdate from "../huowuchuku/add-or-update";
export default {
  data() {
    return {
      cangkuOptions: [],
      searchForm: {
        key: ""
      },
      form:{},
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      showFlag: true,
      sfshVisiable: false,
      shForm: {},
      chartVisiable: false,
      addOrUpdateFlag:false,
      huowurukuCrossAddOrUpdateFlag: false,
      huowuchukuCrossAddOrUpdateFlag: false,
      contents:{"searchBtnFontColor":"rgba(255, 255, 255, 1)","pagePosition":"2","inputFontSize":"14px","inputBorderRadius":"4px","tableBtnDelFontColor":"rgba(45, 98, 137, 1)","tableBtnIconPosition":"1","searchBtnHeight":"40px","tableBgColor":"rgba(255, 255, 255, 1)","inputIconColor":"#C0C4CC","searchBtnBorderRadius":"4px","tableStripe":false,"btnAdAllWarnFontColor":"rgba(31, 63, 80, 1)","tableBtnDelBgColor":"#fff","searchBtnIcon":"1","tableSize":"medium","searchBtnBorderStyle":"solid","text":{"padding":"10px 100px","boxShadow":"0 0 0px rgba(0,0,0,.1)","margin":"15% auto 0","borderColor":"rgba(31, 63, 80, 1)","backgroundColor":"rgba(45, 98, 137, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"0","borderWidth":"5px 0","width":"auto","lineHeight":"atuo","fontSize":"45px","borderStyle":"solid"},"tableSelection":true,"searchBtnBorderWidth":"5px 0","tableContentFontSize":"14px","searchBtnBgColor":"rgba(45, 98, 137, 1)","inputTitleSize":"14px","btnAdAllBorderColor":"rgba(31, 63, 80, 1)","pageJumper":true,"btnAdAllIconPosition":"1","searchBoxPosition":"1","tableBtnDetailFontColor":"rgba(45, 98, 137, 1)","tableBtnHeight":"40px","pagePager":true,"searchBtnBorderColor":"rgba(31, 63, 80, 1)","tableHeaderFontColor":"rgba(255, 255, 255, 1)","inputTitle":"1","tableBtnBorderRadius":"40px","btnAdAllFont":"1","btnAdAllDelFontColor":"rgba(31, 63, 80, 1)","tableBtnIcon":"1","btnAdAllHeight":"45px","btnAdAllWarnBgColor":"#fff","btnAdAllBorderWidth":"5px","tableStripeFontColor":"#606266","tableBtnBorderStyle":"solid","inputHeight":"40px","btnAdAllBorderRadius":"40px","btnAdAllDelBgColor":"#fff","pagePrevNext":true,"btnAdAllAddBgColor":"#fff","searchBtnFont":"1","tableIndex":true,"btnAdAllIcon":"1","tableSortable":true,"pageSizes":true,"tableFit":true,"pageBtnBG":false,"searchBtnFontSize":"14px","tableBtnEditBgColor":"#fff","box":{"padding":"10px 20px","boxShadow":"0 0 6px rgba(0,0,0,0)","flag":"1","backgroundImage":"http://codegen.caihongy.cn/20220121/e41262e25a7f439882faba4aa95de069.png","background":"#fff"},"inputBorderWidth":"5px 0","inputFontPosition":"2","inputFontColor":"rgba(255, 255, 255, 1)","pageEachNum":10,"tableHeaderBgColor":"rgba(45, 98, 137, 1)","inputTitleColor":"#333","btnAdAllBoxPosition":"1","tableBtnDetailBgColor":"#fff","inputIcon":"0","searchBtnIconPosition":"1","btnAdAllFontSize":"14px","inputBorderStyle":"solid","tableHoverFontColor":"#333","inputBgColor":"rgba(45, 98, 137, 1)","pageStyle":true,"pageTotal":true,"btnAdAllAddFontColor":"rgba(31, 63, 80, 1)","tableBtnFont":"1","tableContentFontColor":"#606266","inputBorderColor":"rgba(31, 63, 80, 1)","tableShowHeader":true,"tableHoverBgColor":"#f5f5f5","tableBtnFontSize":"14px","tableBtnBorderColor":"rgba(45, 98, 137, 1)","inputIconPosition":"1","tableBorder":true,"btnAdAllBorderStyle":"solid","tableBtnBorderWidth":"5px","tableStripeBgColor":"#F5F7FA","tableBtnEditFontColor":"rgba(45, 98, 137, 1)","tableAlign":"center"},
      layouts: '',

//导出excel
      json_fields: {
      "货物编号": "huowubianhao",    //常规字段
      "货物名称": "huowumingcheng",    //常规字段
      "货物类型": "huowuleixing",    //常规字段
      "货物规格": "huowuguige",    //常规字段
      "图片": "tupian",    //常规字段
      "数量": "shuliang",    //常规字段
      "仓库": "cangku",    //常规字段
      "生产日期": "shengchanriqi",    //常规字段
      "货物详情": "huowuxiangqing",    //常规字段
      "最近点击时间": "clicktime",    //常规字段
      "点击次数": "clicknum",    //常规字段
      },
      json_meta: [
        [
          {
            " key ": " charset ",
            " value ": " utf- 8 "
          }
        ]
      ]

    };
  },
  created() {
    this.init();
    this.getDataList();
    this.contentStyleChange()
  },
  mounted() {

  },
  filters: {
    htmlfilter: function (val) {
      return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
    }
  },
  components: {
    AddOrUpdate,
    huowurukuCrossAddOrUpdate,
    huowuchukuCrossAddOrUpdate,
  },
  methods: {
    contentStyleChange() {
      this.contentSearchStyleChange()
      this.contentBtnAdAllStyleChange()
      this.contentSearchBtnStyleChange()
      this.contentTableBtnStyleChange()
      this.contentPageStyleChange()
    },
    contentSearchStyleChange() {
      this.$nextTick(()=>{
        document.querySelectorAll('.form-content .slt .el-input__inner').forEach(el=>{
          let textAlign = 'left'
          if(this.contents.inputFontPosition == 2) textAlign = 'center'
          if(this.contents.inputFontPosition == 3) textAlign = 'right'
          el.style.textAlign = textAlign
          el.style.height = this.contents.inputHeight
          el.style.lineHeight = this.contents.inputHeight
          el.style.color = this.contents.inputFontColor
          el.style.fontSize = this.contents.inputFontSize
          el.style.borderWidth = this.contents.inputBorderWidth
          el.style.borderStyle = this.contents.inputBorderStyle
          el.style.borderColor = this.contents.inputBorderColor
          el.style.borderRadius = this.contents.inputBorderRadius
          el.style.backgroundColor = this.contents.inputBgColor
        })
        if(this.contents.inputTitle) {
          document.querySelectorAll('.form-content .slt .el-form-item__label').forEach(el=>{
            el.style.color = this.contents.inputTitleColor
            el.style.fontSize = this.contents.inputTitleSize
            el.style.lineHeight = this.contents.inputHeight
          })
        }
        setTimeout(()=>{
          document.querySelectorAll('.form-content .slt .el-input__prefix').forEach(el=>{
            el.style.color = this.contents.inputIconColor
            el.style.lineHeight = this.contents.inputHeight
          })
          document.querySelectorAll('.form-content .slt .el-input__suffix').forEach(el=>{
            el.style.color = this.contents.inputIconColor
            el.style.lineHeight = this.contents.inputHeight
          })
          document.querySelectorAll('.form-content .slt .el-input__icon').forEach(el=>{
            el.style.lineHeight = this.contents.inputHeight
          })
        },10)

      })
    },
    // 搜索按钮
    contentSearchBtnStyleChange() {
      this.$nextTick(()=>{
        document.querySelectorAll('.form-content .slt .el-button--success').forEach(el=>{
          el.style.height = this.contents.searchBtnHeight
          el.style.color = this.contents.searchBtnFontColor
          el.style.fontSize = this.contents.searchBtnFontSize
          el.style.borderWidth = this.contents.searchBtnBorderWidth
          el.style.borderStyle = this.contents.searchBtnBorderStyle
          el.style.borderColor = this.contents.searchBtnBorderColor
          el.style.borderRadius = this.contents.searchBtnBorderRadius
          el.style.backgroundColor = this.contents.searchBtnBgColor
        })
      })
    },
    // 新增、批量删除
    contentBtnAdAllStyleChange() {
      this.$nextTick(()=>{
        document.querySelectorAll('.form-content .ad .el-button--success').forEach(el=>{
          el.style.height = this.contents.btnAdAllHeight
          el.style.color = this.contents.btnAdAllAddFontColor
          el.style.fontSize = this.contents.btnAdAllFontSize
          el.style.borderWidth = this.contents.btnAdAllBorderWidth
          el.style.borderStyle = this.contents.btnAdAllBorderStyle
          el.style.borderColor = this.contents.btnAdAllBorderColor
          el.style.borderRadius = this.contents.btnAdAllBorderRadius
          el.style.backgroundColor = this.contents.btnAdAllAddBgColor
        })
        document.querySelectorAll('.form-content .ad .el-button--danger').forEach(el=>{
          el.style.height = this.contents.btnAdAllHeight
          el.style.color = this.contents.btnAdAllDelFontColor
          el.style.fontSize = this.contents.btnAdAllFontSize
          el.style.borderWidth = this.contents.btnAdAllBorderWidth
          el.style.borderStyle = this.contents.btnAdAllBorderStyle
          el.style.borderColor = this.contents.btnAdAllBorderColor
          el.style.borderRadius = this.contents.btnAdAllBorderRadius
          el.style.backgroundColor = this.contents.btnAdAllDelBgColor
        })
        document.querySelectorAll('.form-content .ad .el-button--warning').forEach(el=>{
          el.style.height = this.contents.btnAdAllHeight
          el.style.color = this.contents.btnAdAllWarnFontColor
          el.style.fontSize = this.contents.btnAdAllFontSize
          el.style.borderWidth = this.contents.btnAdAllBorderWidth
          el.style.borderStyle = this.contents.btnAdAllBorderStyle
          el.style.borderColor = this.contents.btnAdAllBorderColor
          el.style.borderRadius = this.contents.btnAdAllBorderRadius
          el.style.backgroundColor = this.contents.btnAdAllWarnBgColor
        })
      })
    },
    // 表格
    // rowStyle({ row, rowIndex}) {
    //   if (rowIndex % 2 == 1) {
    //     if(this.contents.tableStripe) {
    //       return {color:this.contents.tableStripeFontColor}
    //     }
    //   } else {
    //     return ''
    //   }
    // },
    // cellStyle({ row, rowIndex}){
    //   if (rowIndex % 2 == 1) {
    //     if(this.contents.tableStripe) {
    //       return {backgroundColor:this.contents.tableStripeBgColor}
    //     }
    //   } else {
    //     return ''
    //   }
    // },
    headerRowStyle({ row, rowIndex}){
      return {color: this.contents.tableHeaderFontColor}
    },
    headerCellStyle({ row, rowIndex}){
      return {backgroundColor: this.contents.tableHeaderBgColor}
    },
    // 表格按钮
    contentTableBtnStyleChange(){
      // this.$nextTick(()=>{
      //   setTimeout(()=>{
      //     document.querySelectorAll('.table-content .tables .el-table__body .el-button--success').forEach(el=>{
      //       el.style.height = this.contents.tableBtnHeight
      //       el.style.color = this.contents.tableBtnDetailFontColor
      //       el.style.fontSize = this.contents.tableBtnFontSize
      //       el.style.borderWidth = this.contents.tableBtnBorderWidth
      //       el.style.borderStyle = this.contents.tableBtnBorderStyle
      //       el.style.borderColor = this.contents.tableBtnBorderColor
      //       el.style.borderRadius = this.contents.tableBtnBorderRadius
      //       el.style.backgroundColor = this.contents.tableBtnDetailBgColor
      //     })
      //     document.querySelectorAll('.table-content .tables .el-table__body .el-button--primary').forEach(el=>{
      //       el.style.height = this.contents.tableBtnHeight
      //       el.style.color = this.contents.tableBtnEditFontColor
      //       el.style.fontSize = this.contents.tableBtnFontSize
      //       el.style.borderWidth = this.contents.tableBtnBorderWidth
      //       el.style.borderStyle = this.contents.tableBtnBorderStyle
      //       el.style.borderColor = this.contents.tableBtnBorderColor
      //       el.style.borderRadius = this.contents.tableBtnBorderRadius
      //       el.style.backgroundColor = this.contents.tableBtnEditBgColor
      //     })
      //     document.querySelectorAll('.table-content .tables .el-table__body .el-button--danger').forEach(el=>{
      //       el.style.height = this.contents.tableBtnHeight
      //       el.style.color = this.contents.tableBtnDelFontColor
      //       el.style.fontSize = this.contents.tableBtnFontSize
      //       el.style.borderWidth = this.contents.tableBtnBorderWidth
      //       el.style.borderStyle = this.contents.tableBtnBorderStyle
      //       el.style.borderColor = this.contents.tableBtnBorderColor
      //       el.style.borderRadius = this.contents.tableBtnBorderRadius
      //       el.style.backgroundColor = this.contents.tableBtnDelBgColor
      //     })

      //   }, 50)
      // })
    },
    // 分页
    contentPageStyleChange(){
      let arr = []

      if(this.contents.pageTotal) arr.push('total')
      if(this.contents.pageSizes) arr.push('sizes')
      if(this.contents.pagePrevNext){
        arr.push('prev')
        if(this.contents.pagePager) arr.push('pager')
        arr.push('next')
      }
      if(this.contents.pageJumper) arr.push('jumper')
      this.layouts = arr.join()
      this.contents.pageEachNum = 10
    },

    huowurukuCrossAddOrUpdateHandler(row,type,crossOptAudit,statusColumnName,tips,statusColumnValue){
      this.showFlag = false;
      this.addOrUpdateFlag = false;
      this.huowurukuCrossAddOrUpdateFlag = true;
      this.$storage.set('crossObj',row);
      this.$storage.set('crossTable','huowuxinxi');
      this.$storage.set('statusColumnName',statusColumnName);
      this.$storage.set('statusColumnValue',statusColumnValue);
      this.$storage.set('tips',tips);
	if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
		var obj = this.$storage.getObj('crossObj');
		for (var o in obj){
		  if(o==statusColumnName && obj[o]==statusColumnValue){
		    this.$message({
		      message: tips,
		      type: "success",
		      duration: 1500,
		      onClose: () => {
			this.getDataList();
		      }
		    });
		      this.showFlag = true;
		      this.huowurukuCrossAddOrUpdateFlag = false;
			return;
		  }
		}
	}
      this.$nextTick(() => {
      this.$refs.huowurukuCrossaddOrUpdate.init(row.id,type);
      });
    },
    huowuchukuCrossAddOrUpdateHandler(row,type,crossOptAudit,statusColumnName,tips,statusColumnValue){
      this.showFlag = false;
      this.addOrUpdateFlag = false;
      this.huowuchukuCrossAddOrUpdateFlag = true;
      this.$storage.set('crossObj',row);
      this.$storage.set('crossTable','huowuxinxi');
      this.$storage.set('statusColumnName',statusColumnName);
      this.$storage.set('statusColumnValue',statusColumnValue);
      this.$storage.set('tips',tips);
	if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
		var obj = this.$storage.getObj('crossObj');
		for (var o in obj){
		  if(o==statusColumnName && obj[o]==statusColumnValue){
		    this.$message({
		      message: tips,
		      type: "success",
		      duration: 1500,
		      onClose: () => {
			this.getDataList();
		      }
		    });
		      this.showFlag = true;
		      this.huowuchukuCrossAddOrUpdateFlag = false;
			return;
		  }
		}
	}
      this.$nextTick(() => {
      this.$refs.huowuchukuCrossaddOrUpdate.init(row.id,type);
      });
    },
    chartDialog() {
      this.chartVisiable = !this.chartVisiable;
      this.$nextTick(()=>{
        // huowumingcheng huowumingcheng
        //  shuliang
        // xcolumn ycolumn huowumingcheng shuliang
        var shuliangChart = this.$echarts.init(document.getElementById("shuliangChart"),'macarons');
        this.$http({
            url: `huowuxinxi/value/huowumingcheng/shuliang`,
            method: "get"
        }).then(({ data }) => {
            if (data && data.code === 0) {
                let res = data.data;
                let xAxis = [];
                let yAxis = [];
                let pArray = []
                for(let i=0;i<res.length;i++){
                    xAxis.push(res[i].huowumingcheng);
                    yAxis.push(parseFloat((res[i].total)).toFixed(2));
                    pArray.push({
                    value: parseFloat((res[i].total)),
                    name: res[i].huowumingcheng
                    })
                    var option = {};
                    option = {
                        tooltip: {
                          trigger: 'item',
                          formatter: '{b} : {c}'
                        },
                        title: {
                            text: '货物信息',
                            left: 'center'
                        },
                        xAxis: {
                            type: 'category',
                            data: xAxis
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [{
                            data: yAxis,
                            type: 'bar'
                        }]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    shuliangChart.setOption(option);
                    //根据窗口的大小变动图表
                    window.onresize = function() {
                        shuliangChart.resize();
                    };
                }
            }
        });
      })
    },
    init () {
          this.$http({
            url: `option/cangkuxinxi/cangkumingcheng`,
            method: "get"
          }).then(({ data }) => {
            if (data && data.code === 0) {
              this.cangkuOptions = data.data;
            } else {
              this.$message.error(data.msg);
            }
          });
          let urlshuliang = 'huowuxinxi/remind/shuliang/1';
		urlshuliang+=`?remindend=10`,
		
            	urlshuliang+=`&remindstart=0`,

          this.$http({
            url: urlshuliang,
            method: "get",
          }).then(({ data }) => {
            if (data && data.code == 0 && data.count>0 ) {
              this.$alert(`数量有${data.count}条记录到达预警`)
            }
          });
    },
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },

    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
      }
          if(this.searchForm.huowumingcheng!='' && this.searchForm.huowumingcheng!=undefined){
            params['huowumingcheng'] = '%' + this.searchForm.huowumingcheng + '%'
          }
          if(this.searchForm.huowuleixing!='' && this.searchForm.huowuleixing!=undefined){
            params['huowuleixing'] = '%' + this.searchForm.huowuleixing + '%'
          }
          if(this.searchForm.cangku!='' && this.searchForm.cangku!=undefined){
            params['cangku'] = '%' + this.searchForm.cangku + '%'
          }
      this.$http({
        url: "huowuxinxi/page",
        method: "get",
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list;
          this.totalPage = data.data.total;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
        this.dataListLoading = false;
      });
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 添加/修改
    addOrUpdateHandler(id,type) {
      this.showFlag = false;
      this.addOrUpdateFlag = true;
      this.crossAddOrUpdateFlag = false;
      if(type!='info'){
        type = 'else';
      }
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id,type);
      });
    },
    // 查看评论
    // 下载
    download(file){
      window.open(`${file}`)
    },
    // 删除
    deleteHandler(id) {
      var ids = id
        ? [Number(id)]
        : this.dataListSelections.map(item => {
            return Number(item.id);
          });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "huowuxinxi/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.search();
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },


  }

};
</script>
<style lang="scss" scoped>
//导出excel
  .export-excel-wrapper{
    display: inline-block;
  }
  .slt {
    margin: 0 !important;
    display: flex;
  }

  .ad {
    margin: 0 !important;
    display: flex;
  }

  .pages {
    & /deep/ el-pagination__sizes{
      & /deep/ el-input__inner {
        height: 22px;
        line-height: 22px;
      }
    }
  }
  

  .el-button+.el-button {
    margin:0;
  } 

  .tables {
	& /deep/ .el-button--success {
		height: 40px;
		color: rgba(45, 98, 137, 1);
		font-size: 14px;
		border-width: 5px;
		border-style: solid;
		border-color: rgba(45, 98, 137, 1);
		border-radius: 40px;
		background-color: #fff;
	}
	
	& /deep/ .el-button--primary {
		height: 40px;
		color: rgba(45, 98, 137, 1);
		font-size: 14px;
		border-width: 5px;
		border-style: solid;
		border-color: rgba(45, 98, 137, 1);
		border-radius: 40px;
		background-color: #fff;
	}
	
	& /deep/ .el-button--danger {
		height: 40px;
		color: rgba(45, 98, 137, 1);
		font-size: 14px;
		border-width: 5px;
		border-style: solid;
		border-color: rgba(45, 98, 137, 1);
		border-radius: 40px;
		background-color: #fff;
	}

    & /deep/ .el-button {
      margin: 4px;
    }
  }
	.form-content {
		background: transparent;
	}
	.table-content {
		background: transparent;
	}
	
	.tables /deep/ .el-table__body tr {
				background-color: rgba(255, 255, 255, 1) !important;
				color: #606266 !important;
	 }
	.tables /deep/ .el-table__body tr.el-table__row--striped td {
	    background: transparent;
	}
	.tables /deep/ .el-table__body tr.el-table__row--striped {
		background-color: #F5F7FA !important;
		color: #606266 !important;
	}
	
	 .tables /deep/ .el-table__body tr:hover>td {
	   	   background-color: #f5f5f5 !important;
	   	   	   color: #333 !important;
	   	 }
	 
</style>
