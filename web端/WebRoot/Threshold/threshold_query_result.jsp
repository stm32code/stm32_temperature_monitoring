<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/threshold.css" /> 

<div id="threshold_manage"></div>
<div id="threshold_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="threshold_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="threshold_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="threshold_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="threshold_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="threshold_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="thresholdQueryForm" method="post">
			生成时间：<input type="text" id="addTime" name="addTime" class="easyui-datebox" editable="false" style="width:100px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="threshold_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="thresholdEditDiv">
	<form id="thresholdEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">记录id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_thresholdId_edit" name="threshold.thresholdId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">阀值上限:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_upperLimit_edit" name="threshold.upperLimit" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">阀值下限:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_lowerLimit_edit" name="threshold.lowerLimit" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">生成时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_addTime_edit" name="threshold.addTime" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="Threshold/js/threshold_manage.js"></script> 
