package com.entity.view;

import com.entity.CangkugonggaoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 仓库公告
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
@TableName("cangkugonggao")
public class CangkugonggaoView  extends CangkugonggaoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public CangkugonggaoView(){
	}
 
 	public CangkugonggaoView(CangkugonggaoEntity cangkugonggaoEntity){
 	try {
			BeanUtils.copyProperties(this, cangkugonggaoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
