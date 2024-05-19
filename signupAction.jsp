<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>

<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.Connection" %>

<%-- 데이터베이스 SQL 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%
    // 값 받아오기
    request.setCharacterEncoding("utf-8");   // 안해주면 전 페이지에가 준 한글이 깨짐
    String idValue = request.getParameter("id_value");
    String pwValue = request.getParameter("pw_value");

    // 데이터베이스 통신
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234");

    String sql = "INSERT INTO account(id, pw) VALUES(?, ?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    query.executeUpdate();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <script>
        alert("회원가입에 성공하였습니다")
        location.href="index.jsp"
    </script>
</body>