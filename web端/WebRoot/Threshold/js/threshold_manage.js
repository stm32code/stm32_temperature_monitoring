var threshold_manage_tool = null; 
$(function () { 
	initThresholdManageTool(); //建立Threshold管理对象
	threshold_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#threshold_manage").datagrid({
		url : 'Threshold/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "thresholdId",
		sortOrder : "desc",
		toolbar : "#threshold_manage_tool",
		columns : [[
			{
				field : "thresholdId",
				title : "记录id",
				width : 70,
			},
			{
				field : "upperLimit",
				title : "阀值上限",
				width : 70,
			},
			{
				field : "lowerLimit",
				title : "阀值下限",
				width : 70,
			},
			{
				field : "addTime",
				title : "生成时间",
				width : 140,
			},
		]],
	});

	$("#thresholdEditDiv").dialog({
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
				if ($("#thresholdEditForm").form("validate")) {
					//验证表单 
					if(!$("#thresholdEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#thresholdEditForm").form({
						    url:"Threshold/" + $("#threshold_thresholdId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#thresholdEditForm").form("validate"))  {
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
			                        $("#thresholdEditDiv").dialog("close");
			                        threshold_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#thresholdEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#thresholdEditDiv").dialog("close");
				$("#thresholdEditForm").form("reset"); 
			},
		}],
	});
});

function initThresholdManageTool() {
	threshold_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#threshold_manage").datagrid("reload");
		},
		redo : function () {
			$("#threshold_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#threshold_manage").datagrid("options").queryParams;
			queryParams["addTime"] = $("#addTime").datebox("getValue"); 
			$("#threshold_manage").datagrid("options").queryParams=queryParams; 
			$("#threshold_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#thresholdQueryForm").form({
			    url:"Threshold/OutToExcel",
			});
			//提交表单
			$("#thresholdQueryForm").submit();
		},
		remove : function () {
			var rows = $("#threshold_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var thresholdIds = [];
						for (var i = 0; i < rows.length; i ++) {
							thresholdIds.push(rows[i].thresholdId);
						}
						$.ajax({
							type : "POST",
							url : "Threshold/deletes",
							data : {
								thresholdIds : thresholdIds.join(","),
							},
							beforeSend : function () {
								$("#threshold_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#threshold_manage").datagrid("loaded");
									$("#threshold_manage").datagrid("load");
									$("#threshold_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#threshold_manage").datagrid("loaded");
									$("#threshold_manage").datagrid("load");
									$("#threshold_manage").datagrid("unselectAll");
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
			var rows = $("#threshold_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Threshold/" + rows[0].thresholdId +  "/update",
					type : "get",
					data : {
						//thresholdId : rows[0].thresholdId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (threshold, response, status) {
						$.messager.progress("close");
						if (threshold) { 
							$("#thresholdEditDiv").dialog("open");
							$("#threshold_thresholdId_edit").val(threshold.thresholdId);
							$("#threshold_thresholdId_edit").validatebox({
								required : true,
								missingMessage : "请输入记录id",
								editable: false
							});
							$("#threshold_upperLimit_edit").val(threshold.upperLimit);
							$("#threshold_upperLimit_edit").validatebox({
								required : true,
								validType : "number",
								missingMessage : "请输入阀值上限",
								invalidMessage : "阀值上限输入不对",
							});
							$("#threshold_lowerLimit_edit").val(threshold.lowerLimit);
							$("#threshold_lowerLimit_edit").validatebox({
								required : true,
								validType : "number",
								missingMessage : "请输入阀值下限",
								invalidMessage : "阀值下限输入不对",
							});
							$("#threshold_addTime_edit").datetimebox({
								value: threshold.addTime,
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
