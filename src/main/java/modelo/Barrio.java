package modelo;

public class Barrio {
    private int id_barrio;
    private String nombre_barrio;
    private String nombre_municipio;
    private String nombre_comunidad_autonoma;
    private int id_municipio;

    public int getId_barrio() {
        return id_barrio;
    }

    public String getNombre_barrio() {
        return nombre_barrio;
    }

    public String getNombre_municipio() {
        return nombre_municipio;
    }

    public String getNombre_comunidad_autonoma() {
        return nombre_comunidad_autonoma;
    }

    public void setId_barrio(int id_barrio) {
        this.id_barrio = id_barrio;
    }

    public void setNombre_barrio(String nombre_barrio) {
        this.nombre_barrio = nombre_barrio;
    }

    public void setNombre_municipio(String nombre_municipio) {
        this.nombre_municipio = nombre_municipio;
    }

    public void setNombre_comunidad_autonoma(String nombre_comunidad_autonoma) {
        this.nombre_comunidad_autonoma = nombre_comunidad_autonoma;
    }

    public int getId_municipio() {
        return id_municipio;
    }

    public void setId_municipio(int id_municipio) {
        this.id_municipio = id_municipio;
    }
}
