/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Modalidade;
import modelo.Recurso;

/**
 *
 * @author Nathan
 */
public class ManterRecursoController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        request.setCharacterEncoding( "UTF-8" );
        response.setContentType("text/html;charset=UTF-8");
        String acao = request.getParameter("acao");
        if(acao.equals("prepararIncluir")){
            prepararIncluir(request, response);
        } else {
            if (acao.equals("confirmarIncluir")) {
                confirmarIncluir(request, response);
            } else {
                if(acao.equals("prepararEditar")){
                    prepararEditar(request, response);
                } else {
                    if (acao.equals("confirmarEditar")) {
                        confirmarEditar(request, response);
                    } else {
                        if(acao.equals("prepararExcluir")){
                            prepararExcluir(request, response);
                        } else {
                            if (acao.equals("confirmarExcluir")) {
                                confirmarExcluir(request, response);
                            }
                        }
                    }   
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterRecursoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ManterRecursoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void prepararIncluir(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, ServletException {
        try{
            request.setAttribute("operacao", "Incluir");
            request.setAttribute("modalidades", Modalidade.obterModalidades());
            
            RequestDispatcher view = request.getRequestDispatcher("/manterRecurso.jsp");
            view.forward(request, response);   
        } catch(ServletException ex){
            throw ex;
        } catch(IOException ex){
            throw new ServletException(ex);
        } catch(ClassNotFoundException ex){
            throw new ServletException(ex);
        }
    }

    private void confirmarIncluir(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        int codRecurso = Integer.parseInt(request.getParameter("txtCodRecurso"));
        int ano = Integer.parseInt(request.getParameter("txtAno"));
        double creditos = Double.parseDouble(request.getParameter("txtCreditos"));
        double debitos = Double.parseDouble(request.getParameter("txtDebitos"));
        double saldo = Double.parseDouble(request.getParameter("txtSaldo"));
        int codModalidade = Integer.parseInt(request.getParameter("optModalidade"));
        try{
            Modalidade modalidade = null;
            if(codModalidade != 0){
                modalidade = Modalidade.obterModalidade(codModalidade);
            }
            Recurso recurso = new Recurso(codRecurso, ano, creditos, debitos, saldo, modalidade);
            recurso.setCodModalidade(codModalidade);
            recurso.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaRecursoController");
            view.forward(request, response);
        }catch (IOException ex){
            throw new ServletException(ex);
        }catch (SQLException ex){
            throw new ServletException(ex);
        }catch (ClassNotFoundException ex){
            throw new ServletException(ex);
        }catch (ServletException ex){
            throw ex;
        }
    }

    private void prepararEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try{
            request.setAttribute("operacao", "Editar");
            request.setAttribute("modalidades", Modalidade.obterModalidades());
            int codRecurso = Integer.parseInt(request.getParameter("codRecurso"));
            Recurso recurso = Recurso.obterRecurso(codRecurso);
            request.setAttribute("recurso", recurso);
            RequestDispatcher view = request.getRequestDispatcher("/manterRecurso.jsp");
            view.forward(request, response);   
        } catch(ServletException ex){
            throw ex;
        } catch(IOException ex){
            throw new ServletException(ex);
        } catch(ClassNotFoundException ex){
            throw new ServletException(ex);
        }
    }

    private void prepararExcluir(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try{
            request.setAttribute("operacao", "Excluir");
            request.setAttribute("modalidades", Modalidade.obterModalidades());
            int codRecurso = Integer.parseInt(request.getParameter("codRecurso"));
            Recurso recurso = Recurso.obterRecurso(codRecurso);
            request.setAttribute("recurso", recurso);
            RequestDispatcher view = request.getRequestDispatcher("/manterRecurso.jsp");
            view.forward(request, response);   
        } catch(ServletException ex){
            throw ex;
        } catch(IOException ex){
            throw new ServletException(ex);
        } catch(ClassNotFoundException ex){
            throw new ServletException(ex);
        }
    }

    private void confirmarEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        int codRecurso = Integer.parseInt(request.getParameter("txtCodRecurso"));
        int ano = Integer.parseInt(request.getParameter("txtAno"));
        double creditos = Double.parseDouble(request.getParameter("txtCreditos"));
        double debitos = Double.parseDouble(request.getParameter("txtDebitos"));
        double saldo = Double.parseDouble(request.getParameter("txtSaldo"));
        int codModalidade = Integer.parseInt(request.getParameter("optModalidade"));
        try{
            Modalidade modalidade = null;
            if(codModalidade != 0){
                modalidade = Modalidade.obterModalidade(codModalidade);
            }
            Recurso recurso = new Recurso(codRecurso, ano, creditos, debitos, saldo, modalidade);
            recurso.setCodModalidade(codModalidade);
            recurso.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaRecursoController");
            view.forward(request, response);
        }catch (IOException ex){
            throw new ServletException(ex);
        }catch (SQLException ex){
            throw new ServletException(ex);
        }catch (ClassNotFoundException ex){
            throw new ServletException(ex);
        }catch (ServletException ex){
            throw ex;
        }
    }

    private void confirmarExcluir(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        int codRecurso = Integer.parseInt(request.getParameter("txtCodRecurso"));
        int ano = Integer.parseInt(request.getParameter("txtAno"));
        double creditos = Double.parseDouble(request.getParameter("txtCreditos"));
        double debitos = Double.parseDouble(request.getParameter("txtDebitos"));
        double saldo = Double.parseDouble(request.getParameter("txtSaldo"));
        int codModalidade = Integer.parseInt(request.getParameter("optModalidade"));
        try{
            Modalidade modalidade = null;
            if(codModalidade != 0){
                modalidade = Modalidade.obterModalidade(codModalidade);
            }
            Recurso recurso = new Recurso(codRecurso, ano, creditos, debitos, saldo, modalidade);
            recurso.setCodModalidade(codModalidade);
            recurso.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaRecursoController");
            view.forward(request, response);
        }catch (IOException ex){
            throw new ServletException(ex);
        }catch (SQLException ex){
            throw new ServletException(ex);
        }catch (ClassNotFoundException ex){
            throw new ServletException(ex);
        }catch (ServletException ex){
            throw ex;
        }
    }
}
