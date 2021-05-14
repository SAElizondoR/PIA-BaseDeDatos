package utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    final String controladorBD = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    final String localizadorBD = "jdbc:sqlserver://localhost:1433";
    final String nombreBD = "ReyesMagos";
    final String usuarioBD = "sa";
    final String contraBD = "Sergio2002!";
    private Connection con;

    public void crearConexion() {
        try {
            Class.forName(controladorBD);
            this.con = DriverManager.getConnection(
                    localizadorBD + ";databaseName=" + nombreBD,
                    usuarioBD, contraBD
            );
        }
        catch (ClassNotFoundException ecne) {
            System.out.println("Clase no encontrada: " + ecne);
        }
        catch (SQLException esql) {
            System.out.println("Excepción de SQL: " + esql);
        }
    }
}
