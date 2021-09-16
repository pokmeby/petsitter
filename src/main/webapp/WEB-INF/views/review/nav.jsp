<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
     <style type="text/css">
  		  li {list-style:none; display:inline; padding: 6px;}
    </style>
    	<c:out value="${sitter }"/>
    <ul>
    	<li>
    	<c:if test="${member != null || sitter != null}"><a href="/member/logout">로그아웃</a></c:if>
    	<c:if test="${member == null || sitter == null}"><a href="/">로그인</a></c:if>
    	</li>
    	<li>
    		<c:if test="${member != null }">
    				<p>${member }님 안녕하세요.</p>
    		</c:if>
    		<c:if test="${sitter != null }">
    				<p>${sitter }님 안녕하세요.</p>
    		
    				<br><br> <hr color="green" size="5">
    		</c:if>
    	</li>
    </ul>
