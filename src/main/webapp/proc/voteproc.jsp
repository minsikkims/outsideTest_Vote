<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>

	<jsp:useBean id="dto" class="Dto.VoteDto" />
	<jsp:setProperty property="*" name="dto" />
	<%@page import="Dao.*,Dto.*,java.util.*"%>
	<%
	System.out.println("dto: " + dto);
	VoteDao dao = new VoteDao();
	boolean isok = dao.Insert(dto);
	if (isok) {
		//Insert 성공
	%>
	<script>
		alert("투표가 완료되었습니다.");
		location.href = "../index.jsp";
	</script>
	<%
	} else {
	//Insert 실패
	%>
	<script>
		alert("투표정보 등록을 실패하였습니다.");
		location.href = "../vote.jsp";
	</script>
	<%
	}
	%>
</body>
</html>