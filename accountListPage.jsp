<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%-- 데이터베이스 값 받아오기 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>

<%
    // 데이터베이스 통신
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234");

    String sql = "SELECT * FROM account;";
    PreparedStatement query = connect.prepareStatement(sql);

    ResultSet result = query.executeQuery();

    // result.next()   // 가져온 Table에서 row 1개를 읽어 ( jsp 문법이라는게 문제 )
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <%
        while(result.next()) {
    %>
        <%-- 여기는 HTML 영역 ( 쉽게 말해, jsp의 반복문의 내용으로 HTML TAG를 넣어줄 수 있음 ) --%>
        <div>아이디 : <%=result.getString(1)%> / 비밀번호 : <%=result.getString(2)%> </div>
    <%
        }
    %>

</body>