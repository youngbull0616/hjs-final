(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c04a81d4"],{"09f4":function(t,e,a){"use strict";a.d(e,"a",(function(){return s})),Math.easeInOutQuad=function(t,e,a,n){return t/=n/2,t<1?a/2*t*t+e:(t--,-a/2*(t*(t-2)-1)+e)};var n=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(t){window.setTimeout(t,1e3/60)}}();function r(t){document.documentElement.scrollTop=t,document.body.parentNode.scrollTop=t,document.body.scrollTop=t}function i(){return document.documentElement.scrollTop||document.body.parentNode.scrollTop||document.body.scrollTop}function s(t,e,a){var s=i(),o=t-s,u=20,l=0;e="undefined"===typeof e?500:e;var c=function t(){l+=u;var i=Math.easeInOutQuad(l,s,o,e);r(i),l<e?n(t):a&&"function"===typeof a&&a()};c()}},"129f":function(t,e,a){"use strict";t.exports=Object.is||function(t,e){return t===e?0!==t||1/t===1/e:t!==t&&e!==e}},"333d":function(t,e,a){"use strict";var n=function(){var t=this,e=t._self._c;return e("div",{staticClass:"pagination-container",class:{hidden:t.hidden}},[e("el-pagination",t._b({attrs:{background:t.background,"current-page":t.currentPage,"page-size":t.pageSize,layout:t.layout,"page-sizes":t.pageSizes,total:t.total},on:{"update:currentPage":function(e){t.currentPage=e},"update:current-page":function(e){t.currentPage=e},"update:pageSize":function(e){t.pageSize=e},"update:page-size":function(e){t.pageSize=e},"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange}},"el-pagination",t.$attrs,!1))],1)},r=[],i=(a("a9e3"),a("09f4")),s={name:"Pagination",props:{total:{required:!0,type:Number},page:{type:Number,default:1},limit:{type:Number,default:10},pageSizes:{type:Array,default:function(){return[5,10,20,30,50]}},layout:{type:String,default:"prev, pager, next"},background:{type:Boolean,default:!0},autoScroll:{type:Boolean,default:!0},hidden:{type:Boolean,default:!1}},computed:{currentPage:{get:function(){return this.page},set:function(t){this.$emit("update:page",t)}},pageSize:{get:function(){return this.limit},set:function(t){this.$emit("update:limit",t)}}},methods:{handleSizeChange:function(t){this.$emit("pagination",{page:this.currentPage,limit:t}),this.autoScroll&&Object(i["a"])(0,800)},handleCurrentChange:function(t){this.$emit("pagination",{page:t,limit:this.pageSize}),this.autoScroll&&Object(i["a"])(0,800)}}},o=s,u=(a("def2"),a("2877")),l=Object(u["a"])(o,n,r,!1,null,"52c39d8a",null);e["a"]=l.exports},"841c":function(t,e,a){"use strict";var n=a("c65b"),r=a("d784"),i=a("825a"),s=a("7234"),o=a("1d80"),u=a("129f"),l=a("577e"),c=a("dc4a"),p=a("14c3");r("search",(function(t,e,a){return[function(e){var a=o(this),r=s(e)?void 0:c(e,t);return r?n(r,e,a):new RegExp(e)[t](l(a))},function(t){var n=i(this),r=l(t),s=a(e,n,r);if(s.done)return s.value;var o=n.lastIndex;u(o,0)||(n.lastIndex=0);var c=p(n,r);return u(n.lastIndex,o)||(n.lastIndex=o),null===c?-1:c.index}]}))},caae:function(t,e,a){"use strict";a.r(e);a("ac1f"),a("841c");var n=function(){var t=this,e=t._self._c;return e("div",{staticClass:"app-contain",staticStyle:{"margin-top":"10px"}},[e("el-row",{attrs:{gutter:50}},[e("el-col",{attrs:{span:18}},[e("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.listLoading,expression:"listLoading"}],staticStyle:{width:"100%"},attrs:{data:t.tableData,fit:"","highlight-current-row":""},on:{"row-click":t.itemSelect}},[e("el-table-column",{attrs:{prop:"id",label:"序号",width:"90px"}}),e("el-table-column",{attrs:{prop:"paperName",label:"名称"}}),e("el-table-column",{attrs:{prop:"subjectName",label:"学科",width:"70"}}),e("el-table-column",{attrs:{label:"状态",prop:"status",width:"100px"},scopedSlots:t._u([{key:"default",fn:function(a){var n=a.row;return[e("el-tag",{attrs:{type:t.statusTagFormatter(n.status)}},[t._v(" "+t._s(t.statusTextFormatter(n.status))+" ")])]}}])}),e("el-table-column",{attrs:{prop:"createTime",label:"做题时间",width:"170"}}),e("el-table-column",{attrs:{align:"right",width:"70"},scopedSlots:t._u([{key:"default",fn:function(a){var n=a.row;return[1===n.status?e("router-link",{attrs:{target:"_blank",to:{path:"/edit",query:{id:n.id}}}},[e("el-button",{attrs:{type:"text",size:"small"}},[t._v("批改")])],1):t._e(),2===n.status?e("router-link",{attrs:{target:"_blank",to:{path:"/read",query:{id:n.id}}}},[e("el-button",{attrs:{type:"text",size:"small"}},[t._v("查看试卷")])],1):t._e()]}}])})],1),e("pagination",{directives:[{name:"show",rawName:"v-show",value:t.total>0,expression:"total>0"}],staticStyle:{"margin-top":"20px"},attrs:{total:t.total,background:!1,page:t.queryParam.pageIndex,limit:t.queryParam.pageSize},on:{"update:page":function(e){return t.$set(t.queryParam,"pageIndex",e)},"update:limit":function(e){return t.$set(t.queryParam,"pageSize",e)},pagination:t.search}})],1),e("el-col",{attrs:{span:6}},[e("el-card",{staticClass:"record-answer-info"},[e("el-form",{attrs:{"label-width":"50%"}},[e("el-form-item",{attrs:{label:"系统判分："}},[e("span",[t._v(t._s(t.selectItem.systemScore))])]),e("el-form-item",{attrs:{label:"最终得分："}},[e("span",[t._v(t._s(t.selectItem.userScore))])]),e("el-form-item",{attrs:{label:"试卷总分："}},[e("span",[t._v(t._s(t.selectItem.paperScore))])]),e("el-form-item",{attrs:{label:"正确题数："}},[e("span",[t._v(t._s(t.selectItem.questionCorrect))])]),e("el-form-item",{attrs:{label:"总题数："}},[e("span",[t._v(t._s(t.selectItem.questionCount))])]),e("el-form-item",{attrs:{label:"用时："}},[e("span",[t._v(t._s(t.selectItem.doTime))])])],1)],1)],1)],1)],1)},r=[],i=a("5530"),s=a("2f62"),o=a("333d"),u=a("ed24"),l=a("09f4"),c={components:{Pagination:o["a"]},data:function(){return{queryParam:{pageIndex:1,pageSize:10},listLoading:!1,tableData:[],total:0,selectItem:{systemScore:"0",userScore:"0",doTime:"0",paperScore:"0",questionCorrect:0,questionCount:0}}},created:function(){this.search(),Object(l["a"])(0,800)},methods:{search:function(){this.listLoading=!0;var t=this;u["a"].pageList(this.queryParam).then((function(e){var a=e.response;t.tableData=a.list,t.total=a.total,t.queryParam.pageIndex=a.pageNum,t.listLoading=!1}))},itemSelect:function(t,e,a){this.selectItem=t},statusTagFormatter:function(t){return this.enumFormat(this.statusTag,t)},statusTextFormatter:function(t){return this.enumFormat(this.statusEnum,t)}},computed:Object(i["a"])(Object(i["a"])({},Object(s["c"])("enumItem",["enumFormat"])),Object(s["e"])("enumItem",{statusEnum:function(t){return t.exam.examPaperAnswer.statusEnum},statusTag:function(t){return t.exam.examPaperAnswer.statusTag}}))},p=c,d=a("2877"),m=Object(d["a"])(p,n,r,!1,null,"51913c06",null);e["default"]=m.exports},def2:function(t,e,a){"use strict";a("efc6")},ed24:function(t,e,a){"use strict";var n=a("b775");e["a"]={pageList:function(t){return Object(n["a"])("/api/student/exampaper/answer/pageList",t)},answerSubmit:function(t){return Object(n["a"])("/api/student/exampaper/answer/answerSubmit",t)},read:function(t){return Object(n["a"])("/api/student/exampaper/answer/read/"+t)},edit:function(t){return Object(n["a"])("/api/student/exampaper/answer/edit",t)}}},efc6:function(t,e,a){}}]);