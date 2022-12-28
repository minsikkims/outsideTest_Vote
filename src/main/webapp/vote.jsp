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
	text-align: center;
}
</style>

	<header>
		<h1>(과정평가형 정보처리산업기사)지역구의원투표 프로그램 ver 2020-05</h1>
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
		<h2>홈쇼핑 회원 등록</h2>

		<form action="" method="post" onsubmit="return false" name=votefrm>
			<table align=center>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="v_jumin" /></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="v_name" /></td>
				</tr>
				<tr>
					<td>투표번호</td>
					<td><select name="m_no">
							<option value=""></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="v_time" /></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="v_area" /></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td><input type="radio" name="v_confirm" value="Y" /> 확인
						&nbsp;&nbsp; <input type="radio" name="v_confirm" value="N" />
						미확인</td>
				</tr>
				<tr>
					<td><button onclick="isValid()">투표하기</button></td>
					<td><button type="reset">다시하기</button></td>
				</tr>

			</table>
		</form>

	</section>
	<footer> HRDKOREA Copyright@2016 ALL - </footer>


	<script>
		function isValid() {
			const frm = document.votefrm; //form연결

			if (frm.v_jumin.value.trim() == "") {
				alert("주민번호가 입력되지 않았습니다!");
				frm.v_jumin.focus();
				return false;
			}
			if (frm.v_name.value.trim() == "") {
				alert("성명이 입력되지 않았습니다!");
				frm.v_name.focus();
				return false;
			}
			if (frm.m_no.value.trim() == "") {
				alert("후보번호가 선택되지 않았습니다!");
				frm.m_no.focus();
				return false;
			}
			if (frm.v_time.value.trim() == "") {
				alert("투표시간이 입력되지 않았습니다!");
				frm.v_time.focus();
				return false;
			}
			if (frm.v_area.value.trim() == "") {
				alert("투표장소가 입력되지 않았습니다!");
				frm.v_area.focus();
				return false;
			}
			if (frm.v_confirm.value.trim() == "") {
				alert("유권자확인이 선택되지 않았습니다!");
				frm.v_confirm.focus();
				return false;
			}

			//문제 없을경우 
			frm.action="proc/voteproc.jsp";
			frm.submit();
		}
	</script>


</body>
</html>