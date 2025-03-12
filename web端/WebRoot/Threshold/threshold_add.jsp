<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/threshold.css" />
<div id="thresholdAddDiv">
	<form id="thresholdAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">阀值上限:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_upperLimit" name="threshold.upperLimit" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">阀值下限:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_lowerLimit" name="threshold.lowerLimit" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">生成时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="threshold_addTime" name="threshold.addTime" />

			</span>

		</div>
		<div class="operation">
			<a id="thresholdAddButton" class="easyui-linkbutton">添加</a>
			<a id="thresholdClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/Threshold/js/threshold_add.js"></script> 
