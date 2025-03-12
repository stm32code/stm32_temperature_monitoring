package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Temperature {
    /*记录d*/
    private Integer temperatureId;
    public Integer getTemperatureId(){
        return temperatureId;
    }
    public void setTemperatureId(Integer temperatureId){
        this.temperatureId = temperatureId;
    }

    /*温度值*/
    @NotNull(message="必须输入温度值")
    private Float temperatureValue;
    public Float getTemperatureValue() {
        return temperatureValue;
    }
    public void setTemperatureValue(Float temperatureValue) {
        this.temperatureValue = temperatureValue;
    }

    /*记录时间*/
    @NotEmpty(message="记录时间不能为空")
    private String temperatureTime;
    public String getTemperatureTime() {
        return temperatureTime;
    }
    public void setTemperatureTime(String temperatureTime) {
        this.temperatureTime = temperatureTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonTemperature=new JSONObject(); 
		jsonTemperature.accumulate("temperatureId", this.getTemperatureId());
		jsonTemperature.accumulate("temperatureValue", this.getTemperatureValue());
		jsonTemperature.accumulate("temperatureTime", this.getTemperatureTime().length()>19?this.getTemperatureTime().substring(0,19):this.getTemperatureTime());
		return jsonTemperature;
    }}