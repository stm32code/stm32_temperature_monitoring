<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Threshold" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Threshold threshold = (Threshold)request.getAttribute("threshold");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改阀值信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">阀值信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="thresholdEditForm" id="thresholdEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="threshold_thresholdId_edit" class="col-md-3 text-right">记录id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="threshold_thresholdId_edit" name="threshold.thresholdId" class="form-control" placeholder="请输入记录id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="threshold_upperLimit_edit" class="col-md-3 text-right">阀值上限:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="threshold_upperLimit_edit" name="threshold.upperLimit" class="form-control" placeholder="请输入阀值上限">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="threshold_lowerLimit_edit" class="col-md-3 text-right">阀值下限:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="threshold_lowerLimit_edit" name="threshold.lowerLimit" class="form-control" placeholder="请输入阀值下限">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="threshold_addTime_edit" class="col-md-3 text-right">生成时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date threshold_addTime_edit col-md-12" data-link-field="threshold_addTime_edit">
                    <input class="form-control" id="threshold_addTime_edit" name="threshold.addTime" size="16" type="text" value="" placeholder="请选择生成时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxThresholdModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#thresholdEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*弹出修改阀值界面并初始化数据*/
function thresholdEdit(thresholdId) {
	$.ajax({
		url :  basePath + "Threshold/" + thresholdId + "/update",
		type : "get",
		dataType: "json",
		success : function (threshold, response, status) {
			if (threshold) {
				$("#threshold_thresholdId_edit").val(threshold.thresholdId);
				$("#threshold_upperLimit_edit").val(threshold.upperLimit);
				$("#threshold_lowerLimit_edit").val(threshold.lowerLimit);
				$("#threshold_addTime_edit").val(threshold.addTime);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交阀值信息表单给服务器端修改*/
function ajaxThresholdModify() {
	$.ajax({
		url :  basePath + "Threshold/" + $("#threshold_thresholdId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#thresholdEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#thresholdQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse > a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
    /*生成时间组件*/
    $('.threshold_addTime_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd hh:ii:ss',
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    thresholdEdit("<%=request.getParameter("thresholdId")%>");
 })
 </script> 
</body>
</html>

