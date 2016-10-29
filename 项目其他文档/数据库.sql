--�������ݿ�
CREATE DATABASE auction DEFAULT CHARACTER SET utf8;

--ʹ�ô��������ݿ�
USE auction;

--������Ʒ��(�˴������Ǽ�Ԫ��,�����ǹ�������)
/*
--��ƷID���
--��Ʒ����
--���ļ�
--������,0�����ޱ�����
--���ʴ���
--��ƷͼƬ
--��Ʒ����
--�Ӽ۷���,Ĭ��Ϊ1Ԫ,
--��������ʱ��
--��������
--��Ʒ״̬
--��ϵ��ʽ�Ƿ���,Ĭ�ϲ�����false
--��������
--��ϵ�ֻ�
--�Ӽ۷�������Ϊ1Ԫ
*/

CREATE TABLE auction(
	auction_id INT UNSIGNED NOT NULL  AUTO_INCREMENT PRIMARY KEY,	
	auction_name VARCHAR(50) NOT NULL,
	starting_price DOUBLE NOT NULL,						
	reserve_price DOUBLE NOT NULL DEFAULT 0,			
	viewed INT UNSIGNED NOT NULL DEFAULT 0,				
	img_url VARCHAR(1024) NOT NULL DEFAULT 'http://yanweijia.cn:8080/auction/favorite.ico',
	description VARCHAR(2048) NOT NULL DEFAULT '��������',	
	markup	DOUBLE UNSIGNED NOT NULL DEFAULT 1,			
	post_date DATETIME NOT NULL,						
	auction_calendar DATETIME NOT NULL DEFAULT '2016/11/28 17:30:00',	
	auction_status ENUM('������','������','����') NOT NULL DEFAULT '������',	
	isContactSecrecy BOOLEAN NOT NULL DEFAULT FALSE,			
	owner_name VARCHAR(10) NOT NULL DEFAULT '������',	
	contact_phone VARCHAR(11) NOT NULL DEFAULT '13700000000', 
	password VARCHAR(30) NOT NULL,
	CHECK(markup >= 1.0)								
)AUTO_INCREMENT=1 default charset=utf8;

--�����������
INSERT INTO auction(auction_name,starting_price,reserve_price,img_url,description,markup,password,post_date,isContactSecrecy,owner_name,contact_phone)
VALUES
('һ���ɰ�����Ʒͼ��',20,20,'favorite.ico','������Ʒ�ļ򵥽���,�������Ʒ����,\n���к��������!',2,'mima',NOW(),FALSE,'��Ψ��','18621703545');



--��ȡ��Ҫ��Ϣ
SELECT auction_id,auction_name,img_url,starting_price,auction_status,viewed FROM auction;

--��ѯ��Ʒ��Ϣ
SELECT * FROM auction WHERE auction_id=1;







