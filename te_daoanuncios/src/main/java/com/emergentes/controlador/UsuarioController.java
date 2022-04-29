package com.emergentes.controlador;

import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UsuarioDAO dao = new UsuarioDAOimpl();
        
        Usuario avi = new Usuario();
        int id;
        
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        switch (action) {
            case "add":
                request.setAttribute("usuario", avi);
                request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                break;
            case "edit":
                // AvisoController?action=edit&id=3
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    // obtener el objeto que corresponde al registro
                    avi = dao.getById(id);
                } catch (Exception ex) {
                    System.out.println("Eror al obtener registro " + ex.getMessage());
                }
                // Colocar como atributo
                request.setAttribute("usuario", avi);
                // Transferir el control a frmaviso.jsp
                request.getRequestDispatcher("frmusuario.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    dao.delete(id);
                } catch (Exception ex) {
                    System.out.println("Erro al eliminar: " + ex.getMessage());
                }
                response.sendRedirect("UsuarioController");
                break;
            case "view":
                List<Usuario> lista = new ArrayList<Usuario>(); 
                try {
                    lista = dao.getAll();
                } catch (Exception ex) {
                    System.out.println("Error al listar "+ex.getMessage());
                }
                request.setAttribute("usuarios", lista);
                request.getRequestDispatcher("usuarios.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre =  request.getParameter("nombre");
        String correo =  request.getParameter("correo");
        String clave =  request.getParameter("clave");
        
        Usuario avi = new Usuario();
        
        avi.setId(id);
        avi.setNombre(nombre);
        avi.setCorreo(correo);
        avi.setClave(clave);
        
        UsuarioDAO dao = new UsuarioDAOimpl();
        
        if (id == 0){
            try {
                // Nuevo
                dao.insert(avi);
            } catch (Exception ex) {
                System.out.println("Error al insertar "+ ex.getMessage());
            }
        }
        else{
            try {
                // Edición
                dao.update(avi);
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
        response.sendRedirect("UsuarioController");
    }
}
