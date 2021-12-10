package com.example.tagmsjava;

import java.sql.*;

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
    private static final String DATABASE ="jdbc:postgresql://localhost:5432/tagmsdb";
    /* *
     * The username for accessing the database
     */
    private static final String USER = "nopass";
    /* *
     * The password for accessing the database
     */
    private static final String PASSWORD = "";
    /* *
     * TODO: write description here
     *
     * @param args command - line arguments ( not used ).
     */
    public static void main(String[] args) {

        // the connection to the DBMS
        Connection con = null;
        // the statement to be executed
        Statement stmt = null;
        // the results of the statements execution
        ResultSet rs = null;
        // start time of a statement
        long start;
        // end time of a statement
        long end;

        // "data structures" for the data to be read from the database
        try {
            // register the JDBC driver
            Class.forName ( DRIVER );
            System.out.printf ("Driver %s successfully registered .%n", DRIVER );
        }  catch ( ClassNotFoundException e ) {
            System.out.printf(
                    "Driver %s not found : %s. %n",DRIVER, e.getMessage());
            // terminate with a generic error code
            System.exit(-1);
        }

        try {
            // connect to the database
            start = System.currentTimeMillis ();
            con = DriverManager.getConnection (DATABASE , USER , PASSWORD);
            end = System.currentTimeMillis ();
            System.out.printf (
                    "Connection to database %s successfully established in %d milliseconds .%n",
                    DATABASE , end - start );
            // create the statement to execute the query
            start = System.currentTimeMillis();
            stmt = con.createStatement ();
            end = System.currentTimeMillis ();
            System.out.printf (
                    "Statement successfully created in %d milliseconds .%n",
                    end - start);


            // get description, dates of  contracts with supplier Reg s.r.l and name and surname of the manager with tax_number='FGDVSF30C62D012T' that manages these contracts
            String sql ="select c.description,c.contract_date,c.expiration_date,e.first_name as manager_name,e.last_name as manager_surname\r\n"
                    + "		from tagms.contract as c inner join tagms.employee as e on\r\n"
                    + "        c.employee_id=e.tax_number inner join tagms.supplier as s on\r\n"
                    + "        c.supplier_id=s.vat_number where e.tax_number='FGDVSF30C62D012T' and\r\n"
                    + "        s.supplier_name='Reg s.r.l.';";
            start = System.currentTimeMillis();
            rs = stmt.executeQuery(sql);

            String description;
            Date contract_date;
            Date expiration_date;
            String manager_name;
            String manager_surname;

            System.out.printf(" DESCRIPTION\t\t\t\t\tCONTRACT_DATE\t\t\tEXPIRATION_DATE\t\t\tMANAGER_NAME\t\t\tMANAGER_SURNAME%n");

            // cycle on the query results ( i . e . for each employee we will select the events to be printed )
            while ( rs.next ()) {

                // read description of contract
                description = rs.getString ("description");

                // read contract_date and expiration_date
                contract_date = rs.getDate ("contract_date");
                expiration_date = rs.getDate("expiration_date");

                // read name and surname of the manager that manages these contracts, it should be the same in each row
                manager_name = rs.getString ("manager_name");
                manager_surname = rs.getString("manager_surname");

                System.out.printf(" %s\t\t%s\t\t\t\t%s\t\t\t\t%s\t\t\t\t\t%s%n", description, contract_date, expiration_date,manager_name,manager_surname);
            }

            rs.close ();
            stmt.close ();
            con.close ();
            end = System.currentTimeMillis ();
            System.out.printf ("%n Data correctly extracted and visualized in %d milliseconds .%n",
                    end - start );
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
                if (!rs.isClosed()){
                    start = System.currentTimeMillis();
                    rs.close();
                    end = System.currentTimeMillis();
                    System.out.printf(" Result set successfully closed in finally block in %d milliseconds .%n",
                            end - start );
                }
                if (!stmt.isClosed ()) {
                    start = System.currentTimeMillis();
                    stmt.close();
                    end = System.currentTimeMillis();
                    System.out.printf(" Statement successfully closed " +
                                    "in finally block in %d milliseconds .%n",
                            end - start );
                }
                if (! con.isClosed ()) {
                    start = System.currentTimeMillis();
                    con.close();
                    end = System.currentTimeMillis();
                    System.out.printf(" Connection successfully closed in finally block in %d milliseconds .%n",
                            end - start );
                }
            } catch (SQLException e) {
                System.out.printf (" Error while releasing resources in finally block :%n");
                // cycle in the exception chain
                while ( e != null ) {
                    System.out.printf(" - Message : %s %n",e.getMessage());
                    System.out.printf(" - SQL status code : %s %n",e.getSQLState());
                    System.out.printf(" - SQL error code : %s %n",e.getErrorCode());
                    System.out.printf(" %n");
                    e = e.getNextException();
                }
            } finally {
                // release resources to the garbage collector
                rs = null ;
                stmt = null ;
                con = null ;
                System.out.printf (" Resources released to the garbage collector .%n");
            }
        }
        System.out.printf (" Program end .%n");
    }
}