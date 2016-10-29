<%@ page language="java" import="java.util.*,com.auction.utils.*,com.auction.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>神秘百宝拍卖会</title>
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
    <div style='background-color:#4682B4;width:100%;height:50px;color:#FFFFFF;font-family:微软雅黑 '>
		<p style='font-size:25px;text-align:center;line-height:50px;'>神秘百宝拍卖会
		</p>
	</div>
	<!-- 规则等介绍 -->
	<table style='width:100% ; background-color:#E6E6FA ; font-family:微软雅黑;'>
		<tr style='height:30px;'>
			<td  style='width:25%;text-align:center;' ><a href='rules.html'>拍卖规则</a></td>
			<td  style='width:25%;text-align:center;'><a href='upload.jsp'>拍品提交</a></td>
			<td  style='width:25%;text-align:center;'><a href='search.jsp'>拍品搜索</a></td>
			<td  style='width:25%;text-align:center;'><a href='aboutus.html'>主办方介绍</a></td>
		</tr>
	</table>
	<!-- 重复字段,显示拍品摘要信息 -->
	<% //这里写从数据库查询拍品信息的语句
		List<SimpleAuctionInfo> auctionList = DBHelper.getSimpleAuctionInfo();
		if(auctionList.size() == 0){
			System.out.println("拍品数量为0");
		
	%>
		<div style='background-color:#FFFFFF; border:2px dashed #4682B4  ; font-family:微软雅黑  '>
			<p>还没有任何拍品哦</p>
			<p><a href=''>我要第一个提交</a></p>
		</div>
	<%
		}else{
			for(int i = 0 ; i < auctionList.size() ; i++){
				SimpleAuctionInfo simpleAuctionInfo = auctionList.get(i);
				Integer auction_id = simpleAuctionInfo.getAuction_id();
				String auction_name = simpleAuctionInfo.getAuction_name();
				String img_url = simpleAuctionInfo.getImg_url();
				Double starting_price = simpleAuctionInfo.getStarting_price();
				String auction_status = simpleAuctionInfo.getAuction_status();
				Integer viewed = simpleAuctionInfo.getViewed();
	%>
	<div style='background-color:#FFFFFF; border:2px dashed #4682B4  ; font-family:微软雅黑  '>
		<table style='width:100%;height:110px;background-color:#FFFFFF'>
			<tr>
				<td rowspan='3' style='width:100px;height:100px;'>
					<img width='100px' height='100px' src='<%=img_url %>'/><!-- 拍品图片URL -->
				</td>
				<td><%=auction_name %></td><!-- 拍品名称 -->
			</tr>
			<tr>
				<td><p style='font-size:20px'>￥ <%=starting_price %> 元</p></td><!-- 拍品价格 -->
				<td style='text-align:right'>浏览量:<%=viewed %></td><!-- 拍品浏览次数 -->
			</tr>
			<tr>
				<td><%=auction_status %></td><!-- 拍卖状态 -->
				<td style='text-align:right'><a href='detail.jsp?auction_id=<%=auction_id %>' style='font-size:18px;'>拍品介绍</a></td><!-- 链接自动更新拍品ID -->
			</tr>
		</table>
	</div>
	<div style='height:5px'></div>
	<%
			}
		}
	 %>
	
	
	<!--底部版权信息,靠底显示-->
	<div>
		<p style='font-size:15px;text-align:center'><a href='aboutus.html'>关于我们</a> | 项目Github地址:<a href='http://github.com/yanweijia/auction'>auction项目</a></p>
		<p style='font-size:15px;text-align:center'>备案号:<a href='http://www.miitbeian.gov.cn/'>晋ICP备15001548号-1</a>
		<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_5036016'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D5036016%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</p>
	</div>
	
</body>
</html>
