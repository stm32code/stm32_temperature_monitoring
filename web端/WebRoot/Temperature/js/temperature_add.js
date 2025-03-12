$(function () {
	$("#temperature_temperatureValue").validatebox({
		required : true,
		validType : "number",
		missingMessage : '请输入温度值',
		invalidMessage : '温度值输入不对',
	});

	$("#temperature_temperatureTime").datetimebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	//单击添加按钮
	$("#temperatureAddButton").click(function () {
		//验证表单 
		if(!$("#temperatureAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#temperatureAddForm").form({
			    url:"Temperature/add",
			    onSubmit: function(){
					if($("#temperatureAddForm").form("validate"))  { 
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
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#temperatureAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#temperatureAddForm").submit();
		}
	});

	//单击清空按钮
	$("#temperatureClearButton").click(function () { 
		$("#temperatureAddForm").form("clear"); 
	});
});
