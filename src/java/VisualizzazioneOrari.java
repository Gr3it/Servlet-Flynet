import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet(urlPatterns = {"/VisualizzazioneOrari"})
public class VisualizzazioneOrari extends HttpServlet {
    
    private final String URL_DB = "jdbc:mysql://localhost:3306/aereoporto";
    private final String driver = "com.mysql.jdbc.Driver";
    private final String user = "root";
    private final String psw = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connessione = null;
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            System.err.println("Driver non trovato." + ex.getMessage());
        }
        
        String query = "select id, sigla, aeroporto, compagnia, codice_volo, partenza, arrivo from volo where tipo='And' order by partenza";
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VisualizzazioneOrari</title>");
            out.println("<link rel=\"stylesheet\" href=\"./style.css\" />");
            out.println("</head>");
            out.println("<body>");

            try {
                connessione = DriverManager.getConnection(URL_DB, user, psw);

                Statement statement = connessione.createStatement();

                ResultSet result = statement.executeQuery(query);

                out.println("<table>");
                out.println("<tr><th>id</th><th>sigla</th><th>aeroporto</th><th>compagnia</th><th>codice volo</th><th>partenza</th><th>arrivo</th></tr>");
                
                while (result.next()) {
                    out.println("<tr>" + "<td>" + result.getString("id") + "</td>" + "<td>" + result.getString("sigla")
                            + "</td>" + "<td>" + result.getString("aeroporto") + "</td>" + "<td>"
                            + result.getString("compagnia") + "</td>" + "<td>" + result.getString("codice_volo")
                            + "</td>" + "<td>" + result.getString("partenza") + "</td>" + "<td>"
                            + result.getString("arrivo") + "</td>" + "</tr>");
                }
                out.println("</table>");

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
