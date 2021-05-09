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

@WebServlet(urlPatterns = {"/Partenze"})
public class Partenze extends HttpServlet {
    
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
        
        String query = "select id, sigla, aeroporto, nome_compagnia, codice_volo, partenza, arrivo from volo, compagnia where tipo='And' and compagnia = id_compagnia order by partenza";
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>VisualizzazioneOrari</title>");
            out.println("<link rel=\"stylesheet\" href=\"./style.css\" />\n" +
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
"        <a class=\"link-active\" href=\"Partenze\">Partenze</a>\n" +
"        <a href=\"Arrivi\">Arrivi</a>\n" +
"        <a href=\"Gestione_Voli\">Gestione Voli</a>\n");
         if(session.getAttribute("username")!=null){
             out.println("<a href=\"jsp/Pannello_Modifiche.jsp\">Pannello Modifiche</a>\n" +
"        <a class=\"login\" href=\"jsp/logout.jsp\">Logout</a>");
         }
            out.println("</nav>");

            try {
                connessione = DriverManager.getConnection(URL_DB, user, psw);

                Statement statement = connessione.createStatement();

                ResultSet result = statement.executeQuery(query);

                out.println("<div class=\"table-container\"><table class=\"table\">");
                out.println("<tr><th>Codice volo</th><th>Compagnia</th><th>Aeroporto</th><th>Partenza</th><th>Arrivo</th></tr>");
                
                while (result.next()) {
                    out.println("<tr>"
                            + "<td>" + result.getString("codice_volo") + "</td>"
                            + "<td>" + result.getString("nome_compagnia") + "</td>" 
                            + "<td>" + result.getString("aeroporto") + "</td>"                           
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

            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
