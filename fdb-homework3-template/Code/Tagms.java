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
    private static final String DRIVER = "org.postgresql.Driver";
    /* *
     * The URL of the database to be accessed
     */
    private static final String DATABASE ="jdbc:postgresql://localhost/tagmsdb";
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

        // "data structures" for the data to be read from the database
        try {
            // register the JDBC driver
            Class . forName ( DRIVER );
            System . out . printf ("Driver %s successfully registered .%n", DRIVER );
        }  catch ( ClassNotFoundException e ) {
            System.out.printf(
            "Driver % s not found : %s. % n",DRIVER, e.getMessage());
            // terminate with a generic error code
            System.exit(-1);
        }

        try {
            // connect to the database
            start = System.currentTimeMillis ();
            con = DriverManager.getConnection (DATABASE , USER , PASSWORD);
            end = System.currentTimeMillis ();
            System.out.printf (
            "Connection to database %s successfully established in % ,d milliseconds .%n",
            DATABASE , end - start );
            // create the statement to execute the query
            start = System.currentTimeMillis();
            stmt = con.createStatement ();
            end = System.currentTimeMillis ();
            System.out.printf (
            "Statement successfully created in % ,d milliseconds .%n",
            end - start);
            // get all the employees
            String sql ="SELECT * from Tagms.employee;";
            start = System.currentTimeMillis ();
            rs = stmt.executeQuery ( sql );
            System.out.printf ("% nEvent List :%n");
            String id;
            String name;
            String email;

            // cycle on the query results ( i . e . for each employee we will select the events to be printed )
            while ( rs.next ()) {
                // TODO: put code here...
                //...
            }

        } catch (SQLException e ) {
            System.out.printf ("Database access error :%n");
            // cycle in the exception chain
            while ( e != null ) {
                System.out.printf ("- Message : %s%n", e.getMessage ());
                System.out.printf ("- SQL status code : %s%n", e . getSQLState ());
                System.out.printf ("- SQL error code : %s%n", e . getErrorCode ());
                System.out.printf ("%n");
                e = e.getNextException ();
            }

        } finally {
            try {
                // close the used resources
                if (! rs . isClosed () || ! rs2 . isClosed ()){
                    start = System.currentTimeMillis();
                    rs.close();
                    rs2.close();
                    end = System.currentTimeMillis();
                    System.out
                            .printf(" Result set successfully closed in finally block in % ,d milliseconds .%n",
                    end - start );
                }
                if (! stmt . isClosed ()) {
                    start = System.currentTimeMillis();
                    stmt.close();
                    end = System.currentTimeMillis();
                    System.out.printf(" Statement successfully closed " +
                                    "in finally block in % ,d milliseconds .%n",
                    end - start );
                }
                if (! con . isClosed ()) {
                    start = System.currentTimeMillis();
                    con.close();
                    end = System.currentTimeMillis();
                    System.out
                            .printf(" Connection successfully closed in finally block in % ,d milliseconds .%n",
                    end - start );
                }
            } catch (SQLException e) {
                System . out . printf (" Error while releasing resources in finally block :%n");
                // cycle in the exception chain
                while ( e != null ) {
                    System.out.printf(" - Message : %s % n",e.getMessage());
                    System.out.printf(" - SQL status code : %s % n",e.getSQLState());
                    System.out.printf(" - SQL error code : %s % n",e.getErrorCode());
                    System.out.printf(" % n");
                    e = e.getNextException();
                }
            } finally {
                // release resources to the garbage collector
                rs = null ;
                stmt = null ;
                con = null ;
                System . out . printf (" Resources released to the garbage collector .%n");
            }
        }
        System . out . printf (" Program end .%n");
    }
}