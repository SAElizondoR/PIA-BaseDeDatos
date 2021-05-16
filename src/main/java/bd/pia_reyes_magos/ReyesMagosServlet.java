package bd.pia_reyes_magos;

import java.io.*;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import modelo.AccesoDatos;
import modelo.Barrio;
import modelo.Evento;
import modelo.Vecino;

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
        tabla = request.getParameter("tabla");
        if (tabla == null)
            tabla = "ninguno";
        mostrarTabla(request, response);

        /* RequestDispatcher desp = request.getRequestDispatcher("/WEB-INF/listar.jsp");
        try {
            desp.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        } */
    }

    public void mostrarTabla(HttpServletRequest request, HttpServletResponse response) {
        List<String> atributos = null;
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

    public void destroy() {
    }
}