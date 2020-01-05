package com.service.before;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.dao.OrderDao;
import com.po.Order;
import com.util.MyUtil;
@Service("orderService")
@Transactional
/**
 *Srping事务管理 连续的事务处理
 * 下单
 */
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	@Override
	public String orderSubmit(Model model, HttpSession session, Double amount) {
		Order order = new Order();
		order.setAmount(amount);
		order.setBusertable_id(MyUtil.getUserId(session));
		//生成订单,并将主键返回order
		orderDao.addOrder(order);
		//生成订单详情
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ordersn", order.getId());
		map.put("uid", MyUtil.getUserId(session));
		orderDao.addOrderDetail(map);
		//更新商品库存1.查询商品量,
		List<Map<String, Object>> list = orderDao.selectGoodsShop(MyUtil.getUserId(session));

		//更新商品库存2
		for (Map<String, Object> map2 : list) {
			orderDao.updateStore(map2);
		}
		model.addAttribute("ordersn", order.getId());
		
		return "before/orderdone";
	}
	@Override
	public String pay(Integer ordersn) {
		orderDao.pay(ordersn);
		return "before/paydone";
	}

}
