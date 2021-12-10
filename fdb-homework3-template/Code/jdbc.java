import java.sql.Connection ;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/* *
 * Prints the park data together with its rides and events perfomred on the rides
 *
 * @version 1.00
 */

public class Tagms {
    /* *
     * The JDBC driver to be used
     */
    private static final String DRIVER = "org.postgresql.Driver”;
    /* *
     * The URL of the database to be accessed
     */
    private static final String DATABASE ="jdbc:postgresql://localhost/tagmsdb ”;
    /* *
     * The username for accessing the database
     */
    private static final String USER = "ywti";
    /* *
     * The password for accessing the database
     */
    private static final String PASSWORD = "ywti";
    /* *
     * TODO: write description here
     *
     * @param args command - line arguments ( not used ).
     */
    public static void main(String[] args) {
        // the connection to the DBMS
        Connection con = null ;
        // the statement to be executed
        Statement stmt = null ;
        // the results of the statements execution
        ResultSet rs = null ;
        ResultSet rs2 = null ;
        // start time of a statement
        long start ;
        // end time of a statement
        long end;

    }
}