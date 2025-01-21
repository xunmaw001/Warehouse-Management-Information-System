package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.CangkugonggaoDao;
import com.entity.CangkugonggaoEntity;
import com.service.CangkugonggaoService;
import com.entity.vo.CangkugonggaoVO;
import com.entity.view.CangkugonggaoView;

@Service("cangkugonggaoService")
public class CangkugonggaoServiceImpl extends ServiceImpl<CangkugonggaoDao, CangkugonggaoEntity> implements CangkugonggaoService {
	

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CangkugonggaoEntity> page = this.selectPage(
                new Query<CangkugonggaoEntity>(params).getPage(),
                new EntityWrapper<CangkugonggaoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<CangkugonggaoEntity> wrapper) {
		  Page<CangkugonggaoView> page =new Query<CangkugonggaoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<CangkugonggaoVO> selectListVO(Wrapper<CangkugonggaoEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public CangkugonggaoVO selectVO(Wrapper<CangkugonggaoEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<CangkugonggaoView> selectListView(Wrapper<CangkugonggaoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public CangkugonggaoView selectView(Wrapper<CangkugonggaoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
