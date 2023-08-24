<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 멀티보드 관리하기</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/multiboard.css">
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp" %>
		<div class="main">
			<div class="article">			
				<h1>메인영역</h1>
				
					<div class="div-table">
						<div class="div-row table-head">
							<div class="div-cell table-head">번호</div>
							<div class="div-cell table-head">카테고리</div>
							<div class="div-cell table-head">이름</div>
							<div class="div-cell table-head">url</div>
							<div class="div-cell table-head">참고</div>
						</div>
						<c:forEach items="${setupBoardList }" var="row">
						<div class="div-row">
							<div class="div-cell">${row.b_no }</div>
							<div class="div-cell">${row.mb_cate }</div>
							<div class="div-cell">${row.b_catename }</div>
							<div class="div-cell url">${row.b_url }</div>
							<div class="div-cell">${row.b_comment }</div>
						</div>
						</c:forEach>
					</div>
				
			</div>
		</div>
	</div>
</body>
</html>