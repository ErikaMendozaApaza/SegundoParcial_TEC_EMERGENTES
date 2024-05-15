/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controlador;

import com.emergentes.dao.RegistroDAO;
import com.emergentes.dao.RegistroDAOimpl;
import com.emergentes.modelo.Registro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author erime
 */
@WebServlet(name = "RegistroController", urlPatterns = {"/"})
public class RegistroController extends HttpServlet {        

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        response.setCharacterEncoding("UTF-8");
        try{
            RegistroDAO dao = new RegistroDAOimpl();
            int id;
            Registro bp = new Registro();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    request.setAttribute("registro", bp);
                    request.getRequestDispatcher("frmRegistro.jsp"). forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    bp = dao.getById(id);
                    System.out.println("el registro es su valor de cofirmado ->"+bp.isConfirmado());
                    request.setAttribute("registro", bp);
                    request.getRequestDispatcher("frmRegistro.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath()+"/inicio");
                    break;
                case "view":
                    System.out.println("paso por aqui bro!!");
                    List<Registro> lista = dao.getAll();
                    request.setAttribute("registros", lista);
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex){
            System.out.println("Error "+ ex.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String seminario = request.getParameter("seminario");
        String confirmadoParam = request.getParameter("confirmado");
        Boolean confirmado = (confirmadoParam != null && confirmadoParam.equals("on"));

        String fecha_str = request.getParameter("fecha_inscripcion");
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // Parsea el string de fecha a un objeto java.util.Date
            Date fecha_util = formatoFecha.parse(fecha_str);

            // Crea un nuevo objeto java.sql.Date usando el constructor que acepta un long
            java.sql.Date fecha_inscripcion = new java.sql.Date(fecha_util.getTime());

            Registro rg = new Registro();

            rg.setId(id);
            rg.setNombre(nombre);
            rg.setApellido(apellido);
            rg.setSeminario(seminario);
            rg.setConfirmado(confirmado);
            rg.setFecha_inscripcion(fecha_inscripcion);

            RegistroDAO dao;
            if (id == 0) {
                dao = new RegistroDAOimpl();
                dao.insert(rg);
            } else {
                dao = new RegistroDAOimpl();
                dao.update(rg);
            }
            response.sendRedirect(request.getContextPath() + "/inicio");
        } catch (ParseException ex) {
            System.out.println("Error en Post" + ex.getMessage());
        } catch (Exception ex) {
            System.out.println("Error en Post" + ex.getMessage());
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
