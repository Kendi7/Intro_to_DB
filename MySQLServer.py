import mysql.connector

try:
    # Connect to MySQL server (no database yet)
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="23456789"
    )

    print("✅ Connected to MySQL server!")

    # Create a cursor object
    mycursor = mydb.cursor()

    # Create database if it doesn't exist
    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("🎉 Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print(f"❌ Error: {e}")

finally:
    # Close connection if it exists
    try:
        if mydb.is_connected():
            mydb.close()
            print("🔒 MySQL connection closed.")
    except NameError:
        # mydb was never created due to connection failure
        pass
