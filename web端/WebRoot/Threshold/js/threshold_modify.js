$(function () {
	$.ajax({
		url : "Threshold/" + $("#threshold_thresholdId_edit").val() + "/update",
		type : "get",
		data : {
			//thresholdId : $("#threshold_thresholdId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (threshold, response, status) {
			$.messager.progress("close");
			if (threshold) { 
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
				$(".messager-window").css("z-index",10000);
			}
		}
	});

	$("#thresholdModifyButton").click(function(){ 
		if ($("#thresholdEditForm").form("validate")) {
			$("#thresholdEditForm").form({
			    url:"Threshold/" +  $("#threshold_thresholdId_edit").val() + "/update",
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
                	var obj = jQuery.parseJSON(data);
                    if(obj.success){
                        $.messager.alert("消息","信息修改成功！");
                        $(".messager-window").css("z-index",10000);
                        //location.href="frontlist";
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    } 
			    }
			});
			//提交表单
			$("#thresholdEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
