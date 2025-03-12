package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Threshold;

public interface ThresholdMapper {
	/*添加阀值信息*/
	public void addThreshold(Threshold threshold) throws Exception;

	/*按照查询条件分页查询阀值记录*/
	public ArrayList<Threshold> queryThreshold(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有阀值记录*/
	public ArrayList<Threshold> queryThresholdList(@Param("where") String where) throws Exception;

	/*按照查询条件的阀值记录数*/
	public int queryThresholdCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条阀值记录*/
	public Threshold getThreshold(int thresholdId) throws Exception;

	/*更新阀值记录*/
	public void updateThreshold(Threshold threshold) throws Exception;

	/*删除阀值记录*/
	public void deleteThreshold(int thresholdId) throws Exception;

}
