$(function () {
	$.ajax({
		url : "Temperature/" + $("#temperature_temperatureId_edit").val() + "/update",
		type : "get",
		data : {
			//temperatureId : $("#temperature_temperatureId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (temperature, response, status) {
			$.messager.progress("close");
			if (temperature) { 
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
				$(".messager-window").css("z-index",10000);
			}
		}
	});

	$("#temperatureModifyButton").click(function(){ 
		if ($("#temperatureEditForm").form("validate")) {
			$("#temperatureEditForm").form({
			    url:"Temperature/" +  $("#temperature_temperatureId_edit").val() + "/update",
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
			$("#temperatureEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
