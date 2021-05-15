package modelo;

import bd.utiles.ConexionBD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AccesoDatos {
    public List<Barrio> listarBarrios() {
        List<Barrio> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_barrio, nombre_barrio, nombre_municipio, nombre_comunidad_autonoma " +
                "FROM barrio " +
                "INNER JOIN municipio " +
                "ON(barrio.id_barrio = municipio.id_municipio) " +
                "INNER JOIN comunidad_autonoma " +
                "ON(barrio.id_comunidad_autonoma = comunidad_autonoma.id_comunidad_autonoma)";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Barrio barrio = new Barrio();
                barrio.setId_barrio(res.getInt("id_barrio"));
                barrio.setNombre_barrio(res.getString("nombre_barrio"));
                barrio.setNombre_municipio(res.getString("nombre_municipio"));
                barrio.setNombre_comunidad_autonoma(res.getString("nombre_comunidad_autonoma"));
                lista.add(barrio);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        finally {
            try {
                if(!cnxObtenida.isClosed())
                    cnxObtenida.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return lista;
    }
}
