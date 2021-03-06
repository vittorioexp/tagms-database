package com.example.tagmswebapp;

import java.sql.*;

public class ListAvailableLots {

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
     * Lists all available lots (unsold and that won't expire in 6 months) containing
     * a particular product having a given Product_id as identifier,
     * sorted by expiration date (oldest lots must be sold first).
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



            // Note: the following variable must be properly initialized

            int product_id = 6;

            String sql ="SELECT l.lot_id,\n" +
                    "       l.expiration_date AS expiration_date,\n" +
                    "       l.product_id,\n" +
                    "       l.product_quantity,\n" +
                    "       ROUND(l.lot_price * (1 + l.vat/100) * (1 - l.lot_discount/100), 2) AS gross_price\n" +
                    "FROM tagms.lot AS l\n" +
                    "    LEFT OUTER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id\n" +
                    "WHERE l.product_id = '" + product_id + "'\n" +
                    "  AND l.expiration_date > (current_date + interval '6 months')\n" +
                    "  AND df.order_id IS NULL\n" +
                    "ORDER BY l.expiration_date ASC;";

            rs = stmt.executeQuery(sql);

            int lot_id;
            Date expiration_date;
            int product_quantity;
            float gross_price;

            System.out.println(
                    pad("LOT_ID", 15) +
                            pad("PRODUCT_ID", 15) +
                            pad("EXPIRATION_DATE", 15) +
                            pad("PRODUCT_QUANTITY", 15) +
                            pad("GROSS_PRICE", 15)
            );

            while ( rs.next()) {

                lot_id = rs.getInt("lot_id");  // read item id
                product_id = rs.getInt("product_id"); // read product id
                product_quantity = rs.getInt("product_quantity"); // read product quantity
                gross_price=rs.getFloat("gross_price"); // read gross price
                expiration_date=rs.getDate("expiration_date"); // read expiration date

                System.out.println(
                        pad(String.valueOf(lot_id), 15) +
                                pad(String.valueOf(lot_id), 15)  +
                                pad(String.valueOf(expiration_date), 15) +
                                pad(String.valueOf(product_quantity), 15) +
                                pad(String.valueOf(gross_price), 15)
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
