import mysql.connector
import os

mydb = mysql.connector.connect(
    host="db",
    user=os.environ.get('USERNAME_DB'),
    password=os.environ.get('PASSWORD_DB'),
    database="db",
    port=3306
)


def dispose():
    if mydb.is_connected():
        mydb.close()
        print("MySQL connection is closed")
