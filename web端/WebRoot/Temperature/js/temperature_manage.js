var temperature_manage_tool = null; 
$(function () { 
	initTemperatureManageTool(); //建立Temperature管理对象
	temperature_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#temperature_manage").datagrid({
		url : 'Temperature/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "temperatureId",
		sortOrder : "desc",
		toolbar : "#temperature_manage_tool",
		columns : [[
			{
				field : "temperatureId",
				title : "记录d",
				width : 70,
			},
			{
				field : "temperatureValue",
				title : "温度值",
				width : 70,
			},
			{
				field : "temperatureTime",
				title : "记录时间",
				width : 140,
			},
		]],
	});

	$("#temperatureEditDiv").dialog({
		title : "修改管理",
		top: "50px",
		width : 700,
		height : 515,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#temperatureEditForm").form("validate")) {
					//验证表单 
					if(!$("#temperatureEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#temperatureEditForm").form({
						    url:"Temperature/" + $("#temperature_temperatureId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#temperatureEditForm").form("validate"))  {
				                	$.messager.progress({
										text : "正在提交数据中...",
									});
				                	return true;
				                } else { 
				                    return false; 
				                }
						    },
						    success:function(data){
						    	$.messager.progress("close");
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#temperatureEditDiv").dialog("close");
			                        temperature_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#temperatureEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#temperatureEditDiv").dialog("close");
				$("#temperatureEditForm").form("reset"); 
			},
		}],
	});
});

function initTemperatureManageTool() {
	temperature_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#temperature_manage").datagrid("reload");
		},
		redo : function () {
			$("#temperature_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#temperature_manage").datagrid("options").queryParams;
			queryParams["temperatureTime"] = $("#temperatureTime").datebox("getValue"); 
			$("#temperature_manage").datagrid("options").queryParams=queryParams; 
			$("#temperature_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#temperatureQueryForm").form({
			    url:"Temperature/OutToExcel",
			});
			//提交表单
			$("#temperatureQueryForm").submit();
		},
		remove : function () {
			var rows = $("#temperature_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var temperatureIds = [];
						for (var i = 0; i < rows.length; i ++) {
							temperatureIds.push(rows[i].temperatureId);
						}
						$.ajax({
							type : "POST",
							url : "Temperature/deletes",
							data : {
								temperatureIds : temperatureIds.join(","),
							},
							beforeSend : function () {
								$("#temperature_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#temperature_manage").datagrid("loaded");
									$("#temperature_manage").datagrid("load");
									$("#temperature_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#temperature_manage").datagrid("loaded");
									$("#temperature_manage").datagrid("load");
									$("#temperature_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function () {
			var rows = $("#temperature_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Temperature/" + rows[0].temperatureId +  "/update",
					type : "get",
					data : {
						//temperatureId : rows[0].temperatureId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (temperature, response, status) {
						$.messager.progress("close");
						if (temperature) { 
							$("#temperatureEditDiv").dialog("open");
							$("#temperature_temperatureId_edit").val(temperature.temperatureId);
							$("#temperature_temperatureId_edit").validatebox({
								required : true,
								missingMessage : "请输入记录d",
								editable: false
							});
							$("#temperature_temperatureValue_edit").val(temperature.temperatureValue);
							$("#temperature_temperatureValue_edit").validatebox({
								required : true,
								validType : "number",
								missingMessage : "请输入温度值",
								invalidMessage : "温度值输入不对",
							});
							$("#temperature_temperatureTime_edit").datetimebox({
								value: temperature.temperatureTime,
							    required: true,
							    showSeconds: true,
							});
						} else {
							$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
						}
					}
				});
			} else if (rows.length == 0) {
				$.messager.alert("警告操作！", "编辑记录至少选定一条数据！", "warning");
			}
		},
	};
}
