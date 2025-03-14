<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Temperature" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Temperature> temperatureList = (List<Temperature>)request.getAttribute("temperatureList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String temperatureTime = (String)request.getAttribute("temperatureTime"); //记录时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>温度查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="row"> 
		<div class="col-md-9 wow fadeInDown" data-wow-duration="0.5s">
			<div>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
			    	<li><a href="<%=basePath %>index.jsp">首页</a></li>
			    	<li role="presentation" class="active"><a href="#temperatureListPanel" aria-controls="temperatureListPanel" role="tab" data-toggle="tab">温度列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>Temperature/temperature_frontAdd.jsp" style="display:none;">添加温度</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="temperatureListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold"><td>序号</td><td>记录d</td><td>温度值</td><td>记录时间</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i=0;i<temperatureList.size();i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		Temperature temperature = temperatureList.get(i); //获取到温度对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=temperature.getTemperatureId() %></td>
 											<td><%=temperature.getTemperatureValue() %></td>
 											<td><%=temperature.getTemperatureTime() %></td>
 											<td>
 												<a href="<%=basePath  %>Temperature/<%=temperature.getTemperatureId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="temperatureEdit('<%=temperature.getTemperatureId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="temperatureDelete('<%=temperature.getTemperatureId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
 											</td> 
 										</tr>
 										<%}%>
				    				</table>
				    				</div>
				    			</div>
				    		</div>

				    		<div class="row">
					            <div class="col-md-12">
						            <nav class="pull-left">
						                <ul class="pagination">
						                    <li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
						                     <%
						                    	int startPage = currentPage - 5;
						                    	int endPage = currentPage + 5;
						                    	if(startPage < 1) startPage=1;
						                    	if(endPage > totalPage) endPage = totalPage;
						                    	for(int i=startPage;i<=endPage;i++) {
						                    %>
						                    <li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
						                    <%  } %> 
						                    <li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						                </ul>
						            </nav>
						            <div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
					            </div>
				            </div> 
				    </div>
				</div>
			</div>
		</div>
	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>温度查询</h1>
		</div>
		<form name="temperatureQueryForm" id="temperatureQueryForm" action="<%=basePath %>Temperature/frontlist" class="mar_t15" method="post">
			<div class="form-group">
				<label for="temperatureTime">记录时间:</label>
				<input type="text" id="temperatureTime" name="temperatureTime" class="form-control"  placeholder="请选择记录时间" value="<%=temperatureTime %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
	</div> 
<div id="temperatureEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;温度信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
      	<form class="form-horizontal" name="temperatureEditForm" id="temperatureEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="temperature_temperatureId_edit" class="col-md-3 text-right">记录d:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="temperature_temperatureId_edit" name="temperature.temperatureId" class="form-control" placeholder="请输入记录d" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="temperature_temperatureValue_edit" class="col-md-3 text-right">温度值:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="temperature_temperatureValue_edit" name="temperature.temperatureValue" class="form-control" placeholder="请输入温度值">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="temperature_temperatureTime_edit" class="col-md-3 text-right">记录时间:</label>
		  	 <div class="col-md-9">
                <div class="input-group date temperature_temperatureTime_edit col-md-12" data-link-field="temperature_temperatureTime_edit">
                    <input class="form-control" id="temperature_temperatureTime_edit" name="temperature.temperatureTime" size="16" type="text" value="" placeholder="请选择记录时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		</form> 
	    <style>#temperatureEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxTemperatureModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.temperatureQueryForm.currentPage.value = currentPage;
    document.temperatureQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.temperatureQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.temperatureQueryForm.currentPage.value = pageValue;
    documenttemperatureQueryForm.submit();
}

/*弹出修改温度界面并初始化数据*/
function temperatureEdit(temperatureId) {
	$.ajax({
		url :  basePath + "Temperature/" + temperatureId + "/update",
		type : "get",
		dataType: "json",
		success : function (temperature, response, status) {
			if (temperature) {
				$("#temperature_temperatureId_edit").val(temperature.temperatureId);
				$("#temperature_temperatureValue_edit").val(temperature.temperatureValue);
				$("#temperature_temperatureTime_edit").val(temperature.temperatureTime);
				$('#temperatureEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除温度信息*/
function temperatureDelete(temperatureId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Temperature/deletes",
			data : {
				temperatureIds : temperatureId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#temperatureQueryForm").submit();
					//location.href= basePath + "Temperature/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
}

/*ajax方式提交温度信息表单给服务器端修改*/
function ajaxTemperatureModify() {
	$.ajax({
		url :  basePath + "Temperature/" + $("#temperature_temperatureId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#temperatureEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                $("#temperatureQueryForm").submit();
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

    /*记录时间组件*/
    $('.temperature_temperatureTime_edit').datetimepicker({
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
})
</script>
</body>
</html>

