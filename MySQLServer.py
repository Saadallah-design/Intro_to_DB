
import os
# the dotenv is a python library which reads env vars
from dotenv import load_dotenv
import mysql.connector 
from mysql.connector import errorcode

load_dotenv()

# --- Connection Parameters for the MySQL Server ---
SERVER_CONN_CONFIG = {
    "host": os.getenv("MYSQL_HOST"),
    "port": os.getenv("MYSQL_PORT"),
    "user": os.getenv("MYSQL_USER"),
    "password": os.getenv("MYSQL_PASSWORD")
}

NEW_DATABASE_NAME = "alx_book_store" # The database name
DB_CREATE_SQL = f"CREATE DATABASE IF NOT EXISTS alx_book_store"


# this function will take the SERVER_CONN_CONFIG to connect to mysql and NEW_DATABASE_NAME
def create_database(config, db_name):
    # trying to connect to the server and creating a database if it doesn't exist
    # setting up the var connection to None as initialize
    connection = None

    # DIAGNOSTIC PRINT 
    # print("\n--- Diagnostic Start ---")
    # print(f"Attempting connection to: {config['host']}:{config['port']}")
    # print(f"Using user: {config['user']}")
    # Do NOT print the password!

    # trying the try catch block for error in connection

    try: 
        # 1. Connect to the MySQL server (not a specific database)
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()

        # 2. Execute the CREATE DATABASE IF NOT EXISTS command
        cursor.execute(DB_CREATE_SQL)

        success_message = f'Database {db_name} created successfully!'
        print(success_message)

    except mysql.connector.Error as err:
        # Handle the error if the server itself cannot be reached
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("❌ Access denied. Check your username or password.")
        elif err.errno == errorcode.CR_CONN_ERROR:
            print("❌ Connection failed. Is your MySQL server running?")
        else:
            print(f"❌ An unexpected error occurred: {err}")

    finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()

    # --- Main Execution ---
print(f"Attempting to set up database '{NEW_DATABASE_NAME}'...")
create_database(SERVER_CONN_CONFIG, NEW_DATABASE_NAME)