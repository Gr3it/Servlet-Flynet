<%@page import="java.sql.*"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% final String URL_DB = "jdbc:mysql://localhost:3306/aereoporto"; final String
driver = "com.mysql.jdbc.Driver"; final String user = "root"; final String psw =
""; Connection connessione=null; try { Class.forName(driver); } catch
(ClassNotFoundException ex) { System.err.println(ex.getMessage()); } %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Pannello Modifiche</title>
    <link rel="stylesheet" href="../style.css" />
    <link rel="icon" type="image/png" href="../favicon.png" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Shrikhand"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Cabin"
    />
  </head>
  <body>
    <%if(session.getAttribute("username")==null){
    response.sendRedirect("../index.jsp"); }%>
    <nav class="menu-container-servlet">
      <a class="link-home" href="../index.jsp">Home</a>
      <a href="../Partenze">Partenze</a>
      <a href="../Arrivi">Arrivi</a>
      <a href="../Gestione_Voli">Gestione Voli</a>
      <a class="link-active" href="Pannello_Modifiche.jsp"
        >Pannello Modifiche</a
      >
      <a class="login" href="logout.jsp">Logout</a>
    </nav>
    <div class="option-container">
      <form action="Pannello_Modifiche.jsp">
        <input
          class="options-submit"
          type="submit"
          id="add_volo"
          name="add_volo"
          value="Inserimento di un nuovo volo"
        />
      </form>
      <form action="Pannello_Modifiche.jsp">
        <input
          class="options-submit"
          type="submit"
          id="add_compagnia"
          name="add_compagnia"
          value="Inserimento di una nuova compagnia"
        />
      </form>
      <form action="Pannello_Modifiche.jsp">
        <input
          class="options-submit"
          type="submit"
          id="edit_volo"
          name="edit_volo"
          value="Modifica della tipologia di un volo"
        />
      </form>
      <form action="Pannello_Modifiche.jsp">
        <input
          class="options-submit"
          type="submit"
          id="delete_volo"
          name="delete_volo"
          value="Eliminazione di un volo"
        />
      </form>
    </div>

    <%if(request.getParameter("add_volo") != null){%>
    <form class="form-container" action="Pannello_Modifiche.jsp">
      <input
        type="text"
        id="sigla"
        name="sigla"
        placeholder="Sigla Aeroporto"
      />
      <input
        type="text"
        id="aeroporto"
        name="aeroporto"
        placeholder="Nome Aeroporto"
      />
      <input
        type="number"
        id="compagnia"
        name="compagnia"
        placeholder="Numero Compagnia"
      />
      <input
        type="text"
        id="codice_volo"
        name="codice_volo"
        placeholder="Codice Volo"
      />
      Partenza:
      <input type="time" id="partenza" name="partenza" />
      Arrivo:
      <input type="time" id="arrivo" name="arrivo" />
      <input type="text" id="tipo" name="tipo" placeholder="Tipologia Volo" />

      <input
        type="submit"
        id="add_volo_confirm"
        name="add_volo_confirm"
        value="Aggiungi Volo"
      />
    </form>
    <%} if(request.getParameter("add_compagnia") != null){%>
    <form class="form-container" action="Pannello_Modifiche.jsp">
      <input
        type="text"
        id="compagnia"
        name="compagnia"
        placeholder="Nome Compagnia"
      />

      <input
        type="submit"
        id="add_compagnia_confirm"
        name="add_compagnia_confirm"
        value="Aggiungi Compagnia"
      />
    </form>
    <%} if(request.getParameter("edit_volo") != null){%>
    <form class="form-container" action="Pannello_Modifiche.jsp">
      <input type="text" id="id" name="id" placeholder="Id Volo" />

      <input type="text" id="tipo" name="tipo" placeholder="Tipologia Volo" />

      <input
        type="submit"
        id="edit_volo_confirm"
        name="edit_volo_confirm"
        value="Modifica Volo"
      />
    </form>
    <%} if(request.getParameter("delete_volo") != null){%>
    <form class="form-container" action="Pannello_Modifiche.jsp">
      <input type="text" id="id" name="id" placeholder="Id Volo" />

      <input
        type="submit"
        id="edit_volo_confirm"
        name="delete_volo_confirm"
        value="Elimina Volo"
      />
    </form>

    <%} if(request.getParameter("add_volo_confirm") != null){ try { connessione
    = DriverManager.getConnection(URL_DB,user,psw); PreparedStatement p =
    connessione.prepareStatement("INSERT INTO volo (sigla, aeroporto, compagnia,
    codice_volo, partenza, arrivo, tipo) VALUES (?,?,?,?,?,?,?)");
    p.setString(1,request.getParameter("sigla"));
    p.setString(2,request.getParameter("aeroporto"));
    p.setString(3,request.getParameter("compagnia"));
    p.setString(4,request.getParameter("codice_volo"));
    p.setString(5,request.getParameter("partenza"));
    p.setString(6,request.getParameter("arrivo"));
    p.setString(7,request.getParameter("tipo")); int result=p.executeUpdate();
    if(result > 0){ %>
    <h1 class="query-result">Volo aggiunto con successo</h1>
    <% }else{ %>
    <h1 class="query-result">Errore nell'aggiunta del volo</h1>
    <% } } catch (SQLException ex) { System.err.println("Errore nella
    connessione. " + ex.getMessage()); } finally { if (connessione != null) {
    try { connessione.close(); } catch (SQLException ex) {
    System.err.println("Errore nella connessione. " + ex.getMessage()); } } } }
    if(request.getParameter("add_compagnia_confirm") != null){ try { connessione
    = DriverManager.getConnection(URL_DB,user,psw); PreparedStatement p =
    connessione.prepareStatement("INSERT INTO compagnia (nome_compagnia) VALUES
    (?)"); p.setString(1,request.getParameter("compagnia")); int
    result=p.executeUpdate(); if(result > 0){ %>
    <h1 class="query-result">Compagnia aggiunta con successo</h1>
    <% }else{ %>
    <h1 class="query-result">Errore nell'aggiunta della compagnia</h1>
    <% } } catch (SQLException ex) { System.err.println("Errore nella
    connessione. " + ex.getMessage()); } finally { if (connessione != null) {
    try { connessione.close(); } catch (SQLException ex) {
    System.err.println("Errore nella connessione. " + ex.getMessage()); } } } }
    if(request.getParameter("edit_volo_confirm") != null){ try { connessione =
    DriverManager.getConnection(URL_DB,user,psw); PreparedStatement p =
    connessione.prepareStatement("UPDATE volo SET tipo=? where id=?");
    p.setString(1,request.getParameter("tipo"));
    p.setString(2,request.getParameter("id")); int result=p.executeUpdate();
    if(result > 0){ %>
    <h1 class="query-result">Modifica avvenuta con successo</h1>
    <% }else{ %>
    <h1 class="query-result">Errore durante la modifica del volo</h1>
    <% } } catch (SQLException ex) { System.err.println("Errore nella
    connessione. " + ex.getMessage()); } finally { if (connessione != null) {
    try { connessione.close(); } catch (SQLException ex) {
    System.err.println("Errore nella connessione. " + ex.getMessage()); } } } }
    if(request.getParameter("delete_volo_confirm") != null){ try { connessione =
    DriverManager.getConnection(URL_DB,user,psw); PreparedStatement p =
    connessione.prepareStatement("DELETE FROM volo where id=?");
    p.setString(1,request.getParameter("id")); int result=p.executeUpdate();
    if(result > 0){ %>
    <h1 class="query-result">Eliminazione avvenuta con successo</h1>
    <% }else{ %>
    <h1 class="query-result">Errore durante l'eliminazione del volo</h1>
    <% } } catch (SQLException ex) { System.err.println("Errore nella
    connessione. " + ex.getMessage()); } finally { if (connessione != null) {
    try { connessione.close(); } catch (SQLException ex) {
    System.err.println("Errore nella connessione. " + ex.getMessage()); } } } }
    %>
  </body>
</html>
