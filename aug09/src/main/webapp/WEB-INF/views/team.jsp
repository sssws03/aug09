<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀뽑기</title>
<style type="text/css">
.names {
	margin: 5px;
	padding: 5px;
	width: calc(100% - 10px);
	height: 90px;
	background-color: gray;
	box-sizing: border-box;
}

input, button {
	margin: 0 auto;
	padding: 0;
	width: calc(100% - 10px);
	height: 30px;
	margin: 5px 0px;
}

table{
	margin: 0 auto;
	width: 500px;
	height: 300px;
}
tr{
	/* tr 태그에는 margin 속성이 적용되지 않기 때문 */
}
td{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<h1>팀뽑기</h1>
	<div class="names">
		<form action="./team" method="post">
			<input type="text" name="names"
				value="구관모,기상민,김민성,김수진,김요한,박지윤,배기주,송다원,송재윤,송화진,안희진,유영조,유종휘,이대원,이상화,이승현,이지선,정대규,정준식,최범식,최지은,표해현,차승리,황선우,박채아">
			<button>팀 만들기</button>
		</form>
	</div>

	<hr>
	<%-- ${list } --%>
	<%
	//서블릿에서 보내온 값 잡기
	List<String> list = (List) request.getAttribute("list");
	%>
	출력 결과 :
	<br>
	<%-- <%=list%><br> --%>
	<%
	if (list != null) {//에러가 나서 미리 처리하고 가겠습니다.
	%>
	<table border="1">
		<tr>
			<th>팀</th>
			<th>팀 장</th>
			<th colspan="4">팀 원</th>
		<%
		for (int i = 0; i < list.size(); i++) {
			if (i % 5 == 0) {
		%>
		</tr>
		<tr>
			<td><%=(i / 5) + 1 %></td>
			<td><%=list.get(i) %></td>
			<%
			} else if (i % 5 != 0) {
			%>
			<td><%=list.get(i)%></td>
			<%
			}//내부 if
		}//for
	}//if
			%>
		</tr>
	</table>
	<hr>

</body>
</html>