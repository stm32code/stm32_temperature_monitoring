package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.Threshold;

import com.chengxusheji.mapper.ThresholdMapper;
@Service
public class ThresholdService {

	@Resource ThresholdMapper thresholdMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加阀值记录*/
    public void addThreshold(Threshold threshold) throws Exception {
    	thresholdMapper.addThreshold(threshold);
    }

    /*按照查询条件分页查询阀值记录*/
    public ArrayList<Threshold> queryThreshold(String addTime,int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(!addTime.equals("")) where = where + " and t_threshold.addTime like '%" + addTime + "%'";
    	int startIndex = (currentPage-1) * this.rows;
    	return thresholdMapper.queryThreshold(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<Threshold> queryThreshold(String addTime) throws Exception  { 
     	String where = "where 1=1";
    	if(!addTime.equals("")) where = where + " and t_threshold.addTime like '%" + addTime + "%'";
    	return thresholdMapper.queryThresholdList(where);
    }

    /*查询所有阀值记录*/
    public ArrayList<Threshold> queryAllThreshold()  throws Exception {
        return thresholdMapper.queryThresholdList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(String addTime) throws Exception {
     	String where = "where 1=1";
    	if(!addTime.equals("")) where = where + " and t_threshold.addTime like '%" + addTime + "%'";
        recordNumber = thresholdMapper.queryThresholdCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取阀值记录*/
    public Threshold getThreshold(int thresholdId) throws Exception  {
        Threshold threshold = thresholdMapper.getThreshold(thresholdId);
        return threshold;
    }

    /*更新阀值记录*/
    public void updateThreshold(Threshold threshold) throws Exception {
        thresholdMapper.updateThreshold(threshold);
    }

    /*删除一条阀值记录*/
    public void deleteThreshold (int thresholdId) throws Exception {
        thresholdMapper.deleteThreshold(thresholdId);
    }

    /*删除多条阀值信息*/
    public int deleteThresholds (String thresholdIds) throws Exception {
    	String _thresholdIds[] = thresholdIds.split(",");
    	for(String _thresholdId: _thresholdIds) {
    		thresholdMapper.deleteThreshold(Integer.parseInt(_thresholdId));
    	}
    	return _thresholdIds.length;
    }
}
