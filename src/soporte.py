import pandas as pd
import numpy as np
import mysql.connector


class Cargar:
    
    ''' 
    Una clase para cargar datos en una base de datos de MySQL.
    
    Atributos:
    nombre_bbdd: string
    - el nombre de la base de datos que creamos
    contraseña: string
    - la contraseña para conectar con MySQL
    
    Metodos
    crear_bbdd()
    - crea una base de datos en MySQL
    
    crear_insertar_tabla(query)
    - acepta una query de MySQL y segun ella, crea una tabla o inserta datos en una tabla en una base de datos en MySQL
    
    devolver_datos(query)
    - acepta una query de MySQL tipo SELECT y segun ella devuelve datos en forma de dataframe
    '''
    
    def __init__(self, nombre_bbdd, contraseña):
        
        ''' 
        Construye los atributos necesarios para el objeto de cargar datos en MySQL.
        
        Parametros:
        nombre_bbdd: string
        - el nombre de la base de datos que creamos
        contraseña: string
        - la contraseña para conectar con MySQL
        '''
        
        self.nombre_bbdd = nombre_bbdd
        self.contraseña = contraseña
        
        
    def crear_bbdd(self):
    
        '''
        Crea una base de datos nombrado segun el nombre guardado como atributo de la clase.
        Si la conexion falla o si la base de datos ya existe, devuelve un mensaje de error.
        
        Parametros:
        - string del nombre que poner a la base de datos
        - string con la contraseña de MySQL
        
        Returns:
        - none
        '''
        
        conexion = mysql.connector.connect(host="localhost",
                                        user="root",
                                        password=self.contraseña)
                                        
        print("La conexión a MySQL se ha realizado con exito.")
        
        cursor = conexion.cursor()

        try:
            cursor.execute(f"CREATE DATABASE IF NOT EXISTS {self.nombre_bbdd};")
            print(cursor)
        except mysql.connector.Error as err:
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
            
            
    def crear_insertar_tabla(self, query):
    
        '''
        Acepta tres strings: el nombre de la base de datos, la contraseña de MySQL y una
        query para crear una tabla en la base de datos indicado o para insertar datos en una
        tabla de esa bbdd. Si la conexion falla o si la tabla ya existe, devuelve un mensaje de error.
        
        Parametros:
        - string: nombre de la base de datos
        - string: contraseña para MySQL
        - string: query de creacion de tabla o insercion de datos
        
        Returns:
        - none
        '''
        
        conexion = mysql.connector.connect(user='root', password=self.contraseña,
                                        host='127.0.0.1', database=self.nombre_bbdd)
        cursor = conexion.cursor()
        
        try: 
            cursor.execute(query)
            conexion.commit() 

        except mysql.connector.Error as err:
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)
                
    
    def devolver_datos(self, query):
    
        ''' 
        Acepta el nombre de una base de datos, la contraseña de MySQL, y una query de SELECT de MySQL, y devuelve un
        dataframe con los resultados del query. Si no funcion devuelve un mensaje de error.
        
        Parametros:
        - string: nombre de una base de datos existente en MySQL
        - string: contraseña de MySQL
        - string: query tipo SELECT de MySQL
        '''
        
        conexion = mysql.connector.connect(user='root', password=self.contraseña,
                                        host='127.0.0.1', database=self.nombre_bbdd)
        
        try: 
            return pd.read_sql_query(query, conexion)
        
        except mysql.connector.Error as err:
            print(err)
            print("Error Code:", err.errno)
            print("SQLSTATE", err.sqlstate)
            print("Message", err.msg)  
            
    def sacar_id(self, columna_id, columna_valor, tabla, valor):
        
        mydb = mysql.connector.connect(user='root',
                                       password= f'{self.contraseña}',
                                       host='127.0.0.1', 
                                       database=f"{self.nombre_bbdd}")
        mycursor = mydb.cursor()
        
        try:
            query_sacar_id = f"SELECT {columna_id} FROM {tabla} WHERE {columna_valor} = '{valor}'"
            mycursor.execute(query_sacar_id)
            id_ = mycursor.fetchall()[0][0]
            return id_
        
        except: 
            return f"Sorry, no tenemos el valor {valor} en la BBDD y por lo tanto no te podemos dar su id. "