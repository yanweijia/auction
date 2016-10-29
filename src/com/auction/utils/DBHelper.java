package com.auction.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.auction.beans.AuctionInfo;
import com.auction.beans.SimpleAuctionInfo;


/**
 * 
 * @author weijia
 * @说明   该类采用静态代码段实现,无需实例化即可使用(因本项目基本不涉及多终端用户同时访问,也无用户登录和session,故只共享一个数据库线程节省资源.
 */
public class DBHelper {
	static String driver = "com.mysql.jdbc.Driver"; // 数据库驱动
	// 连接数据库的URL地址
	static String url = "jdbc:mysql://localhost:3306/auction?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true";
	static String username = DBInfo.user;// 数据库用户名	敏感信息,未将本文件放在Git上,请自行新建DBInfo.java文件
	static String password = DBInfo.password;// 数据库的密码
	static Connection conn = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	
	
	/**
	 * 静态代码段,加载驱动
	 */
	static{
		try {
			Class.forName(driver);		//加载驱动
			if (conn == null) {			//判断有无连接
				conn = DriverManager.getConnection(url, username, password);			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取/刷新Connection连接
	 * @throws SQLException
	 */
	public static void getConnection() throws SQLException{
		if (conn == null || conn.isClosed())			//判断有无连接
			conn = DriverManager.getConnection(url, username, password);
	}
	
	/**
	 * 删除指定书籍
	 * @param auction_id
	 * @param password
	 */
	public static boolean deleteAuction(Integer auction_id,String password){
		String sql = "DELETE FROM auction WHERE auction_id=" + auction_id + " AND password='" + password + "'";
		try {
			getConnection();
			stmt = conn.createStatement();
			int count = stmt.executeUpdate(sql);
			if(count>0)	//受影响的行数大于0,删除成功!
				return true;
			else
				return false;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 搜过匹配的结果
	 * @param searchKey 搜索关键词
	 * @return 搜索结果的List封装
	 */
	public static List<SimpleAuctionInfo> getSearchResult(String searchKey){
		List<SimpleAuctionInfo> list = new ArrayList<SimpleAuctionInfo>();
		String sql = "SELECT auction_id,auction_name,img_url,starting_price,auction_status,viewed FROM auction WHERE auction_name LIKE '%"+searchKey+"%' OR description LIKE '%" + searchKey + "%'";
		try {
			getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Integer auction_id = rs.getInt("auction_id");
				String auction_name = rs.getString("auction_name");
				String img_url = rs.getString("img_url");
				Double starting_price = rs.getDouble("starting_price");
				String auction_status = rs.getString("auction_status");
				Integer viewed = rs.getInt("viewed");
				SimpleAuctionInfo simpleAuctionInfo = new SimpleAuctionInfo(auction_id,auction_name,img_url,starting_price,auction_status,viewed);
				list.add(simpleAuctionInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	/**
	 * 发布一个新拍品
	 * @param auction_name 拍品名称
	 * @param starting_price 起拍价
	 * @param reserve_price 保留价
	 * @param markup 加价幅度
	 * @param owner_name 委托人姓名
	 * @param contact_phone 委托人电话
	 * @param password 拍品管理密码
	 * @param isContactSecrecy 联系方式是否保密
	 * @param description 拍品描述
	 * @return
	 */
	public static boolean postAuction(String auction_name,
										Double starting_price,
										Double reserve_price,
										String img_url,
										Double markup,
										String owner_name,
										String contact_phone,
										String password,
										Boolean isContactSecrecy,
										String description){
		String sql = "INSERT INTO auction(auction_name,starting_price,reserve_price,img_url,description,markup,password,post_date,isContactSecrecy,owner_name,contact_phone)"+
					"VALUES"+
					"('" + auction_name + "'," + starting_price + "," + reserve_price + ",'" + img_url + "','" + description + 
					"'," + markup + ",'" + password + "',NOW()," + isContactSecrecy + ",'" + owner_name + "','" + contact_phone + "')";
		try {
			getConnection();
			stmt = conn.createStatement();
			int count = stmt.executeUpdate(sql);
			if(count>0)	//受影响的行数大于0,则插入成功
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 获取指定拍品详细信息
	 * @param auction_id 拍品编号
	 * @return 拍品详细信息
	 */
	public static AuctionInfo getAuctionInfo(String auction_id){
		//将被浏览数+1
		String sql = "UPDATE auction SET viewed=viewed+1 WHERE auction_id="+auction_id;
		try {
			getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);	//将被浏览数+1
			//获取拍品详细信息
			sql = "SELECT * FROM auction WHERE auction_id="+auction_id;
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				String auction_name = rs.getString("auction_name");
				Double starting_price = rs.getDouble("starting_price");
				Double reserve_price = rs.getDouble("reserve_price");
				Integer viewed = rs.getInt("viewed");
				String img_url = rs.getString("img_url");
				String description = rs.getString("description");
				Double markup = rs.getDouble("markup");
				String post_date = rs.getString("post_date");
				String auction_calendar = rs.getString("auction_calendar");
				String auction_status = rs.getString("auction_status");
				Boolean isContactSecrecy = rs.getBoolean("isContactSecrecy");
				String owner_name = rs.getString("owner_name");
				String contact_phone = rs.getString("contact_phone");
				AuctionInfo auctionInfo = new AuctionInfo(Integer.parseInt(auction_id),auction_name,starting_price,
														reserve_price,viewed,img_url,description,
														markup,post_date,auction_calendar,auction_status,
														isContactSecrecy,owner_name,contact_phone);
				return auctionInfo;
			}else{
				return new AuctionInfo();	//如果查询无结果,返回空信息
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return new AuctionInfo();	//如果查询失败,返回空信息
		}
	}
	
	
	/**
	 * 获取所有拍品摘要信息
	 * @return
	 */
	public static List<SimpleAuctionInfo> getSimpleAuctionInfo(){
		List<SimpleAuctionInfo> list = new ArrayList<SimpleAuctionInfo>();
		String sql = "SELECT auction_id,auction_name,img_url,starting_price,auction_status,viewed FROM auction;";
		try {
			getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Integer auction_id = rs.getInt("auction_id");
				String auction_name = rs.getString("auction_name");
				String img_url = rs.getString("img_url");
				Double starting_price = rs.getDouble("starting_price");
				String auction_status = rs.getString("auction_status");
				Integer viewed = rs.getInt("viewed");
				SimpleAuctionInfo simpleAuctionInfo = new SimpleAuctionInfo(auction_id,auction_name,img_url,starting_price,auction_status,viewed);
				list.add(simpleAuctionInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
