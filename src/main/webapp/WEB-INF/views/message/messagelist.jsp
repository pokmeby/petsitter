<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 내 쪽지함]</title>
</head>

<body>
</head>
<body>
    <c:forEach var = "note" items="${messageList}">
    쪽지번호 : ${note.mno} <br>
    보낸사람 : ${note.user_email} <br>
    내용 : ${note.m_content} <br>
    보낸 날짜 : ${note.m_time} 
    
    </c:forEach>
</body>
</body>
</html>