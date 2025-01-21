package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.CangkugonggaoEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.CangkugonggaoVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.CangkugonggaoView;


/**
 * 仓库公告
 *
 * @author 
 * @email 
 * @date 2022-02-19 15:44:29
 */
public interface CangkugonggaoService extends IService<CangkugonggaoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<CangkugonggaoVO> selectListVO(Wrapper<CangkugonggaoEntity> wrapper);
   	
   	CangkugonggaoVO selectVO(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
   	
   	List<CangkugonggaoView> selectListView(Wrapper<CangkugonggaoEntity> wrapper);
   	
   	CangkugonggaoView selectView(@Param("ew") Wrapper<CangkugonggaoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<CangkugonggaoEntity> wrapper);
   	

}

