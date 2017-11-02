/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clienetFTP;

import java.io.FileInputStream;
import java.io.IOException;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

/**
 *
 * @author Manuelert5-Acer
 */
public class clienteFtp {

    FTPClient client = new FTPClient();

    public boolean conecta() {
        boolean login = false;
        // Datos para conectar al servidor FTP
        String host = "localhost"; // También puede ir la IP
        String usuario = "desarrolloWeb";
        String password = "123";

        try {
            // Conactando al servidor
            client.connect(host);
            // Logueado un usuario (true = pudo conectarse, false = no pudo conectarse
            login = client.login(usuario, password);
        } catch (Exception e) {
            login = false;
        }

        return login;

    }

    public void desconecta() {
        try {
            // Cerrando sesión
            client.logout();

            // Desconectandose con el servidor
            client.disconnect();
        } catch (Exception e) {

        }

    }

    public void subirArchivo(String IDcatalago, String nombreArchivo) {
        // Creando nuestro objeto ClienteFTP

        try {

            client.setFileType(FTP.BINARY_FILE_TYPE);
            client.setFileTransferMode(FTP.BINARY_FILE_TYPE);
            client.enterLocalPassiveMode();

            String path = "C:\\Users\\Manuelert5-Acer\\Documents\\NetBeansProjects\\carita feliz\\" + nombreArchivo;

            FileInputStream archivo = new FileInputStream(path);

            // Guardando el archivo en el servidor
            client.storeFile(IDcatalago+"/"+nombreArchivo, archivo);

        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }

    }

    public void creaDirectorio(String carpeta) {
        try {
            client.makeDirectory("/" + carpeta);
        } catch (Exception e) {

        }
    }

}
