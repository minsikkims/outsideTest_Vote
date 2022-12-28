<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
header {
	text-align: center;
	height: 50px;
}

nav>ul {
	display: flex;
	justify-content: space-around;
}

section {
	height: 600px;
}
</style>

	<header>
		<h1>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h1>
	</header>
	<nav>
		<ul>
			<li><a href="membersearch.jsp">후보조회</a></li>
			<li><a href="vote.jsp">투표하기</a></li>
			<li><a href="voteinfo.jsp">투표검수조회</a></li>
			<li><a href="showrank.jsp">후보자등수</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<section>
		<h2>투표 검수 조회</h2>
		<table>
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
			<%@page import="Dao.*,Dto.*,java.util.*,java.text.*"%>
			<%
			VoteDao dao = new VoteDao();
			List<VoteDto> list = dao.SelectAll();
			for (VoteDto dto : list) {
				out.println("<tr>");
				out.println("<td>" + dto.getV_name() + "</td>");
				out.println("<td>" + dto.getV_jumin() + "</td>");
				out.println("<td>" + dto.getV_jumin() + "</td>");
				out.println("<td>" + dto.getV_jumin().charAt(6) + "</td>");
				out.println("<td>" + dto.getM_no() + "</td>");
				out.println("<td>" + dto.getV_time() + "</td>");
				out.println("<td>" + dto.getV_confirm() + "</td>");
				out.println("</tr>");
			}
			%>
		</table>

	</section>
	<footer> HRDKOREA Copyright@2016 ALL - </footer>


</body>
</html>