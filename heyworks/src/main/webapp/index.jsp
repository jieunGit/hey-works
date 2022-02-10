<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${ empty loginUser }">
			
		<jsp:forward page="WEB-INF/views/employee/login.jsp" />
			
		</c:when>
		<c:otherwise>
		
		<jsp:forward page="WEB-INF/views/main.jsp" />
			
		</c:otherwise>
	</c:choose>

	여러분 헬로 ㅎㅎ -누리
	
	셋팅 완료!! 감사합니당 -수현
	
	셋팅 끝났습니당~!! 감사합니다!!!! -해랑
	
	셋팅완료입니다~ 감사합니다!! - 지은
	
	셋팅 완료했습니다!! - 한나
	
	셋팅 완료했습니다~ - 세현
	
	브랜치테스트 - 지은
	
	왜 안되죠 다시 테스트 - 지은

</body>
</html>