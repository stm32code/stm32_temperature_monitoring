<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/temperature.css" />
<div id="temperatureAddDiv">
	<form id="temperatureAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">温度值:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="temperature_temperatureValue" name="temperature.temperatureValue" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">记录时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="temperature_temperatureTime" name="temperature.temperatureTime" />

			</span>

		</div>
		<div class="operation">
			<a id="temperatureAddButton" class="easyui-linkbutton">添加</a>
			<a id="temperatureClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/Temperature/js/temperature_add.js"></script> 
