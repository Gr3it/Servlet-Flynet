import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Gestione_Voli"})
public class Gestione_Voli extends HttpServlet {
    
    private final String URL_DB = "jdbc:mysql://localhost:3306/aereoporto";
    private final String driver = "com.mysql.jdbc.Driver";
    private final String user = "root";
    private final String psw = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connessione = null;
        HttpSession session = request.getSession();
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            System.err.println("Driver non trovato." + ex.getMessage());
        }
        
        String query = "select distinct aeroporto from volo order by aeroporto";
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Gestione Voli</title><link rel=\"stylesheet\" href=\"./style.css\" />\n" +
"    <link rel=\"icon\" type=\"image/png\" href=\"./favicon.png\" />\n" +
"    <link\n" +
"      rel=\"stylesheet\"\n" +
"      href=\"https://fonts.googleapis.com/css?family=Shrikhand\"\n" +
"    />\n" +
"    <link\n" +
"      rel=\"stylesheet\"\n" +
"      href=\"https://fonts.googleapis.com/css?family=Cabin\"\n" +
"    />");            
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class=\"menu-container-servlet\">\n");
            out.println("<a class=\"link-home\" href=\"index.jsp\">Home</a>\n" +
"        <a href=\"Partenze\">Partenze</a>\n" +
"        <a href=\"Arrivi\">Arrivi</a>\n" +
"        <a class=\"link-active\" href=\"Gestione_Voli\">Gestione Voli</a>\n");
         if(session.getAttribute("username")!=null){
             out.println("<a href=\"jsp/Pannello_Modifiche.jsp\">Pannello Modifiche</a>\n" +
"        <a class=\"login\" href=\"jsp/logout.jsp\">Logout</a>");
         }
            out.println("</nav>");
            out.println("<div class=\"search-container\">\n" +
"      <div class=\"company-button\">\n" +
"        Scegli Aeroporto\n" +
"        <div class=\"deactive\">\n");
            
            try {
                connessione = DriverManager.getConnection(URL_DB, user, psw);

                Statement statement = connessione.createStatement();

                ResultSet result = statement.executeQuery(query);
                
                while (result.next()) {
                    out.println("<form action=\"Gestione_Voli\" method=\"post\">\n" +
"            <input type=\"hidden\" id=\"company\" name=\"company\" value=\""+ result.getString("aeroporto") + "\" />\n" +
"            <input class=\"company-submit\" type=\"submit\" name=\"invia\" value=\""+ result.getString("aeroporto") + "\" />\n" +
"          </form>");
                }

            } catch (SQLException ex) {
                System.err.println("Errore nella connessione. " + ex.getMessage());
            } finally {
                if (connessione != null) {
                    try {
                        connessione.close();
                    } catch (SQLException ex) {
                        System.err.println("Errore nella connessione. " + ex.getMessage());
                    }
                }
            }
        
