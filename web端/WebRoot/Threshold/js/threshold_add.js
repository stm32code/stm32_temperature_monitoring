$(function () {
	$("#threshold_upperLimit").validatebox({
		required : true,
		validType : "number",
		missingMessage : '请输入阀值上限',
		invalidMessage : '阀值上限输入不对',
	});

	$("#threshold_lowerLimit").validatebox({
		required : true,
		validType : "number",
		missingMessage : '请输入阀值下限',
		invalidMessage : '阀值下限输入不对',
	});

	$("#threshold_addTime").datetimebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	//单击添加按钮
	$("#thresholdAddButton").click(function () {
		//验证表单 
		if(!$("#thresholdAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#thresholdAddForm").form({
			    url:"Threshold/add",
			    onSubmit: function(){
					if($("#thresholdAddForm").form("validate"))  { 
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
                        $("#thresholdAddForm").form("clear");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#thresholdAddForm").submit();
		}
	});

	//单击清空按钮
	$("#thresholdClearButton").click(function () { 
		$("#thresholdAddForm").form("clear"); 
	});
});
