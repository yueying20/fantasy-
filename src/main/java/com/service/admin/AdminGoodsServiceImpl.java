package com.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminGoodsDao;
import com.po.Goods;
import com.util.MyUtil;
@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService{
	@Autowired
	private AdminGoodsDao adminGoodsDao;
	/**
	 *添加与修改
	 */
	@Override
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct) {
		//上传文件位置
		//workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\
		
		String newFileName = "";
		String fileName = goods.getLogoImage().getOriginalFilename(); 
		//选择文件
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("logos");
			//实现文件的上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			newFileName = MyUtil.getStringID() + fileType;
			goods.setGpicture(newFileName);
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  //如果文件不存在就创建一个
	            targetFile.mkdirs();  
	        } 
			//上传
	        try {   
	        	goods.getLogoImage().transferTo(targetFile);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		//修改
		if("update".equals(updateAct)){
	       if(adminGoodsDao.updateGoodsById(goods) > 0){
	        	return "forward:/adx`minGoods/selectGoods?act=updateSelect";
	        }else{
	        	return "/adminGoods/updateAgoods";
	       }
		}else{
			if(adminGoodsDao.addGoods(goods) > 0){

				return "forward:/adminGoods/selectGoods";
			}else{
				return "card/addCard";
			}
		}
	}
	/**
	 * 查询商品
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act) {
		List<Goods> allGoods = adminGoodsDao.selectGoods();
		int temp = allGoods.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);
		map.put("perPageSize", 10);//每页10个
		allGoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//删除查询
		if("deleteSelect".equals(act)){
			return "admin/deleteSelectGoods";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "admin/updateSelectGoods";
		}else{
			return "admin/selectGoods";
		}
	}
	/**
	 * 查询一个商品
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = adminGoodsDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
	  //跳转修改的页面
		if("updateAgoods".equals(act)){
			return "admin/updateAgoods";
		}

		return "admin/goodsDetail";
	}
	

	@Override
	public String deleteAGoods(Integer id, Model model) {
		//商品关联
		if(adminGoodsDao.selectCartGoods(id).size() > 0 ||				
				adminGoodsDao.selectOrderdetailGoods(id).size() > 0) {
			model.addAttribute("msg", "商品关联,不能删除!");
			return "forward:/adminGoods/selectGoods?act=deleteSelect";
		}
		adminGoodsDao.deleteAGoods(id);
		model.addAttribute("msg", "成功删除商品");
		return "forward:/adminGoods/selectGoods?act=deleteSelect";
	}
}
