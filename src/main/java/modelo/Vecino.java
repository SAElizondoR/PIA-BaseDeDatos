package modelo;

public class Vecino {
    private String dni_vecino;
    private String nombre_vecino;
    private String apellido_paterno_vecino;
    private String apellido_materno_vecino;
    private String rey_mago;
    private int id_rey_mago;
    private int id_grupo;

    public String getDni_vecino() {
        return dni_vecino;
    }

    public void setDni_vecino(String dni_vecino) {
        this.dni_vecino = dni_vecino;
    }

    public String getNombre_vecino() {
        return nombre_vecino;
    }

    public void setNombre_vecino(String nombre_vecino) {
        this.nombre_vecino = nombre_vecino;
    }

    public String getRey_mago() {
        return rey_mago;
    }

    public void setRey_mago(String rey_mago) {
        this.rey_mago = rey_mago;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getApellido_paterno_vecino() {
        return apellido_paterno_vecino;
    }

    public void setApellido_paterno_vecino(String apellido_paterno_vecino) {
        this.apellido_paterno_vecino = apellido_paterno_vecino;
    }

    public String getApellido_materno_vecino() {
        return apellido_materno_vecino;
    }

    public void setApellido_materno_vecino(String apellido_materno_vecino) {
        this.apellido_materno_vecino = apellido_materno_vecino;
    }

    public int getId_rey_mago() {
        return id_rey_mago;
    }

    public void setId_rey_mago(int id_rey_mago) {
        this.id_rey_mago = id_rey_mago;
    }
}
