<%@page import="java.sql.*"%>

<title>Flynet Login</title>
<link rel="stylesheet" href="../style.css" />
<link rel="icon" type="image/png" href="../favicon.png" />
<link
  rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Shrikhand"
/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cabin" />

<% final String URL_DB = "jdbc:mysql://localhost:3306/aereoporto"; final String
driver = "com.mysql.jdbc.Driver"; final String user = "root"; final String psw =
""; if(request.getParameter("login")!=null){ String
username=request.getParameter("user"); String pass=request.getParameter("pass");
try { Class.forName(driver); } catch (ClassNotFoundException ex) {
System.err.println(ex.getMessage()); } Connection connessione=null; ResultSet
result=null; connessione = DriverManager.getConnection(URL_DB,user,psw);
PreparedStatement p = connessione.prepareStatement("select * from utenti where
username=? and psw=?"); //bind parametri p.setString(1,username);
p.setString(2,pass); //eseguo la query ed ottengo il recordset
result=p.executeQuery(); if(result.next()){ session.setAttribute("username",
result.getString("username")); response.sendRedirect("../index.jsp"); } else{ %>
<div class="login-container">
  <form name="formLogin" action="login.jsp" method="post">
    <p class="login-error">Utente o password sbagliati, riprovare</p>
    <input class="login-input" type="text" placeholder="Username" name="user" />
    <input
      class="login-input"
      type="password"
      placeholder="Password"
      name="pass"
    />
    <button class="login-submit" type="submit" name="login">Login</button>
    <a href="../index.jsp" class="login-submit">Home</a>
  </form>
</div>

<% } } else { %>
<div class="login-container">
  <form name="formLogin" action="login.jsp" method="post">
    <input class="login-input" type="text" placeholder="Username" name="user" />
    <input
      class="login-input"
      type="password"
      placeholder="Password"
      name="pass"
    />
    <button class="login-submit" type="submit" name="login">Login</button>
  </form>
</div>
<% } %>
