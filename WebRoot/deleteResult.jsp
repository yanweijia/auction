<%@ page language="java" import="java.util.*,com.auction.utils.*,com.auction.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String auction_id = request.getParameter("auction_id");
String password = request.getParameter("password");
boolean isSuccess = false;
if(auction_id==null || password==null)
	isSuccess = false;
else{
	isSuccess = DBHelper.deleteAuction(Integer.parseInt(auction_id), password);
}
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>删除拍品</title>
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
		<p style='font-size:25px;text-align:center;line-height:50px;'>删除拍品
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

	<%
		if(isSuccess){
	 %>
		<div style='background-color:#FFFFFF;align:center; border:2px dashed #4682B4  ; font-family:微软雅黑'>
			<br/>删除成功!<br/>
		</div>
	<%
		}else{
	 %>

	<div style='background-color:#FFFFFF;align:center; border:2px dashed #4682B4  ; font-family:微软雅黑'>
		<br/>删除失败,请确认输入输入密码是否正确!<br/>
	</div>
	<div style='height:5px'></div>

	<%} %>
	
	<!--底部版权信息,靠底显示-->
	<div>
		<p style='font-size:15px;text-align:center'><a href='aboutus.html'>关于我们</a> | 项目Github地址:<a href='http://github.com/yanweijia/auction'>auction项目</a></p>
		<p style='font-size:15px;text-align:center'>备案号:<a href='http://www.miitbeian.gov.cn/'>晋ICP备15001548号-1</a>
		<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_5036016'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D5036016%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</p>
	</div>
	
</body>
</html>
