package com.example.tagmswebapp;

import java.sql.*;

public class DecrementQuantityItem {

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
     * After inserting a new lot with identifier Lot_id (see the "populate" section)
     * decrease the quantity of the items involved in the production of a lot
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


            // NOTE: it is necessary to properly initialize the following variable

            int lot_id = 3;

            final String STATEMENT = "UPDATE tagms.item AS i SET\n" +
                    "    quantity = c.quantity\n" +
                    "FROM (\n" +
                    "        SELECT i.item_id, i.quantity - l.product_quantity * m1.quantity AS quantity FROM tagms.lot AS l\n" +
                    "            INNER JOIN tagms.made_up_of_1 AS m1 ON l.product_id = m1.product_id\n" +
                    "            INNER JOIN tagms.item AS i ON m1.item_id = i.item_id\n" +
                    "        WHERE l.lot_id = '" + lot_id + "'\n" +
                    "    UNION\n" +
                    "        SELECT i.item_id, i.quantity - l.package_quantity * m2.quantity AS quantity FROM tagms.lot AS l\n" +
                    "            INNER JOIN tagms.made_up_of_2 AS m2 ON l.package_id = m2.package_id\n" +
                    "            INNER JOIN tagms.item AS i ON m2.item_id = i.item_id\n" +
                    "        WHERE l.lot_id = '" + lot_id + "'\n" +
                    "     )\n" +
                    "    AS c(item_id, quantity)\n" +
                    "WHERE c.item_id = i.item_id\n" +
                    "RETURNING i.item_id, name, i.quantity, minimum_quantity;";

            rs = stmt.executeQuery(STATEMENT);

            int item_id;
            String name;
            int quantity;
            int minimum_quantity;


            System.out.println(
                    pad("ITEM_ID", 15) +
                            pad("NAME", 35) +
                            pad("QUANTITY", 15) +
                            pad("MINIMUM_QUANTITY", 20)
            );


            // cycle on the query results ( i . e . for each employee we will select the events to be printed )
            while ( rs.next()) {

                // read item id
                item_id = rs.getInt("item_id");

                // read item name
                name = rs.getString("name");

                // read item quantities
                quantity = rs.getInt("quantity");
                minimum_quantity = rs.getInt("minimum_quantity");


                System.out.println(
                        pad(String.valueOf(item_id), 15) +
                                pad(name, 35) +
                                pad(String.valueOf(quantity), 15) +
                                pad(String.valueOf(minimum_quantity), 20)
                );
            }


            rs.close();
            stmt.close();
            con.close();
            end = System.currentTimeMillis();
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
                if (!stmt.isClosed()) {
                    start = System.currentTimeMillis();
                    stmt.close();
                    end = System.currentTimeMillis();
                    System.out.printf(" Statement successfully closed " +
                                    "in finally block in %d milliseconds .%n",
                            end - start );
                }
                if (! con.isClosed()) {
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

