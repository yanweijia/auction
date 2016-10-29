package com.auction.beans;

/**
 * 
 * @author weijia
 * @func 拍品详细信息封装
 * @since 2016/10/28 00:06:22
 */
public class AuctionInfo {
	/**拍品ID编号 */
	private Integer auction_id;
	/**拍品名称 */
	private String auction_name;
	/**起拍价 */
	private Double starting_price;
	/**保留价,0代表无保留价 */
	private Double reserve_price;
	/**访问次数 */
	private Integer viewed;
	/**拍品图片 */
	private String img_url;
	/**拍品描述 */
	private String description;
	/**加价幅度,默认为1元, */
	private Double markup;
	/**发布日期时间 */
	private String post_date;
	/**拍卖日期 */
	private String auction_calendar;
	/**拍品状态 */
	private String auction_status;
	/**联系方式是否保密,默认不保密false */
	private Boolean isContactSecrecy;
	/**物主姓名 */
	private String owner_name;
	/**联系手机 */
	private String contact_phone;
	
	/**
	 * 构造方法
	 * @param auction_id 拍品ID编号
	 * @param auction_name 拍品名称
	 * @param starting_price 起拍价
	 * @param reserve_price 保留价,0代表无保留价
	 * @param viewed 访问次数
	 * @param img_url 拍品图片
	 * @param description 拍品描述
	 * @param markup 加价幅度,默认为1元,
	 * @param post_date 发布日期时间
	 * @param auction_calendar 拍卖日期
	 * @param auction_status 拍品状态
	 * @param isContactSecrecy 联系方式是否保密,默认不保密false
	 * @param owner_name 物主姓名
	 * @param contact_phone 联系手机
	 */
	public AuctionInfo(Integer auction_id,
						String auction_name,
						Double starting_price,
						Double reserve_price,
						Integer viewed,
						String img_url,
						String description,
						Double markup,
						String post_date,
						String auction_calendar,
						String auction_status,
						Boolean isContactSecrecy,
						String owner_name,
						String contact_phone) {
		this.auction_id = auction_id;
		this.auction_name = auction_name;
		this.starting_price = starting_price;
		this.reserve_price = reserve_price;
		this.viewed = viewed;
		this.img_url = img_url;
		this.description = description;
		this.markup = markup;
		this.post_date = post_date;
		this.auction_calendar = auction_calendar;
		this.auction_status = auction_status;
		this.isContactSecrecy = isContactSecrecy;
		this.owner_name = owner_name;
		this.contact_phone = contact_phone;
	}

	public AuctionInfo() {
		this(0,"神秘拍品",0.00,0.00,0,"favorite.ico","没有描述~",0.00,"****/**/** **:**:**","****/**/** **:**:**","待拍卖",false,"神秘百宝","神秘电话");
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

	public Double getStarting_price() {
		return starting_price;
	}

	public void setStarting_price(Double starting_price) {
		this.starting_price = starting_price;
	}

	public Double getReserve_price() {
		return reserve_price;
	}

	public void setReserve_price(Double reserve_price) {
		this.reserve_price = reserve_price;
	}

	public Integer getViewed() {
		return viewed;
	}

	public void setViewed(Integer viewed) {
		this.viewed = viewed;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getMarkup() {
		return markup;
	}

	public void setMarkup(Double markup) {
		this.markup = markup;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getAuction_calendar() {
		return auction_calendar;
	}

	public void setAuction_calendar(String auction_calendar) {
		this.auction_calendar = auction_calendar;
	}

	public String getAuction_status() {
		return auction_status;
	}

	public void setAuction_status(String auction_status) {
		this.auction_status = auction_status;
	}

	public Boolean getIsContactSecrecy() {
		return isContactSecrecy;
	}

	public void setIsContactSecrecy(Boolean isContactSecrecy) {
		this.isContactSecrecy = isContactSecrecy;
	}

	public String getOwner_name() {
		return owner_name;
	}

	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}

	public String getContact_phone() {
		return contact_phone;
	}

	public void setContact_phone(String contact_phone) {
		this.contact_phone = contact_phone;
	}
	
	
}
