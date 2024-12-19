package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SingletonConnection {
    // Configuration intégrée
    private static final String URL = "jdbc:mysql://localhost:3306/hotel";
    private static final String USER = "root"; 
    private static final String PASSWORD = "nermine1234";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";


    // Objet Connection
    private static Connection connect;

    // Constructeur privé
    private SingletonConnection() {
        try {
        	 Class.forName(DB_DRIVER);
            connect = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connexion établie avec succès !");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erreur lors de la connexion à la base de données");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    // Méthode qui retourne l’instance et la crée si elle n'existe pas
    public static Connection getInstance() {
        if (connect == null) {
            new SingletonConnection();
        }
        return connect;
    }
}
