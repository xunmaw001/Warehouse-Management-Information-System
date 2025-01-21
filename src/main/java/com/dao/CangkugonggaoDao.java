package com.dao;

import com.entity.CangkugonggaoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.CangkugonggaoVO;
import com.entity.view.CangkugonggaoView;


/**
 * 仓库公告
 * 
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
public interface CangkugonggaoDao extends BaseMapper<CangkugonggaoEntity> {
	
	List<CangkugonggaoVO> selectListVO(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
	
	CangkugonggaoVO selectVO(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
	
	List<CangkugonggaoView> selectListView(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);

	List<CangkugonggaoView> selectListView(Pagination page,@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
	
	CangkugonggaoView selectView(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
	

}