out.println("</div>\n" +
"      </div>\n" +
"      <script src=\"toggle.js\"></script>\n" +
"      <div class=\"seacrh-bar\">\n" +
"        <form action=\"Gestione_Voli\" method=\"post\">\n" +
"          <input class=\"seacrh\" type=\"text\" id=\"seach\" name=\"search\" required placeholder=\"Iserire codice aeroporto o volo\"/>\n" +
"          <input class=\"seacrh-submit\" type=\"submit\" id=\"search-submit\" name=\"search-submit\" value=\"Cerca\"/>\n" +
"        </form>\n" +
"      </div>\n" +
"    </div>");

            if(request.getParameter("invia") != null){
                
                try {
                    Class.forName(driver);
                } catch (ClassNotFoundException ex) {
                    System.err.println("Driver non trovato." + ex.getMessage());
                }
                
                
                query = "select id, sigla, nome_compagnia, codice_volo, partenza, arrivo from volo, compagnia where tipo='And' and compagnia = id_compagnia and aeroporto='" + request.getParameter("company") + "' order by partenza";

                try {
                connessione = DriverManager.getConnection(URL_DB, user, psw);

                Statement statement = connessione.createStatement();

                ResultSet result = statement.executeQuery(query);

                out.println("<div class=\"table-title\">Voli verso " + request.getParameter("company") + "</div>");

                out.println("<div class=\"table-container\"><table class=\"table\">");
                out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Partenza</th><th>Arrivo</th></tr>");
                
                while (result.next()) {
                    out.println("<tr>"
                            + "<td>" + result.getString("codice_volo") + "</td>"
                            + "<td>" + result.getString("nome_compagnia") + "</td>"                           
                            + "<td>" + result.getString("partenza") + "</td>" 
                            + "<td>" + result.getString("arrivo") + "</td>" + "</tr>");
                }
                out.println("</table></div>");
                
                query = "select id, sigla, nome_compagnia, codice_volo, partenza, arrivo from volo, compagnia where tipo='Rit' and compagnia = id_compagnia and aeroporto='" + request.getParameter("company") + "' order by partenza";

                statement = connessione.createStatement();

                result = statement.executeQuery(query);
                
                out.println("<div class=\"table-title\">Voli provenienti da " + request.getParameter("company") + "</div>");

                out.println("<div class=\"table-container\"><table class=\"table\">");
                out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Partenza</th><th>Arrivo</th></tr>");
                
                while (result.next()) {
                    out.println("<tr>"
                            + "<td>" + result.getString("codice_volo") + "</td>"
                            + "<td>" + result.getString("nome_compagnia") + "</td>"                           
                            + "<td>" + result.getString("partenza") + "</td>" 
                            + "<td>" + result.getString("arrivo") + "</td>" + "</tr>");
                }
                out.println("</table></div>");

                } catch (SQLException ex) {
                    System.err.println("Errore nella connessione. " + ex.getMessage());
                } finally {
                    if (connessione != null) {
                        try {
                            connessione.close();
                        } catch (SQLException ex) {
                            System.err.println("Errore nella connessione. " + ex.getMessage());
                        }
                    }
                }
            }
            
            if(request.getParameter("search-submit") != null){

                if(request.getParameter("search").length() == 3){
                    
                    try {
                        Class.forName(driver);
                    } catch (ClassNotFoundException ex) {
                        System.err.println("Driver non trovato." + ex.getMessage());
                    }
                    
                    query = "select distinct aeroporto from volo where sigla='" + request.getParameter("search") + "'";

                    
                    try {
                    connessione = DriverManager.getConnection(URL_DB, user, psw);

                    Statement statement = connessione.createStatement();

                    ResultSet result = statement.executeQuery(query);
                    
                    String compagnia="";

                    while (result.next()) {
                        compagnia = result.getString("aeroporto");
                    }                    

                    query = "select id, sigla, nome_compagnia, codice_volo, partenza, arrivo from volo, compagnia where tipo='And' and compagnia = id_compagnia and sigla='" + request.getParameter("search").toUpperCase() + "' order by partenza";

                    connessione = DriverManager.getConnection(URL_DB, user, psw);

                    statement = connessione.createStatement();

                    result = statement.executeQuery(query);

                    out.println("<div class=\"table-title\">Voli verso " + compagnia + "</div>");

                    out.println("<div class=\"table-container\"><table class=\"table\">");
                    out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Partenza</th><th>Arrivo</th></tr>");

                    while (result.next()) {
                        out.println("<tr>"
                                + "<td>" + result.getString("codice_volo") + "</td>"
                                + "<td>" + result.getString("nome_compagnia") + "</td>"                           
                                + "<td>" + result.getString("partenza") + "</td>" 
                                + "<td>" + result.getString("arrivo") + "</td>" + "</tr>");
                    }
                    out.println("</table></div>");

                    query = "select id, sigla, nome_compagnia, codice_volo, partenza, arrivo from volo, compagnia where tipo='Rit' and compagnia = id_compagnia and sigla='" + request.getParameter("search").toUpperCase() + "' order by partenza";

                    statement = connessione.createStatement();

                    result = statement.executeQuery(query);

                    out.println("<div class=\"table-title\">Voli provenienti da " + compagnia + "</div>");

                    out.println("<div class=\"table-container\"><table class=\"table\">");
                    out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Partenza</th><th>Arrivo</th></tr>");

                    while (result.next()) {
                        out.println("<tr>"
                                + "<td>" + result.getString("codice_volo") + "</td>"
                                + "<td>" + result.getString("nome_compagnia") + "</td>"                           
                                + "<td>" + result.getString("partenza") + "</td>" 
                                + "<td>" + result.getString("arrivo") + "</td>" + "</tr>");
                    }
                    out.println("</table></div>");

                    } catch (SQLException ex) {
                        System.err.println("Errore nella connessione. " + ex.getMessage());
                    } finally {
                        if (connessione != null) {
                            try {
                                connessione.close();
                            } catch (SQLException ex) {
                                System.err.println("Errore nella connessione. " + ex.getMessage());
                            }
                        }
                    }
                }
                else {
                    try {
                        Class.forName(driver);
                    } catch (ClassNotFoundException ex) {
                        System.err.println("Driver non trovato." + ex.getMessage());
                    }
                    
                    query = "select id, sigla, nome_compagnia, codice_volo, partenza, arrivo, tipo, aeroporto from volo, compagnia where codice_volo='" + request.getParameter("search").toUpperCase() + "' and compagnia = id_compagnia order by partenza";

                    
                    try {
                    connessione = DriverManager.getConnection(URL_DB, user, psw);

                    Statement statement = connessione.createStatement();

                    ResultSet result = statement.executeQuery(query);

                    out.println("<div class=\"table-title\">Voli " + request.getParameter("search").toUpperCase() + "</div>");

                    out.println("<div class=\"table-container\"><table class=\"table\">");
                    out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Aeroporto</th><th>Direzione</th><th>Partenza</th><th>Arrivo</th></tr>");

                    while (result.next()) {
                        out.println("<tr>"
                                + "<td>" + result.getString("codice_volo") + "</td>"
                                + "<td>" + result.getString("nome_compagnia") + "</td>"     
                                + "<td>" + result.getString("aeroporto") + "</td>" 
                                + "<td>" + result.getString("tipo") + "</td>"
                                + "<td>" + result.getString("partenza") + "</td>" 
                                + "<td>" + result.getString("arrivo") + "</td>" + "</tr>");
                                
                    }
                    out.println("</table></div>");

                    } catch (SQLException ex) {
                        System.err.println("Errore nella connessione. " + ex.getMessage());
                    } finally {
                        if (connessione != null) {
                            try {
                                connessione.close();
                            } catch (SQLException ex) {
                                System.err.println("Errore nella connessione. " + ex.getMessage());
                            }
                        }
                    }
                }
               
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
