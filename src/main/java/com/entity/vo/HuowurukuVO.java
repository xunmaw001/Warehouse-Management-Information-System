package com.entity.vo;

import com.entity.HuowurukuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 货物入库
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
public class HuowurukuVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 货物编号
	 */
	
	private String huowubianhao;
		
	/**
	 * 货物名称
	 */
	
	private String huowumingcheng;
		
	/**
	 * 数量
	 */
	
	private Integer shuliang;
		
	/**
	 * 供应商
	 */
	
	private String gongyingshang;
		
	/**
	 * 入库日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date rukuriqi;
		
	/**
	 * 备注
	 */
	
	private String beizhu;
		
	/**
	 * 账号
	 */
	
	private String zhanghao;
		
	/**
	 * 姓名
	 */
	
	private String xingming;
				
	
	/**
	 * 设置：货物编号
	 */
	 
	public void setHuowubianhao(String huowubianhao) {
		this.huowubianhao = huowubianhao;
	}
	
	/**
	 * 获取：货物编号
	 */
	public String getHuowubianhao() {
		return huowubianhao;
	}
				
	
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
	 * 设置：供应商
	 */
	 
	public void setGongyingshang(String gongyingshang) {
		this.gongyingshang = gongyingshang;
	}
	
	/**
	 * 获取：供应商
	 */
	public String getGongyingshang() {
		return gongyingshang;
	}
				
	
	/**
	 * 设置：入库日期
	 */
	 
	public void setRukuriqi(Date rukuriqi) {
		this.rukuriqi = rukuriqi;
	}
	
	/**
	 * 获取：入库日期
	 */
	public Date getRukuriqi() {
		return rukuriqi;
	}
				
	
	/**
	 * 设置：备注
	 */
	 
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
	/**
	 * 获取：备注
	 */
	public String getBeizhu() {
		return beizhu;
	}
				
	
	/**
	 * 设置：账号
	 */
	 
	public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
	}
	
	/**
	 * 获取：账号
	 */
	public String getZhanghao() {
		return zhanghao;
	}
				
	
	/**
	 * 设置：姓名
	 */
	 
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	
	/**
	 * 获取：姓名
	 */
	public String getXingming() {
		return xingming;
	}
			
}
