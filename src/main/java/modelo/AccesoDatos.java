package modelo;

import bd.utiles.ConexionBD;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class AccesoDatos {
    public List<Barrio> listarBarrios() {
        List<Barrio> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_barrio, nombre_barrio, nombre_municipio, nombre_comunidad_autonoma " +
                "FROM barrio " +
                "INNER JOIN municipio " +
                "ON(barrio.id_municipio = municipio.id_municipio) " +
                "INNER JOIN comunidad_autonoma " +
                "ON(municipio.id_comunidad_autonoma = comunidad_autonoma.id_comunidad_autonoma)";
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

    public Barrio obtenerBarrio(int id) {
        Barrio barrio = new Barrio();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_barrio, nombre_barrio, id_municipio " +
                "FROM barrio " +
                "WHERE id_barrio = ?";
        try(PreparedStatement dec = cnxObtenida.prepareStatement(consulta)) {
            dec.setInt(1, id);
            ResultSet res = dec.executeQuery();
            res.next();
            barrio.setId_barrio(id);
            barrio.setNombre_barrio(res.getString("nombre_barrio"));
            barrio.setId_municipio(res.getInt("id_municipio"));
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
        return barrio;
    }


    public List<String> obtenerAtributosBarrio() {
        return Arrays.asList("Barrio", "Municipio", "Comunidad autónoma");
    }

    public void agregarBarrio(String nombre_barrio, int id_municipio) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "INSERT INTO barrio(nombre_barrio, id_municipio) " +
                "VALUES(?,?)";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, nombre_barrio);
            sta.setInt(2, id_municipio);
            sta.executeUpdate();
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
    }

    public void editarBarrio(int id_barrio, String nombre_barrio) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "UPDATE barrio " +
                "SET nombre_barrio = ? " +
                "WHERE id_barrio = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, nombre_barrio);
            sta.setInt(2, id_barrio);
            sta.executeUpdate();
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
    }

    public void borrarBarrio(int id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "DELETE FROM barrio " +
                "WHERE id_barrio = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setInt(1, id);
            sta.executeUpdate();
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
    }

    public List<Municipio> listarMunicipios() {
        List<Municipio> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_municipio, nombre_municipio " +
                "FROM municipio";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Municipio mun = new Municipio();
                mun.setId_municipio(res.getInt("id_municipio"));
                mun.setNombre_municipio(res.getString("nombre_municipio"));
                lista.add(mun);
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

    public List<ComunidadAutonoma> listarComunidadesAutonomas() {
        List<ComunidadAutonoma> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_comunidad_autonoma, nombre_comunidad_autonoma " +
                "FROM comunidad_autonoma";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                ComunidadAutonoma com = new ComunidadAutonoma();
                com.setId_comunidad_autonoma(res.getInt("id_comunidad_autonoma"));
                com.setNombre_comunidad_autonoma(res.getString("nombre_comunidad_autonoma"));
                lista.add(com);
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

    public List<Regalo> listarRegalos() {
        List<Regalo> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_regalo, nombre_regalo " +
                "FROM regalo";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Regalo regalo = new Regalo();
                regalo.setId_regalo(res.getInt("id_regalo"));
                regalo.setNombre_regalo(res.getString("nombre_regalo"));
                lista.add(regalo);
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

    public List<Grupo> listarGrupos() {
        List<Grupo> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT id_grupo, numero_integrantes_grupo, id_barrio " +
                "FROM grupo";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Grupo grupo = new Grupo();
                grupo.setId_grupo(res.getInt("id_grupo"));
                grupo.setNumero_integrantes_grupo(res.getInt("numero_integrantes_grupo"));
                grupo.setId_barrio(res.getInt("id_barrio"));
                lista.add(grupo);
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

    public Vecino obtenerVecino(String id) {
        Vecino vecino = new Vecino();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT dni_vecino, nombre_vecino, apellido_paterno_vecino, apellido_materno_vecino, " +
                "id_rey_mago, id_grupo " +
                "FROM vecino " +
                "WHERE dni_vecino = ?";
        try(PreparedStatement dec = cnxObtenida.prepareStatement(consulta)) {
            dec.setString(1, id);
            ResultSet res = dec.executeQuery();
            res.next();
            vecino.setDni_vecino(res.getString("dni_vecino"));
            vecino.setNombre_vecino(res.getString("nombre_vecino"));
            vecino.setApellido_paterno_vecino(res.getString("apellido_paterno_vecino"));
            vecino.setApellido_materno_vecino(res.getString("apellido_materno_vecino"));
            vecino.setId_rey_mago(res.getInt("id_rey_mago"));
            vecino.setId_grupo(res.getInt("id_grupo"));
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
        return vecino;
    }

    public List<String> obtenerAtributosVecino() {
        return Arrays.asList("DNI", "Nombre", "Rey mago al que representa", "ID del grupo");
    }

    public void agregarVecino(String dni_vecino, String nombre, String apellido_pat, String apellido_mat, int id_rey_mago, int id_grupo) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "INSERT INTO vecino(dni_vecino, nombre_vecino, apellido_paterno_vecino, apellido_materno_vecino, id_rey_mago, id_grupo) " +
                "VALUES(?,?,?,?,?,?)";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, dni_vecino);
            sta.setString(2, nombre);
            sta.setString(3, apellido_pat);
            sta.setString(4, apellido_mat);
            sta.setInt(5, id_rey_mago);
            sta.setInt(6, id_grupo);
            sta.executeUpdate();
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
    }

    public void editarVecino(String dni_vecino, String nombre, String apellido_pat, String apellido_mat, int id_rey_mago, int id_grupo) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "UPDATE vecino " +
                "SET nombre_vecino = ?, apellido_paterno_vecino = ?, apellido_materno_vecino = ?, id_rey_mago = ?, id_grupo = ? " +
                "WHERE dni_vecino = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, nombre);
            sta.setString(2, apellido_pat);
            sta.setString(3, apellido_mat);
            sta.setInt(4, id_rey_mago);
            sta.setInt(5, id_grupo);
            sta.setString(6, dni_vecino);
            sta.executeUpdate();
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
    }

    public void borrarVecino(String id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "DELETE FROM vecino " +
                "WHERE dni_vecino = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, id);
            sta.executeUpdate();
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
    }



    public List<Nino> listarNinos() {
        List<Nino> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT * FROM nino " +
                "INNER JOIN barrio as b on nino.id_barrio = b.id_barrio " +
                "INNER JOIN evento as e on nino.id_evento = e.id_evento " +
                "INNER JOIN rey_mago as rm on nino.id_rey_mago = rm.id_rey_mago " +
                "INNER JOIN regalo as r2 on nino.id_regalo = r2.id_regalo";
        try(Statement dec = cnxObtenida.createStatement()) {
            ResultSet res = dec.executeQuery(consulta);
            while (res.next()) {
                Nino nino = new Nino();
                nino.setId_nino(res.getInt("id_nino"));
                nino.setNombre_nino(res.getString("nombre_nino"));
                nino.setApellido_paterno_nino(res.getString("apellido_paterno_nino"));
                nino.setApellido_materno_nino(res.getString("apellido_materno_nino"));
                nino.setNombre_completo(nino.getNombre_nino() + ' ' + nino.getApellido_paterno_nino() + ' '
                + nino.getApellido_materno_nino());
                nino.setCalle_numero(res.getString("calle_numero"));
                nino.setId_rey_mago(res.getInt("id_rey_mago"));
                nino.setNombre_rey_mago(res.getString("nombre_rey_mago"));
                nino.setId_regalo(res.getInt("id_regalo"));
                nino.setNombre_regalo(res.getString("nombre_regalo"));
                nino.setId_barrio(res.getInt("id_barrio"));
                nino.setNombre_barrio(res.getString("nombre_barrio"));
                nino.setId_evento(res.getInt("id_evento"));
                lista.add(nino);
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

    public Nino obtenerNino(int id) {
        Nino nino = new Nino();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT * " +
                "FROM nino " +
                "WHERE id_nino = ?";
        try(PreparedStatement dec = cnxObtenida.prepareStatement(consulta)) {
            dec.setInt(1, id);
            ResultSet res = dec.executeQuery();
            res.next();
            nino.setId_nino(res.getInt("id_nino"));
            nino.setNombre_nino(res.getString("nombre_nino"));
            nino.setApellido_paterno_nino(res.getString("apellido_paterno_nino"));
            nino.setApellido_materno_nino(res.getString("apellido_materno_nino"));
            nino.setCalle_numero(res.getString("calle_numero"));
            nino.setId_rey_mago(res.getInt("id_rey_mago"));
            nino.setId_regalo(res.getInt("id_regalo"));
            nino.setId_barrio(res.getInt("id_barrio"));
            nino.setId_evento(res.getInt("id_evento"));
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
        return nino;
    }

    public List<String> obtenerAtributosNino() {
        return Arrays.asList("Nombre", "Calle y numero", "Rey mago al que pidio", "Regalo", "Barrio", "ID evento");
    }

    public void agregarNino(String nombre, String ap_pat, String ap_mat, String calle_num, int id_rey,
                            int id_regalo, int id_barrio, int id_evento) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "INSERT INTO nino(nombre_nino, apellido_paterno_nino, apellido_materno_nino, calle_numero, id_rey_mago, id_regalo, id_barrio, id_evento) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, nombre);
            sta.setString(2, ap_pat);
            sta.setString(3, ap_mat);
            sta.setString(4, calle_num);
            sta.setInt(5, id_rey);
            sta.setInt(6, id_regalo);
            sta.setInt(7, id_barrio);
            sta.setInt(8, id_evento);
            sta.executeUpdate();
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
    }

    public void editarNino(int id_nino, String nombre, String ap_pat, String ap_mat, int id_rey_mago) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "UPDATE nino " +
                "SET nombre_nino = ?, apellido_paterno_nino = ?, apellido_materno_nino = ?, id_rey_mago = ? " +
                "WHERE id_nino = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, nombre);
            sta.setString(2, ap_pat);
            sta.setString(3, ap_mat);
            sta.setInt(4, id_rey_mago);
            sta.setInt(5, id_nino);
            sta.executeUpdate();
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

    }

    public void borrarNino(int id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "DELETE FROM nino " +
                "WHERE id_nino = ?";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setInt(1, id);
            sta.executeUpdate();
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
                evento.setId_evento(res.getInt("id_evento"));
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

    public Evento obtenerEvento(int id) {
        Evento evento = new Evento();
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "SELECT * " +
                "FROM eventos_programados " +
                "WHERE id_evento = ?";
        try(PreparedStatement dec = cnxObtenida.prepareStatement(consulta)) {
            dec.setInt(1, id);
            ResultSet res = dec.executeQuery();
            res.next();
            evento.setId_evento(id);
            evento.setFecha_hora(res.getString("fecha_hora"));
            evento.setCalle_numero(res.getString("calle_numero"));
            evento.setId_grupo(res.getInt("id_grupo"));
            evento.setNombre_barrio(res.getString("nombre_barrio"));
            evento.setNombre_municipio(res.getString("nombre_municipio"));
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
        return evento;
    }

    public List<String> obtenerAtributosEvento() {
        return Arrays.asList("ID", "Fecha y hora", "Calle y numero", "ID del grupo organizador", "Barrio", "Municipio");
    }

    public void agregarEvento(String fecha_hora, String calle_numero, int id_grupo, int id_barrio) {
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        Date fecha;
        try {
            fecha = format1.parse(fecha_hora);
        } catch (ParseException e) {
            e.printStackTrace();
            return;
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String fechaString = format.format(fecha);

        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        String consulta = "INSERT INTO evento(fecha_hora, calle_numero, id_grupo, id_barrio) " +
                "VALUES(?,?,?,?)";
        try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
            sta.setString(1, fechaString);
            sta.setString(2, calle_numero);
            sta.setInt(3, id_grupo);
            sta.setInt(4, id_barrio);
            sta.executeUpdate();
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
    }

    public void editarEvento(int id_evento, String fecha_hora) {
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
        try {
            // System.out.println(fecha_hora);
            Date fecha = format1.parse(fecha_hora);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String fechaString = format.format(fecha);
            ConexionBD con = new ConexionBD();
            Connection cnxObtenida = con.crearConexion();
            String consulta = "UPDATE evento " +
                    "SET fecha_hora = ? " +
                    "WHERE id_evento = ?";
            try(PreparedStatement sta = cnxObtenida.prepareStatement(consulta)) {
                sta.setString(1, fechaString);
                sta.setInt(2, id_evento);
                sta.executeUpdate();
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
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

    public void borrarEvento(int id) {
        ConexionBD con = new ConexionBD();
        Connection cnxObtenida = con.crearConexion();
        try(CallableStatement sta = cnxObtenida.prepareCall("{call BorrarFilaEvento(?)}")) {
            sta.registerOutParameter(1, id);
            sta.execute();
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
    }
}
