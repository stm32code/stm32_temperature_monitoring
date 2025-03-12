package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Threshold {
    /*记录id*/
    private Integer thresholdId;
    public Integer getThresholdId(){
        return thresholdId;
    }
    public void setThresholdId(Integer thresholdId){
        this.thresholdId = thresholdId;
    }

    /*阀值上限*/
    @NotNull(message="必须输入阀值上限")
    private Float upperLimit;
    public Float getUpperLimit() {
        return upperLimit;
    }
    public void setUpperLimit(Float upperLimit) {
        this.upperLimit = upperLimit;
    }

    /*阀值下限*/
    @NotNull(message="必须输入阀值下限")
    private Float lowerLimit;
    public Float getLowerLimit() {
        return lowerLimit;
    }
    public void setLowerLimit(Float lowerLimit) {
        this.lowerLimit = lowerLimit;
    }

    /*生成时间*/
    @NotEmpty(message="生成时间不能为空")
    private String addTime;
    public String getAddTime() {
        return addTime;
    }
    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonThreshold=new JSONObject(); 
		jsonThreshold.accumulate("thresholdId", this.getThresholdId());
		jsonThreshold.accumulate("upperLimit", this.getUpperLimit());
		jsonThreshold.accumulate("lowerLimit", this.getLowerLimit());
		jsonThreshold.accumulate("addTime", this.getAddTime().length()>19?this.getAddTime().substring(0,19):this.getAddTime());
		return jsonThreshold;
    }}