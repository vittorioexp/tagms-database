
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

            String interval = "6 months";

            start = System.currentTimeMillis();

            // -- Return the list of unsellable lots which are in stock (that will expire in less than 6 months)

            String sql="SELECT\n" +
                    "       l.lot_id,\n" +
                    "       DATE(l.expiration_date) AS expiration_date,\n" +
                    "       l.product_id,\n" +
                    "       l.product_quantity,\n" +
                    "       l.package_id,\n" +
                    "       l.package_quantity,\n" +
                    "       l.lot_discount,\n" +
                    "       l.vat,\n" +
                    "       l.lot_price\n" +
                    "       FROM tagms.lot AS l\n" +
                    "    LEFT OUTER JOIN tagms.draws_from AS df ON l.lot_id = df.lot_id\n" +
                    "WHERE l.expiration_date <= (current_date + interval "+interval+")\n" +
                    "  AND df.order_id IS NULL;";


            // execute the query
            start = System.currentTimeMillis();
            rs = stmt.executeQuery(sql);


            String lot_id;
            String expiration_date;
            String product_id;
            String product_quantity;
            String package_id;
            String package_quantity;
            String lot_discount;
            String lot_price;

            System.out.println(
                pad("LOT ID", 20) +
                pad("EXPIRATION DATE", 20) +
                pad("PRODUCT ID", 20) +
                pad("PRODUCT QUANTITY", 20) +
                pad("PACKAGE ID ", 20) +
                pad("PACKAGE QUANTITY", 20) +
                pad("LOT DISCOUNT", 20) +
                pad("LOT PRICE", 20)
            );


            // cycle on the query results
            while (rs.next()) {


                lot_id = rs.getString("lot_id");
                expiration_date = rs.getString("expiration_date");
                product_id = rs.getString("product_id");
                product_quantity = rs.getString("product_quantity");
                package_id = rs.getString("package_id");
                package_quantity = rs.getString("package_quantity");
                lot_discount = rs.getString("lot_discount");
                lot_price = rs.getString("lot_price");

                System.out.println(
                pad(String.valueOf(lot_id), 20) +
                pad(String.valueOf(expiration_date), 20) +
                pad(String.valueOf(product_id), 20) +
                pad(String.valueOf(product_quantity), 20) +
                pad(String.valueOf(packet_id), 20) +
                pad(String.valueOf(packet_quantity), 20) +
                pad(String.valueOf(lot_discount), 20) +
                pad(String.valueOf(lot_price), 20)
                );



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
