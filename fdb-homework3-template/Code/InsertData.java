
package com.example.tagmswebapp;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.io.*;
import java.util.Scanner;

/**
 * Reads from a CVS-like text file the data to be inserted into the database..
 *
 */
public class InsertData {

	/**
	 * The JDBC driver to be used
	 */
	private static final String DRIVER = "org.postgresql.Driver";

	/**
	 * The URL of the database to be accessed
	 */
	private static final String DATABASE = "jdbc:postgresql://localhost:5432/tagmsdb";

	/**
	 * The username for accessing the database
	 */
	private static final String USER = "nopass";

	/**
	 * The password for accessing the database
	 */
	private static final String PASSWORD = "";

	/**
	 * The default input file for reading the data
	 */
	private static final String DEFAULT_INPUT_FILE = "data.txt";

	/**
	 * The SQL statement for inserting data into the Package_category table.
	 */
	private static final String INSERT_INTO_PACKAGE_CATEGORY = "INSERT INTO Tagms.package_Category (Name, Description) VALUES (?, ?)";


	/**
	 * Reads from a CVS-like text file the data to be inserted into the database.
	 *
	 * @param args
	 *            command-line arguments. If provided, {@code args[0]} contains
	 *            the name of the file to be read.
	 *
	 */
	public static void main(String[] args) {

		// the connection to the DBMS
		Connection con = null;

		// the SQL statement to be executed
		PreparedStatement pstmtPackageCategory = null;

		// start time of a statement
		long start;

		// end time of a statement
		long end;

		// the input file from which data are read
		Reader input = null;

		// a scanner for parsing the content of the input file
		Scanner s = null;

		// current line number in the input file
		int l = 0;

		String namePackageCategory = null;

		String descriptionPackageCategory = null;


		try {
			// register the JDBC driver
			Class.forName(DRIVER);

			System.out.printf("Driver %s successfully registered.%n", DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.printf(
					"Driver %s not found: %s.%n", DRIVER, e.getMessage());

			// terminate with a generic error code
			System.exit(-1);
		}


		try {

			// connect to the database
			start = System.currentTimeMillis();

			con = DriverManager.getConnection(DATABASE, USER, PASSWORD);

			end = System.currentTimeMillis();

			System.out.printf(
					"Connection to database %s successfully established in %,d milliseconds.%n",
					DATABASE, end-start);

			// create the statements for inserting the data
			start = System.currentTimeMillis();

			pstmtPackageCategory = con.prepareStatement(INSERT_INTO_PACKAGE_CATEGORY);

			end = System.currentTimeMillis();

			System.out.printf(
					"Statements successfully created in %,d milliseconds.%n",
					end-start);

		} catch (SQLException e) {
			System.out.printf("Connection error:%n");

			// cycle in the exception chain
			while (e != null) {
				System.out.printf("- Message: %s%n", e.getMessage());
				System.out.printf("- SQL status code: %s%n", e.getSQLState());
				System.out.printf("- SQL error code: %s%n", e.getErrorCode());
				System.out.printf("%n");
				e = e.getNextException();
			}

			// terminate with a generic error code
			System.exit(-1);
		}


		// if there are no input arguments, use the default input file
		if (args.length == 0) {

			// get the class loader
			ClassLoader cl = InsertData.class.getClassLoader();
			if (cl == null) {
				cl = ClassLoader.getSystemClassLoader();
			}

			// Get the stream for reading the configuration file
			InputStream is = cl.getResourceAsStream(DEFAULT_INPUT_FILE);

			if (is == null) {
				System.out.printf("Input file %s not found.%n", DEFAULT_INPUT_FILE);

				// terminate with a generic error code
				System.exit(-1);
			}

			input = new BufferedReader(new InputStreamReader(is));

			System.out.printf("Input file %s successfully opened.%n", DEFAULT_INPUT_FILE);

		} else {

			try {
				input = new BufferedReader(new FileReader(args[0]));

				System.out.printf("Input file %s successfully opened.%n", args[0]);
			} catch (IOException ioe) {
				System.out.printf(
						"Impossible to read input file %s: %s%n", args[0],
						ioe.getMessage());

				// terminate with a generic error code
				System.exit(-1);
			}
		}

		// create the input file parser
		s = new Scanner(input);

		// set the delimiter for the fields in the input file
		s.useDelimiter("##");

		try {

			// while the are lines to be read from the input file
			while (s.hasNext()) {

				// increment the line number counter
				l++;

				System.out.printf("%n--------------------------------------------------------%n");

				// read one line from the input file
				start = System.currentTimeMillis();


				// read the name of a package category
				namePackageCategory = s.next();

				// read the description of a package category
				descriptionPackageCategory = s.next();


				// go to the next line
				s.nextLine();

				end = System.currentTimeMillis();

				System.out.printf(
						"Line %,d successfully read in %,d milliseconds.%n",
						l, end-start);


				// insert one line from the input file into the database
				start = System.currentTimeMillis();

				// insert the package category

				try {
					pstmtPackageCategory.setString(1, namePackageCategory);
					pstmtPackageCategory.setString(2, descriptionPackageCategory);

					pstmtPackageCategory.execute();

				} catch (SQLException e) {

					if (e.getSQLState().equals("23505")) {
						System.out
								.printf("Package category %s %s already inserted, skip it. [%s]%n",
										namePackageCategory, descriptionPackageCategory,
										e.getMessage());
					} else {
						System.out
								.printf("Unrecoverable error while inserting author %s %s:%n",
										namePackageCategory, descriptionPackageCategory);
						System.out.printf("- Message: %s%n", e.getMessage());
						System.out.printf("- SQL status code: %s%n", e.getSQLState());
						System.out.printf("- SQL error code: %s%n", e.getErrorCode());
						System.out.printf("%n");
					}
				}


				end = System.currentTimeMillis();

				System.out.printf(
						"Line %,d successfully inserted into the database in %,d milliseconds.%n%n",
						l, end-start);

				System.out.printf("Name of PackageCategory: %s", namePackageCategory);
				System.out.printf("\n");
				System.out.printf("Description of PackageCategory: %s", descriptionPackageCategory);
				System.out.printf("\n");

			}
		} finally {

			// close the scanner and the input file
			s.close();

			System.out.printf("%nInput file successfully closed.%n");

			try {

				// close the statements
				if (pstmtPackageCategory != null) {

					start = System.currentTimeMillis();

					pstmtPackageCategory.close();

					end = System.currentTimeMillis();

					System.out
							.printf("Prepared statements successfully closed in %,d milliseconds.%n",
									end-start);

				}


				// close the connection to the database
				if(con != null) {

					start = System.currentTimeMillis();

					con.close();

					end = System.currentTimeMillis();

					System.out
							.printf("Connection successfully closed in %,d milliseconds.%n",
									end-start);

				}

				System.out.printf("Resources successfully released.%n");

			} catch (SQLException e) {
				System.out.printf("Error while releasing resources:%n");

				// cycle in the exception chain
				while (e != null) {
					System.out.printf("- Message: %s%n", e.getMessage());
					System.out.printf("- SQL status code: %s%n", e.getSQLState());
					System.out.printf("- SQL error code: %s%n", e.getErrorCode());
					System.out.printf("%n");
					e = e.getNextException();
				}
			}

		}

	}
}