<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<html>
<head>
    <meta http-equiv="content-type" content="text/html"; charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>client</h1>

<p>principal : <sec:authentication property="principal"/></p>
<p>MemberVO : <sec:authentication property="principal.member"/></p>
<p>사용자 이름 : <sec:authentication property="principal.member.real_name"/></p>
<p>사용자 아이디 : <sec:authentication property="principal.member.userid"/></p>
<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList"/></p>

<a href="/customlogout">Logout</a>
</body>
</html>
