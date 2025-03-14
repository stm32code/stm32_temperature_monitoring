<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Threshold" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Threshold> thresholdList = (List<Threshold>)request.getAttribute("thresholdList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String addTime = (String)request.getAttribute("addTime"); //生成时间查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>阀值查询</title>
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
			    	<li role="presentation" class="active"><a href="#thresholdListPanel" aria-controls="thresholdListPanel" role="tab" data-toggle="tab">阀值列表</a></li>
			    	<li role="presentation" ><a href="<%=basePath %>Threshold/threshold_frontAdd.jsp" style="display:none;">添加阀值</a></li>
				</ul>
			  	<!-- Tab panes -->
			  	<div class="tab-content">
				    <div role="tabpanel" class="tab-pane active" id="thresholdListPanel">
				    		<div class="row">
				    			<div class="col-md-12 top5">
				    				<div class="table-responsive">
				    				<table class="table table-condensed table-hover">
				    					<tr class="success bold"><td>序号</td><td>记录id</td><td>阀值上限</td><td>阀值下限</td><td>生成时间</td><td>操作</td></tr>
				    					<% 
				    						/*计算起始序号*/
				    	            		int startIndex = (currentPage -1) * 5;
				    	            		/*遍历记录*/
				    	            		for(int i=0;i<thresholdList.size();i++) {
					    	            		int currentIndex = startIndex + i + 1; //当前记录的序号
					    	            		Threshold threshold = thresholdList.get(i); //获取到阀值对象
 										%>
 										<tr>
 											<td><%=currentIndex %></td>
 											<td><%=threshold.getThresholdId() %></td>
 											<td><%=threshold.getUpperLimit() %></td>
 											<td><%=threshold.getLowerLimit() %></td>
 											<td><%=threshold.getAddTime() %></td>
 											<td>
 												<a href="<%=basePath  %>Threshold/<%=threshold.getThresholdId() %>/frontshow"><i class="fa fa-info"></i>&nbsp;查看</a>&nbsp;
 												<a href="#" onclick="thresholdEdit('<%=threshold.getThresholdId() %>');" style="display:none;"><i class="fa fa-pencil fa-fw"></i>编辑</a>&nbsp;
 												<a href="#" onclick="thresholdDelete('<%=threshold.getThresholdId() %>');" style="display:none;"><i class="fa fa-trash-o fa-fw"></i>删除</a>
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
    		<h1>阀值查询</h1>
		</div>
		<form name="thresholdQueryForm" id="thresholdQueryForm" action="<%=basePath %>Threshold/frontlist" class="mar_t15" method="post">
			<div class="form-group">
				<label for="addTime">生成时间:</label>
				<input type="text" id="addTime" name="addTime" class="form-control"  placeholder="请选择生成时间" value="<%=addTime %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
	</div> 
<div id="thresholdEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;阀值信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
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
		</form> 
	    <style>#thresholdEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxThresholdModify();">提交</button>
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
    document.thresholdQueryForm.currentPage.value = currentPage;
    document.thresholdQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.thresholdQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.thresholdQueryForm.currentPage.value = pageValue;
    documentthresholdQueryForm.submit();
}

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
				$('#thresholdEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除阀值信息*/
function thresholdDelete(thresholdId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Threshold/deletes",
			data : {
				thresholdIds : thresholdId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#thresholdQueryForm").submit();
					//location.href= basePath + "Threshold/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
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
})
</script>
</body>
</html>

