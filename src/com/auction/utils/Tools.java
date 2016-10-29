package com.auction.utils;

import java.text.SimpleDateFormat;

public class Tools {
	/**
	 * 获取系统当前时间,精确到毫秒数
	 * 
	 * @return 格式为:yyyyMMddHHmmssSSS 如 201609221530555
	 */
	public static String getTime() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		java.util.Date date = new java.util.Date();
		return simpleDateFormat.format(date);
	}
}
