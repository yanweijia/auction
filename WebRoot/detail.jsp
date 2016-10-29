<%@ page language="java" import="java.util.*,com.auction.utils.*,com.auction.beans.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//TODO:从这里就开始获取详细信息,之后直接用赋值表达式就可以赋值
	String auction_id = request.getParameter("auction_id");
	AuctionInfo auctionInfo;
	if(auction_id==null){
		auctionInfo = new AuctionInfo();	//如果参数未传递,显示默认信息
	}else{
		auctionInfo = DBHelper.getAuctionInfo(auction_id);
	}
	String auction_name = auctionInfo.getAuction_name();
	Double starting_price = auctionInfo.getStarting_price();
	Double reserve_price = auctionInfo.getReserve_price();
	Integer viewed = auctionInfo.getViewed();
	String img_url = auctionInfo.getImg_url();
	String description = auctionInfo.getDescription();
	Double markup = auctionInfo.getMarkup();
	String post_date = auctionInfo.getPost_date();
	String auction_calendar = auctionInfo.getAuction_calendar();
	String auction_status = auctionInfo.getAuction_status();
	Boolean isContactSecrecy = auctionInfo.getIsContactSecrecy();
	String owner_name = auctionInfo.getOwner_name();
	String contact_phone = auctionInfo.getContact_phone();
	
	if(isContactSecrecy){	//是否保密
		contact_phone="保密";
		owner_name="保密";
	}
	
	description = description.replaceAll("\n", "<br/>");	//将换行匹配成html的换行
	
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    
    <title><%=auction_name %></title><!-- 拍品名字作为标题 -->
    <link rel='icon' href='favorite.ico ' type=‘image/x-ico’ /> 
	<meta name='viewport' content='width=device-width, initial-scale=1.0' />
    <meta http-equiv=Content-Type content='text/html;charset=UTF-8'> 
	<style  type="text/css">
			body{background:LightCyan;}
			
			a:link { 
			color: #003300; 
			text-decoration: none; 
			} 
			a:visited { 
			color: #000000; 
			text-decoration: none; 
			} 
			a:hover { 
			color: #999999; 
			text-decoration: underline; 
			}
	</style>
</head>
<body>

	<table style='width:100%;background:#EEEEEE;table-layout:fixed;'>
		<tr>
			<td style='width:40%;'><img src="pending.png" style='align:center;width:100%'/></td>
			<td style='width:60%;'><span style='font-size:1em;text-align:left;'><b>11月28日 17:30开拍</b></span></td>
		</tr>
	</table>
	<!-- 规则等介绍 -->
	<table style='width:100% ; background-color:#E6E6FA ; font-family:微软雅黑;'>
		<tr style='height:30px;'>
			<td  style='width:25%;text-align:center;' ><a href='rules.html'>拍卖规则</a></td>
			<td  style='width:25%;text-align:center;'><a href='upload.jsp'>拍品提交</a></td>
			<td  style='width:25%;text-align:center;'><a href='search.jsp'>拍品搜索</a></td>
			<td  style='width:25%;text-align:center;'><a href='aboutus.html'>主办方介绍</a></td>
		</tr>
	</table>
		
	<table style='width:100%;align:center;font-family:微软雅黑;'>
		<tr>
			<td colspan=2>
				<img src='<%=img_url %>' style='width:100%;' /><!-- 拍品URL图片 -->
			</td>
		</tr>
		<tr>
			<td style='width:50%'><strong>拍品名称:</strong><br/><%=auction_name %></td><!-- 拍品名称 -->
			<td style='width:50%'><strong>浏览量:</strong><%=viewed %></td><!-- 浏览量 -->
		</tr>
		<tr>
			<td style='width:50%'><strong>起拍价:</strong><%=starting_price %></td><!-- 起拍价 -->
			<td style='width:50%'><strong>加价幅度:</strong><%=markup %></td><!-- 加价幅度 -->
		</tr>
		<tr>
			<td style='width:50%'><strong>保留价:</strong><%=(reserve_price==0.00?"无":reserve_price) %></td><!-- 保留价 -->
			<td style='width:50%'><strong>发布日期:</strong><time><%=post_date %></time></td><!-- 发布日期 -->
		</tr>
		<tr>
			<td colspan=2 style='width:100%'><strong>物品发布者:</strong><%=owner_name %></td><!-- 发布者姓名 -->
		</tr>
		<tr>
			<td colspan=2 style='width:100%'><strong>联系手机:</strong><%=contact_phone %></td><!-- 联系手机 -->
		</tr>
		<tr>
			<td colspan=2 style='width:100%'><strong>拍品介绍:</strong><br/>　　<%=description %></td><!-- 拍品介绍 -->
		</tr>
		<tr>
			<td colspan=2 style='width:100%'><strong>拍卖规则:</strong><a href='rules.html'>点击转到规则介绍页</a></td>
		</tr>
		
	</table>
	<p style='text-align:center;'><a href='deleteAuction.jsp?auction_id=<%=auction_id%>'><button>删除该拍品</button></a></p>
	<p style='text-align:center;font-size:2em'><a href='index.jsp'>返回主页</a></p>
	<div>
		<p align=center style='font-size:15px'><a href='aboutus.html'>关于我们</a> | 项目github地址:<a href='http://github.com/yanweijia/auction'>auction项目</a></p>
		<p align=center style='font-size:15px'>备案号:<a href='http://www.miitbeian.gov.cn/'>晋ICP备15001548-1号</a>
		<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_5036016'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D5036016%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</p>
	</div>

</body>

</html>
