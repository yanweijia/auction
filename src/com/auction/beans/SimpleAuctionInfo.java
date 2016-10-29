package com.auction.beans;

/**
 * 
 * @author weijia
 * @func 拍品粗略信息封装
 * @since 2016/10/28 00:20:00
 */
public class SimpleAuctionInfo {
	/** 拍品编号 */
	private Integer auction_id;
	/** 拍品名称 */
	private String auction_name;
	/** 拍品图片 */
	private String img_url;
	/** 起拍价 */
	private Double starting_price;
	/** 拍品状态 */
	private String auction_status;
	/** 拍品访问次数 */
	private Integer viewed;
	
	/**
	 * 构造方法
	 * @param auction_id 拍品编号
	 * @param auction_name 拍品名称
	 * @param img_url 拍品图片url
	 * @param starting_price 起拍价
	 * @param auction_status 拍品状态
	 * @param viewed 浏览数
	 */
	public SimpleAuctionInfo(Integer auction_id,
							String auction_name,
							String img_url,
							Double starting_price,
							String auction_status,
							Integer viewed){
		this.auction_id = auction_id;
		this.auction_name = auction_name;
		this.img_url = img_url;
		this.starting_price = starting_price;
		this.auction_status = auction_status;
		this.viewed = viewed;
	}

	public Integer getAuction_id() {
		return auction_id;
	}

	public void setAuction_id(Integer auction_id) {
		this.auction_id = auction_id;
	}

	public String getAuction_name() {
		return auction_name;
	}

	public void setAuction_name(String auction_name) {
		this.auction_name = auction_name;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public Double getStarting_price() {
		return starting_price;
	}

	public void setStarting_price(Double starting_price) {
		this.starting_price = starting_price;
	}

	public String getAuction_status() {
		return auction_status;
	}

	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}

	public Integer getViewed() {
		return viewed;
	}

	public void setViewed(Integer viewed) {
		this.viewed = viewed;
	}
	
}
