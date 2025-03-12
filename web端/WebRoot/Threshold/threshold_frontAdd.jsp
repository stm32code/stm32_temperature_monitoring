<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>阀值添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<div class="col-md-12 wow fadeInUp" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li role="presentation" ><a href="<%=basePath %>Threshold/frontlist">阀值列表</a></li>
			    	<li role="presentation" class="active"><a href="#thresholdAdd" aria-controls="thresholdAdd" role="tab" data-toggle="tab">添加阀值</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" class="tab-pane" id="thresholdList">
				    </div>
				    <div role="tabpanel" class="tab-pane active" id="thresholdAdd"> 
				      	<form class="form-horizontal" name="thresholdAddForm" id="thresholdAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
						  <div class="form-group">
						  	 <label for="threshold_upperLimit" class="col-md-2 text-right">阀值上限:</label>
						  	 <div class="col-md-8">
							    <input type="text" id="threshold_upperLimit" name="threshold.upperLimit" class="form-control" placeholder="请输入阀值上限">
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="threshold_lowerLimit" class="col-md-2 text-right">阀值下限:</label>
						  	 <div class="col-md-8">
							    <input type="text" id="threshold_lowerLimit" name="threshold.lowerLimit" class="form-control" placeholder="请输入阀值下限">
							 </div>
						  </div>
						  <div class="form-group">
						  	 <label for="threshold_addTimeDiv" class="col-md-2 text-right">生成时间:</label>
						  	 <div class="col-md-8">
				                <div id="threshold_addTimeDiv" class="input-group date threshold_addTime col-md-12" data-link-field="threshold_addTime">
				                    <input class="form-control" id="threshold_addTime" name="threshold.addTime" size="16" type="text" value="" placeholder="请选择生成时间" readonly>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				                </div>
						  	 </div>
						  </div>
				          <div class="form-group">
				             <span class="col-md-2""></span>
				             <span onclick="ajaxThresholdAdd();" class="btn btn-primary bottom5 top5">添加</span>
				          </div>
						</form> 
				        <style>#thresholdAddForm .form-group {margin:10px;}  </style>
					</div>
				</div>
			</div>
		</div>
	</div> 
</div>

<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script>
var basePath = "<%=basePath%>";
	//提交添加阀值信息
	function ajaxThresholdAdd() { 
		//提交之前先验证表单
		$("#thresholdAddForm").data('bootstrapValidator').validate();
		if(!$("#thresholdAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Threshold/add",
			dataType : "json" , 
			data: new FormData($("#thresholdAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#thresholdAddForm").find("input").val("");
					$("#thresholdAddForm").find("textarea").val("");
				} else {
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
	//验证阀值添加表单字段
	$('#thresholdAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"threshold.upperLimit": {
				validators: {
					notEmpty: {
						message: "阀值上限不能为空",
					},
					numeric: {
						message: "阀值上限不正确"
					}
				}
			},
			"threshold.lowerLimit": {
				validators: {
					notEmpty: {
						message: "阀值下限不能为空",
					},
					numeric: {
						message: "阀值下限不正确"
					}
				}
			},
			"threshold.addTime": {
				validators: {
					notEmpty: {
						message: "生成时间不能为空",
					}
				}
			},
		}
	}); 
	//生成时间组件
	$('#threshold_addTimeDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd hh:ii:ss',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#thresholdAddForm').data('bootstrapValidator').updateStatus('threshold.addTime', 'NOT_VALIDATED',null).validateField('threshold.addTime');
	});
})
</script>
</body>
</html>
