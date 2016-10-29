<%@ page language="java" import="java.util.*,com.auction.utils.*,com.auction.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    
    <title>拍品提交</title>
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
		<p style='font-size:25px;text-align:center;line-height:50px;'>拍品提交
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




	<div style='background-color:#FFFFFF;align:center; border:2px dashed #4682B4  ; font-family:微软雅黑'>
		<br/>
		<form target='_blank' method='post' action='uploadServlet' enctype='multipart/form-data'>
			<table style='width:100%;height:110px;background-color:#FFFFFF'>
				<tr align="center"  height=35 >
					<td>拍品名称 </td>
					<td><input name='auction_name' type='text'  placeholder='输入拍品名称'></td>
				</tr>
				
				<tr align="center"  height=35 >
					<td>起 拍 价 </td>
					<td><input type='text' name='starting_price' placeholder='0则为无底价起拍'></td>
				</tr>

				<tr align="center"  height=35 >
					<td>保 留 价</td>
					<td><input type='text' name='reserve_price' value='0'></td>
				</tr>

				<tr align="center"  height=35 >
					<td>加价幅度 </td>
					<td><input type='text' name='markup' value='1' placeholder='最少为1'></td>
				</tr>

				<tr align="center"  height=35 >
					<td>姓　　名 </td>
					<td><input type='text' name='owner_name' placeholder='输入真实姓名,方便联系'></td>
				</tr>
				
				<tr align="center"  height=35 >
					<td>联系手机</td>
					<td><input type='text' name='contact_phone' placeholder='手机号码'></td>
				</tr>
				<tr align="center"  height=35 >
					<td>管理密码</td>
					<td><input type='password' name='password' min='6' max='16' placeholder='通过管理密码可删除拍品'></td>
				</tr>
				<tr align="center"  height=35 >
					<td>联系方式可见</td>
					<td><input type='checkbox' id='isContactSecrecy' name='isContactSecrecy'/></td>
				</tr>
				
				<tr align="center"  height=35 >
					<td>拍品介绍</td>
					<td><textarea rows=4 cols=22 name='description' type='text'></textarea></td>
				</tr>
				<tr align="center"  height=35 >
					<td>图片上传</td>
					<td><input type='file' name='img'/></td>
				</tr>												
				<tr align="center" height=35 >
					<td colspan="2"> <button type="submit">提　交</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div style='height:5px'></div>

	
	
	<!--底部版权信息,靠底显示-->
	<div>
		<p style='font-size:15px;text-align:center'><a href='aboutus.html'>关于我们</a> | 项目Github地址:<a href='http://github.com/yanweijia/auction'>auction项目</a></p>
		<p style='font-size:15px;text-align:center'>备案号:<a href='http://www.miitbeian.gov.cn/'>晋ICP备15001548号-1</a>
		<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_5036016'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D5036016%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		</p>
	</div>
	
</body>
</html>
