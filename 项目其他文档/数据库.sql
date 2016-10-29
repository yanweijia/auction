--创建数据库
CREATE DATABASE auction DEFAULT CHARACTER SET utf8;

--使用创建的数据库
USE auction;

--创建拍品表(此处仅考虑简单元素,不考虑过多因素)
/*
--拍品ID编号
--拍品名称
--起拍价
--保留价,0代表无保留价
--访问次数
--拍品图片
--拍品描述
--加价幅度,默认为1元,
--发布日期时间
--拍卖日期
--拍品状态
--联系方式是否保密,默认不保密false
--物主姓名
--联系手机
--加价幅度最少为1元
*/

CREATE TABLE auction(
	auction_id INT UNSIGNED NOT NULL  AUTO_INCREMENT PRIMARY KEY,	
	auction_name VARCHAR(50) NOT NULL,
	starting_price DOUBLE NOT NULL,						
	reserve_price DOUBLE NOT NULL DEFAULT 0,			
	viewed INT UNSIGNED NOT NULL DEFAULT 0,				
	img_url VARCHAR(1024) NOT NULL DEFAULT 'http://yanweijia.cn:8080/auction/favorite.ico',
	description VARCHAR(2048) NOT NULL DEFAULT '暂无描述',	
	markup	DOUBLE UNSIGNED NOT NULL DEFAULT 1,			
	post_date DATETIME NOT NULL,						
	auction_calendar DATETIME NOT NULL DEFAULT '2016/11/28 17:30:00',	
	auction_status ENUM('待拍卖','已卖出','流拍') NOT NULL DEFAULT '待拍卖',	
	isContactSecrecy BOOLEAN NOT NULL DEFAULT FALSE,			
	owner_name VARCHAR(10) NOT NULL DEFAULT '神秘人',	
	contact_phone VARCHAR(11) NOT NULL DEFAULT '13700000000', 
	password VARCHAR(30) NOT NULL,
	CHECK(markup >= 1.0)								
)AUTO_INCREMENT=1 default charset=utf8;

--插入测试数据
INSERT INTO auction(auction_name,starting_price,reserve_price,img_url,description,markup,password,post_date,isContactSecrecy,owner_name,contact_phone)
VALUES
('一个可爱的拍品图标',20,20,'favorite.ico','这是商品的简单介绍,这就是商品介绍,\n换行后继续介绍!',2,'mima',NOW(),FALSE,'严唯嘉','18621703545');



--获取简要信息
SELECT auction_id,auction_name,img_url,starting_price,auction_status,viewed FROM auction;

--查询拍品信息
SELECT * FROM auction WHERE auction_id=1;







