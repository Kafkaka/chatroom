<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>talk</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String msg=request.getParameter("msg"); //获取输入的字符串
	System.out.println("msg:"+msg);
	String user=(String)session.getAttribute("user");
	
	if(msg==null){
		if(user==null){
			out.println("请输入昵称");
		}
	}
	else{
		if(user==null){ //如果还未输入过信息登陆则以输入信息为用户名登陆
			user=msg;
			session.setAttribute("user",user);
			msg=(user+"进入了聊天室"+"<br/");
			System.out.println(user+"login!");
		}
		else{
			msg=user+":"+msg+"<br/>";//在当前用户说的话之后加这句话
			
		}
		String all=(String)application.getAttribute("all");
		if(all==null){//如果还没有人说过话
			all="";	}
		all=msg+all;//添加到所有人的聊天记录中
		application.setAttribute("all", all);
		
	}
%>
<form action="talk.jsp" method="post">
	<input type="text" name="msg"><br/>
	<input type="submit" value="ok">
	
</form>
<a href="logout.jsp">退出</a>
</body>
</html>