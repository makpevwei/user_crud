import pymysql
from db_config import mysql
from werkzeug import generate_password_hash, check_password_hash
    
class UserBean:
    
    name = ""
    email = ""
    password = ""
    

class UserDAO:
    
    @classmethod
    def addUserRecord(cls, u=UserBean()):
        try:
            hpassword = generate_password_hash(u.password)
            
            sql = "INSERT INTO tbl_user(user_name, user_email, user_password) VALUES(%s, %s, %s)"
            data = (u.name, u.email, hpassword,)
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.execute(sql, data)
            conn.commit()
            return 0
        except Exception as e:
            print(e)
        finally:
            cursor.close() 
            conn.close()
            

u=UserBean()
u.name = "Samson"
u.email = "samson@yhaoo.xom"
u.password = "0400"

r = UserDAO.addUserRecord(u)
print("Response: ",r)
