package elementos_sistemas;

/**
 *
 * @author Manuelert5-Acer
 */
public class persona {
    public int id;
    public int rol;
    public String nombre;
    public String email;
    public int id_orden_dedicacion;
    
    
    
    public persona(){};

    public persona(int id, int rol, String nombre, String email) {
        this.id = id;
        this.rol = rol;
        this.nombre = nombre;
        this.email = email;
    }

    public int getId_orden_dedicacion() {
        return id_orden_dedicacion;
    }

    public void setId_orden_dedicacion(int id_orden_dedicacion) {
        this.id_orden_dedicacion = id_orden_dedicacion;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    


}
