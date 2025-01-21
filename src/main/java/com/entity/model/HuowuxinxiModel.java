package com.entity.model;

import com.entity.HuowuxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 货物信息
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
public class HuowuxinxiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 货物名称
	 */
	
	private String huowumingcheng;
		
	/**
	 * 货物类型
	 */
	
	private String huowuleixing;
		
	/**
	 * 货物规格
	 */
	
	private String huowuguige;
		
	/**
	 * 图片
	 */
	
	private String tupian;
		
	/**
	 * 数量
	 */
	
	private Integer shuliang;
		
	/**
	 * 仓库
	 */
	
	private String cangku;
		
	/**
	 * 生产日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date shengchanriqi;
		
	/**
	 * 货物详情
	 */
	
	private String huowuxiangqing;
		
	/**
	 * 最近点击时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date clicktime;
		
	/**
	 * 点击次数
	 */
	
	private Integer clicknum;
				
	
	/**
	 * 设置：货物名称
	 */
	 
	public void setHuowumingcheng(String huowumingcheng) {
		this.huowumingcheng = huowumingcheng;
	}
	
	/**
	 * 获取：货物名称
	 */
	public String getHuowumingcheng() {
		return huowumingcheng;
	}
				
	
	/**
	 * 设置：货物类型
	 */
	 
	public void setHuowuleixing(String huowuleixing) {
		this.huowuleixing = huowuleixing;
	}
	
	/**
	 * 获取：货物类型
	 */
	public String getHuowuleixing() {
		return huowuleixing;
	}
				
	
	/**
	 * 设置：货物规格
	 */
	 
	public void setHuowuguige(String huowuguige) {
		this.huowuguige = huowuguige;
	}
	
	/**
	 * 获取：货物规格
	 */
	public String getHuowuguige() {
		return huowuguige;
	}
				
	
	/**
	 * 设置：图片
	 */
	 
	public void setTupian(String tupian) {
		this.tupian = tupian;
	}
	
	/**
	 * 获取：图片
	 */
	public String getTupian() {
		return tupian;
	}
				
	
	/**
	 * 设置：数量
	 */
	 
	public void setShuliang(Integer shuliang) {
		this.shuliang = shuliang;
	}
	
	/**
	 * 获取：数量
	 */
	public Integer getShuliang() {
		return shuliang;
	}
				
	
	/**
	 * 设置：仓库
	 */
	 
	public void setCangku(String cangku) {
		this.cangku = cangku;
	}
	
	/**
	 * 获取：仓库
	 */
	public String getCangku() {
		return cangku;
	}
				
	
	/**
	 * 设置：生产日期
	 */
	 
	public void setShengchanriqi(Date shengchanriqi) {
		this.shengchanriqi = shengchanriqi;
	}
	
	/**
	 * 获取：生产日期
	 */
	public Date getShengchanriqi() {
		return shengchanriqi;
	}
				
	
	/**
	 * 设置：货物详情
	 */
	 
	public void setHuowuxiangqing(String huowuxiangqing) {
		this.huowuxiangqing = huowuxiangqing;
	}
	
	/**
	 * 获取：货物详情
	 */
	public String getHuowuxiangqing() {
		return huowuxiangqing;
	}
				
	
	/**
	 * 设置：最近点击时间
	 */
	 
	public void setClicktime(Date clicktime) {
		this.clicktime = clicktime;
	}
	
	/**
	 * 获取：最近点击时间
	 */
	public Date getClicktime() {
		return clicktime;
	}
				
	
	/**
	 * 设置：点击次数
	 */
	 
	public void setClicknum(Integer clicknum) {
		this.clicknum = clicknum;
	}
	
	/**
	 * 获取：点击次数
	 */
	public Integer getClicknum() {
		return clicknum;
	}
			
}
