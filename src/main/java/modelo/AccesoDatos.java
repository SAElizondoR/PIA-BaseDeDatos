package modelo;

import bd.utiles.ConexionBD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
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

    public List<String> obtenerAtributosBarrio() {
        return Arrays.asList("Barrio", "Municipio", "Comunidad autónoma");
    }

    public List<Vecino> listarVecinos() {
        List<Vecino> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT dni_vecino, " +
                "CONCAT_WS(' ',nombre_vecino,apellido_paterno_vecino,apellido_materno_vecino) AS nombre, nombre_rey_mago, " +
                "grupo.id_grupo " +
                "FROM vecino " +
                "INNER JOIN rey_mago " +
                "ON(vecino.id_rey_mago = rey_mago.id_rey_mago) " +
                "INNER JOIN grupo " +
                "ON(vecino.id_grupo = grupo.id_grupo)";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Vecino vecino = new Vecino();
                vecino.setDni_vecino(res.getString("dni_vecino"));
                vecino.setNombre_vecino(res.getString("nombre"));
                vecino.setRey_mago(res.getString("nombre_rey_mago"));
                vecino.setId_grupo(res.getInt("id_grupo"));
                lista.add(vecino);
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

    public List<String> obtenerAtributosVecino() {
        return Arrays.asList("DNI", "Nombre", "Rey mago al que representa", "ID del grupo");
    }

    public List<Evento> listarEventos() {
        List<Evento> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT * FROM eventos_programados";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Evento evento = new Evento();
                evento.setFecha_hora(res.getString("fecha_hora"));
                evento.setCalle_numero(res.getString("calle_numero"));
                evento.setId_grupo(res.getInt("id_grupo"));
                evento.setNombre_barrio(res.getString("nombre_barrio"));
                evento.setNombre_municipio(res.getString("nombre_municipio"));
                lista.add(evento);
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

    public List<String> obtenerAtributosEvento() {
        return Arrays.asList("Fecha y hora", "Calle y numero", "ID del grupo organizador", "Barrio", "Municipio");
    }
}
