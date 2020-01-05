package com.util;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import com.po.Buser;
public class MyUtil {
	/**
	 *  日期格式化
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sd=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		id=sd.format(date);
		return id;
	}
	/**
	 * 用户ID
	 */
	public static Integer getUserId(HttpSession session) {
		Buser ruser = (Buser)session.getAttribute("bruser");
		return ruser.getId();
	}
}
