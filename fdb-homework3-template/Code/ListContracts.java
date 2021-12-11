package com.example.tagmswebapp;

import java.sql.*;

public class ListContracts {

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
     * Get details about all the contracts stipulated between
     * a supplier, given his name, (e.g., "Reg s.r.l"),
     * and a manager, given his/her tax_number (e.g., 'FGDVSF30C62D012T')
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

            start = System.currentTimeMillis();

            // Note: the following variables must be properly initialized

            String tax_number = "FGDVSF30C62D012T";
            String supplier_name = "Reg s.r.l.";

            String sql ="SELECT c.contract_id,\n" +
                    "       c.description,\n" +
                    "       c.contract_date AS contract_date,\n" +
                    "       c.expiration_date AS expiration_date,\n" +
                    "       e.first_name AS manager_name,\n" +
                    "       e.last_name AS manager_surname\n" +
                    "\t\tFROM tagms.contract AS c\n" +
                    "\t\t    INNER JOIN tagms.employee AS e ON c.employee_id = e.tax_number\n" +
                    "\t\t    INNER JOIN tagms.supplier AS s ON c.supplier_id = s.vat_number\n" +
                    "WHERE e.tax_number='"+ tax_number +"'\n" +
                    "  AND s.supplier_name='"+ supplier_name +"';";

            rs = stmt.executeQuery(sql);

            String contract_id;
            String description;
            Date contract_date;
            Date expiration_date;
            String manager_name;
            String manager_surname;

            System.out.println(
                    pad("CONTRACT_ID", 20) +
                            pad("DESCRIPTION", 30) +
                            pad("CONTRACT_DATE", 20) +
                            pad("EXPIRATION_DATE", 20) +
                            pad("MANAGER_NAME", 20) +
                            pad("MANAGER_SURNAME", 20)
            );

            // cycle on the query results ( i . e . for each employee we will select the events to be printed )
            while ( rs.next ()) {

                contract_id = rs.getString("contract_id");

                // read description of contract
                description = rs.getString ("description");

                // read contract_date and expiration_date
                contract_date = rs.getDate ("contract_date");
                expiration_date = rs.getDate("expiration_date");

                // read name and surname of the manager that manages these contracts, it should be the same in each row
                manager_name = rs.getString ("manager_name");
                manager_surname = rs.getString("manager_surname");

                System.out.println(
                        pad(contract_id, 20) +
                                pad(description, 30) +
                                pad(String.valueOf(contract_date), 20) +
                                pad(String.valueOf(expiration_date), 20) +
                                pad(manager_name, 20) +
                                pad(manager_surname, 20)
                );

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

    private static String pad(String text, int length) {
        return String.format("%-" + length + "." + length + "s", text);
    }

}
