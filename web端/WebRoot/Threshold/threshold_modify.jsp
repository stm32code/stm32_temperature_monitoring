<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/threshold.css" />
<div id="threshold_editDiv">
	<form id="thresholdEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">记录id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_thresholdId_edit" name="threshold.thresholdId" value="<%=request.getParameter("thresholdId") %>" style="width:200px" />
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
		<div class="operation">
			<a id="thresholdModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Threshold/js/threshold_modify.js"></script> 
