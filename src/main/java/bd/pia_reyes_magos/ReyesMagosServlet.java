package bd.pia_reyes_magos;

import java.io.*;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import modelo.*;

@WebServlet(name = "reyesMagosServlet", value = "/reyes-magos-servlet")
public class ReyesMagosServlet extends HttpServlet {
    AccesoDatos ad = new AccesoDatos();
    String tabla = null;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response){
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html; charset=UTF-8");
        String accion = request.getParameter("accion");
        if (request.getParameter("btnagregar") != null)
            accion = "agregar";
        if (accion == null)
            accion = "listar";
        switch (accion) {
            case "agregar":
                irAgregarAlgo(request, response);
                break;
            case "editar":
                obtenerUno(request, response);
                break;
            case "eliminar":
                borrarAlgo(request, response);
                break;
            case "agregarBDbarrio":
                tabla = "barrio";
                agregarAlgo(request, response);
                break;
            case "agregarBDvecino":
                tabla = "vecino";
                agregarAlgo(request, response);
                break;
            case "agregarBDevento":
                tabla = "evento";
                agregarAlgo(request, response);
                break;
            case "agregarBDnino":
                tabla = "nino";
                agregarAlgo(request, response);
                break;
            case "editarBDbarrio":
                tabla = "barrio";
                editarAlgo(request, response);
                break;
            case "editarBDvecino":
                tabla = "vecino";
                editarAlgo(request, response);
                break;
            case "editarBDevento":
                tabla = "evento";
                editarAlgo(request, response);
                break;
            case "editarBDnino":
                tabla = "nino";
                editarAlgo(request, response);
                break;
            default:
                tabla = request.getParameter("tabla");
                if (tabla == null)
                    tabla = "ninguno";
                mostrarTabla(request, response);
        }
    }

    public void mostrarTabla(HttpServletRequest request, HttpServletResponse response) {
        List<String> atributos;
        switch (tabla) {
            case "barrio":
                List<Barrio> listaBarrios = ad.listarBarrios();
                atributos = ad.obtenerAtributosBarrio();
                request.setAttribute("lista", listaBarrios);

                break;
            case "vecino":
                List<Vecino> listaVecinos = ad.listarVecinos();
                atributos = ad.obtenerAtributosVecino();
                request.setAttribute("lista", listaVecinos);
                break;
            case "evento":
                List<Evento> listaEventos = ad.listarEventos();
                atributos = ad.obtenerAtributosEvento();
                request.setAttribute("lista", listaEventos);
                break;
            case "nino":
                List<Nino> listaNinos = ad.listarNinos();
                atributos = ad.obtenerAtributosNino();
                request.setAttribute("lista", listaNinos);
                break;
            default:
                atributos = Collections.singletonList("Nada por mostrar");
        }
        request.setAttribute("atributosLista", atributos);
        request.setAttribute("tabla", tabla);
        RequestDispatcher desp = request.getRequestDispatcher("/WEB-INF/listar.jsp");
        try {
            desp.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void irAgregarAlgo(HttpServletRequest request, HttpServletResponse response) {
        tabla = request.getParameter("tabla");
        if (tabla == null)
            tabla = "ninguna";
        switch (tabla) {
            case "barrio":
                request.setAttribute("listaMunicipios", ad.listarMunicipios());
                request.setAttribute("listaComunidades", ad.listarComunidadesAutonomas());
                System.out.println(tabla);
                break;
            case "vecino":
                request.setAttribute("listaGrupos", ad.listarGrupos());
                break;
            case "evento":
                request.setAttribute("listaGrupos", ad.listarGrupos());
                request.setAttribute("listaBarrios", ad.listarBarrios());
                break;
            case "nino":
                request.setAttribute("listaRegalos", ad.listarRegalos());
                request.setAttribute("listaBarrios", ad.listarBarrios());
                request.setAttribute("listaEventos", ad.listarEventos());
            default:
        }
        request.setAttribute("tabla", tabla);
        RequestDispatcher desp = request.getRequestDispatcher("/WEB-INF/agregar.jsp");
        try {
            desp.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void agregarAlgo(HttpServletRequest request, HttpServletResponse response) {
        switch (tabla) {
            case "barrio":
                String nombre_barrio = request.getParameter("nombre_barrio");
                int id_municipio = Integer.parseInt(request.getParameter("municipio"));
                ad.agregarBarrio(nombre_barrio, id_municipio);
                break;
            case "vecino":
                String dni_vecino = request.getParameter("dni_vecino_num") + request.getParameter("dni_vecino_let");
                String nombre_vecino = request.getParameter("nombre_vecino");
                String paterno_vecino = request.getParameter("paterno_vecino");
                String materno_vecino = request.getParameter("materno_vecino");
                int id_rey_mago = Integer.parseInt(request.getParameter("rey_mago"));
                int id_grupo = Integer.parseInt(request.getParameter("id_grupo"));
                ad.agregarVecino(dni_vecino, nombre_vecino, paterno_vecino, materno_vecino, id_rey_mago, id_grupo);
                break;
            case "evento":
                String fecha_hora = request.getParameter("fecha_hora");
                String calle_numero = request.getParameter("calle") + ' ' + request.getParameter("numero");
                int id_grupo_ev = Integer.parseInt(request.getParameter("id_grupo"));
                int id_barrio_ev = Integer.parseInt(request.getParameter("id_barrio"));
                ad.agregarEvento(fecha_hora, calle_numero, id_grupo_ev, id_barrio_ev);
                break;
            case "nino":
                String nombre = request.getParameter("nombre_nino");
                String ap_pat = request.getParameter("paterno_nino");
                String ap_mat = request.getParameter("materno_nino");
                String calle_num = request.getParameter("calle") + ' ' + request.getParameter("numero");
                int id_rey_mago_nino = Integer.parseInt(request.getParameter("rey_mago"));
                int id_regalo = Integer.parseInt(request.getParameter("id_regalo"));
                int id_barrio = Integer.parseInt(request.getParameter("id_barrio"));
                int id_evento = Integer.parseInt(request.getParameter("id_evento"));
                ad.agregarNino(nombre, ap_pat, ap_mat, calle_num, id_rey_mago_nino, id_regalo, id_barrio, id_evento);
                break;
            default:
        }
        mostrarTabla(request, response);
    }

    public void obtenerUno(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("tabla", tabla);
        String id = request.getParameter("id");
        switch (tabla) {
            case "barrio":
                request.setAttribute("barrio", ad.obtenerBarrio(Integer.parseInt(id)));
                break;
            case "vecino":
                request.setAttribute("listaGrupos", ad.listarGrupos());
                request.setAttribute("vecino", ad.obtenerVecino(id));
                break;
            case "evento":
                request.setAttribute("listaGrupos", ad.listarGrupos());
                request.setAttribute("listaBarrios", ad.listarBarrios());
                request.setAttribute("evento", ad.obtenerEvento(Integer.parseInt(id)));
            case "nino":
                request.setAttribute("nino", ad.obtenerNino(Integer.parseInt(id)));
                break;
            default:
        }
        RequestDispatcher desp = request.getRequestDispatcher("/WEB-INF/editar.jsp");
        try {
            desp.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void editarAlgo(HttpServletRequest request, HttpServletResponse response) {
        switch (tabla) {
            case "barrio":
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre_barrio = request.getParameter("nombre_barrio");
                ad.editarBarrio(id, nombre_barrio);
                break;
            case "vecino":
                String nombre_vecino = request.getParameter("nombre_vecino");
                String paterno_vecino = request.getParameter("paterno_vecino");
                String materno_vecino = request.getParameter("materno_vecino");
                int id_rey_mago = Integer.parseInt(request.getParameter("rey_mago"));
                int id_grupo = Integer.parseInt(request.getParameter("id_grupo"));
                ad.editarVecino(request.getParameter("id"), nombre_vecino, paterno_vecino, materno_vecino, id_rey_mago, id_grupo);
                break;
            case "evento":
                int id_evento = Integer.parseInt(request.getParameter("id"));
                String fecha_hora = request.getParameter("fecha_hora");
                ad.editarEvento(id_evento, fecha_hora);
                break;
            case "nino":
                int id_nino = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre_nino");
                String ap_pat = request.getParameter("paterno_nino");
                String ap_mat = request.getParameter("materno_nino");
                int id_rey = Integer.parseInt(request.getParameter("rey_mago"));
                ad.editarNino(id_nino, nombre, ap_pat, ap_mat, id_rey);
                break;
            default:
        }
        mostrarTabla(request, response);
    }

    public void borrarAlgo(HttpServletRequest request, HttpServletResponse response) {
        switch (tabla) {
            case "barrio":
                int id_barrio = Integer.parseInt(request.getParameter("id"));
                ad.borrarBarrio(id_barrio);
                break;
            case "vecino":
                String dni_vecino = request.getParameter("id");
                ad.borrarVecino(dni_vecino);
                break;
            case "evento":
                int id_evento = Integer.parseInt(request.getParameter("id"));
                ad.borrarEvento(id_evento);
                break;
            case "nino":
                int id_nino = Integer.parseInt(request.getParameter("id"));
                ad.borrarNino(id_nino);
                break;
            default:
        }
        mostrarTabla(request, response);
    }

    public void destroy() {
    }
}