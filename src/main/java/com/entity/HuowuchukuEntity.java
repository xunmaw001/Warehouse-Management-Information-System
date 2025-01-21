package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 货物出库
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
@TableName("huowuchuku")
public class HuowuchukuEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public HuowuchukuEntity() {
		
	}
	
	public HuowuchukuEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 出库编号
	 */
					
	private String chukubianhao;
	
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
	 * 客户
	 */
					
	private String kehu;
	
	/**
	 * 出库日期
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	@DateTimeFormat 		
	private Date chukuriqi;
	
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
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：出库编号
	 */
	public void setChukubianhao(String chukubianhao) {
		this.chukubianhao = chukubianhao;
	}
	/**
	 * 获取：出库编号
	 */
	public String getChukubianhao() {
		return chukubianhao;
	}
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
	 * 设置：客户
	 */
	public void setKehu(String kehu) {
		this.kehu = kehu;
	}
	/**
	 * 获取：客户
	 */
	public String getKehu() {
		return kehu;
	}
	/**
	 * 设置：出库日期
	 */
	public void setChukuriqi(Date chukuriqi) {
		this.chukuriqi = chukuriqi;
	}
	/**
	 * 获取：出库日期
	 */
	public Date getChukuriqi() {
		return chukuriqi;
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
