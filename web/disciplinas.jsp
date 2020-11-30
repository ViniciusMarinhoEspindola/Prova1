<%-- 
    Document   : disciplinas
    Created on : 4 de out de 2020, 20:54:32
    Author     : vm_es
--%>

<%@page import="java.text.Normalizer"%>
<%@page import="classes.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int id;
    int delete_id;
    float nota;
    String nome;
    String ementa;
    int ciclo;
    
    try {
        nota = Float.parseFloat(request.getParameter("nota"));
        id = Integer.parseInt(request.getParameter("id"));
    } catch(Exception e) {
        id = 0;
        nota = 0;
    }
    if(Disciplina.getList() != null && !Disciplina.getList().isEmpty()) {
        for(Disciplina disciplina : Disciplina.getList()) {
            if(disciplina.getId() == id) {
                disciplina.setNota(id, nota);
            }
        }
    }
    
    try {
        nome = request.getParameter("nome");
        ementa = request.getParameter("ementa");
        ciclo = Integer.parseInt(request.getParameter("ciclo"));
    } catch(Exception e) {
        nome = "";
        ementa = "";
        ciclo = 0;
    }
    
    if(nome != "" && ementa != "" && ciclo != 0) {
        Disciplina.create(nome, ementa, ciclo);
    }
    
    try {
        delete_id = Integer.parseInt(request.getParameter("delete_id"));
    } catch(Exception e) {
        delete_id = 0;
    }
    
    if(delete_id != 0) {
        Disciplina.delete(delete_id);
    }
        
    
%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/head.jspf" %>
    <body>
        <%@include file="WEB-INF/menu.jspf" %>
        <h1 class="text-center">Disciplinas</h1>
        
        <div class="container my-5">
            <form method="POST">
                <div class="form-row align-items-center">
                    <div class="form-group col">
                        <label>Nome</label>
                        <input name="nome" class="form-control">
                    </div>
                    <div class="form-group col">
                        <label>Ementa</label>
                        <input name="ementa" class="form-control">
                    </div>
                    <div class="form-group col">
                        <label>Ciclo</label>
                        <input name="ciclo" class="form-control">
                    </div>
                    
                    <button class="btn btn-dark h-100 mt-3">Enviar</button>
                </div>
            </form>
            
            <table class="table table-bordered">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Disciplina</th>
                    <th scope="col">Ementa</th>
                    <th scope="col">Ciclo</th>
                    <th scope="col">Nota</th>
                    <th scope="col">Deleta</th>
                  </tr>
                </thead>
                <tbody>
                    <% if(Disciplina.getList() != null && !Disciplina.getList().isEmpty()) { %>
                        <% for(Disciplina disciplina : Disciplina.getList()) { %>
                            <tr>
                                <td><%= disciplina.getNome() %></td>
                                <td><%= disciplina.getEmenta() %></td>
                                <td><%= disciplina.getCiclo() %></td>
                                <td>
                                    <%= disciplina.getNota() %>
                                    
                                    <form method="POST" action="">
                                        <div class="form-row">
                                            <input value="<%= disciplina.getNota() == 0 ? "" : disciplina.getNota() %>" name="nota" type="text" placeholder="Alterar Nota" class="form-control form-control-sm col-9">
                                            <input value="<%= disciplina.getId() %>" type="hidden" name="id">
                                            
                                            <button type="submit" class="btn btn-dark btn-sm col-3">Alterar</button>
                                        </div>
                                    </form>
                                </td>
                                <td>
                                    <form method="POST" action="">
                                        <div class="form-row justify-content-center align-items-center mt-3">
                                            <input value="<%= disciplina.getId() %>" type="hidden" name="delete_id">
                                            
                                            <button type="submit" class="btn btn-danger">Deletar</button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
              </table>
        </div>
        
        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
