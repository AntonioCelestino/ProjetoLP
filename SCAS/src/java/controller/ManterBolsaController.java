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
import modelo.Bolsa;
import modelo.Aluno;
import modelo.Selecao;

/**
 *
 * @author Nathan
 */
public class ManterBolsaController extends HttpServlet {

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
            Logger.getLogger(ManterBolsaController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManterBolsaController.class.getName()).log(Level.SEVERE, null, ex);
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
            request.setAttribute("alunos", Aluno.obterAlunos());
            request.setAttribute("selecoes", Selecao.obterSelecoes());

            RequestDispatcher view = request.getRequestDispatcher("/manterBolsa.jsp");
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
        int codBolsa = Integer.parseInt(request.getParameter("txtCodBolsa"));
        String dataInicio = request.getParameter("txtDataInicio");
        String dataFim = request.getParameter("txtDataFim");
        int codAluno = Integer.parseInt(request.getParameter("optAluno"));
        int codSelecao = Integer.parseInt(request.getParameter("optSelecao"));
        try{
            Aluno aluno = null;
            if(codAluno != 0){
                aluno = Aluno.obterAluno(codAluno);
            }
            Selecao selecao = null;
            if(codSelecao != 0){
                selecao = Selecao.obterSelecao(codSelecao);
            }
            Bolsa bolsa = new Bolsa(codBolsa, dataInicio, dataFim, aluno, selecao);
            bolsa.setCodAluno(codAluno);
            bolsa.setCodSelecao(codSelecao);
            bolsa.gravar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaBolsaController");
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
            request.setAttribute("alunos", Aluno.obterAlunos());
            request.setAttribute("selecoes", Selecao.obterSelecoes());
            int codBolsa = Integer.parseInt(request.getParameter("codBolsa"));
            Bolsa bolsa = Bolsa.obterBolsa(codBolsa);
            request.setAttribute("bolsa", bolsa);
            RequestDispatcher view = request.getRequestDispatcher("/manterBolsa.jsp");
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
            request.setAttribute("alunos", Aluno.obterAlunos());
            request.setAttribute("selecoes", Selecao.obterSelecoes());
            int codBolsa = Integer.parseInt(request.getParameter("codBolsa"));
            Bolsa bolsa = Bolsa.obterBolsa(codBolsa);
            request.setAttribute("bolsa", bolsa);
            RequestDispatcher view = request.getRequestDispatcher("/manterBolsa.jsp");
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
        int codBolsa = Integer.parseInt(request.getParameter("txtCodBolsa"));
        String dataInicio = request.getParameter("txtDataInicio");
        String dataFim = request.getParameter("txtDataFim");
        int codAluno = Integer.parseInt(request.getParameter("optAluno"));
        int codSelecao = Integer.parseInt(request.getParameter("optSelecao"));
        try{
            Aluno aluno = null;
            if(codAluno != 0){
                aluno = Aluno.obterAluno(codAluno);
            }
            Selecao selecao = null;
            if(codSelecao != 0){
                selecao = Selecao.obterSelecao(codSelecao);
            }
            Bolsa bolsa = new Bolsa(codBolsa, dataInicio, dataFim, aluno, selecao);
            bolsa.setCodAluno(codAluno);
            bolsa.setCodSelecao(codSelecao);
            bolsa.alterar();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaBolsaController");
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
        int codBolsa = Integer.parseInt(request.getParameter("txtCodBolsa"));
        String dataInicio = request.getParameter("txtDataInicio");
        String dataFim = request.getParameter("txtDataFim");
        int codAluno = Integer.parseInt(request.getParameter("optAluno"));
        int codSelecao = Integer.parseInt(request.getParameter("optSelecao"));
        try{
            Aluno aluno = null;
            if(codAluno != 0){
                aluno = Aluno.obterAluno(codAluno);
            }
            Selecao selecao = null;
            if(codSelecao != 0){
                selecao = Selecao.obterSelecao(codSelecao);
            }
            Bolsa bolsa = new Bolsa(codBolsa, dataInicio, dataFim, aluno, selecao);
            bolsa.setCodAluno(codAluno);
            bolsa.setCodSelecao(codSelecao);
            bolsa.excluir();
            RequestDispatcher view = request.getRequestDispatcher("PesquisaBolsaController");
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
