<%-- 
    Document   : disciplinas
    Created on : 4 de out de 2020, 20:54:32
    Author     : vm_es
--%>

<%@page import="java.text.Normalizer"%>
<%@page import="classes.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    float nota;
    String nome;
    
    try {
        nota = Float.parseFloat(request.getParameter("nota"));
        nome = request.getParameter("nome");
    } catch(Exception e) {
        nota = 0;
        nome = "";
    }
    if(Disciplina.getList() != null && !Disciplina.getList().isEmpty()) {
        for(Disciplina disciplina : Disciplina.getList()) {
            String nomeAtual = Normalizer.normalize(disciplina.getNome(), Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
            String nomeForm = Normalizer.normalize(nome, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
            
            if(nomeAtual.equals(nomeForm)) {
                disciplina.setNota(nota);
            }
        }
    }
    
%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/head.jspf" %>
    <body>
        <%@include file="WEB-INF/menu.jspf" %>
        <h1 class="text-center">Disciplinas</h1>
        
        <div class="container my-5">
            <table class="table table-bordered">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">Disciplina</th>
                    <th scope="col">Ementa</th>
                    <th scope="col">Ciclo</th>
                    <th scope="col">Nota</th>
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
                                            <input value="<%= Normalizer.normalize(disciplina.getNome(), Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "") %>" type="hidden" name="nome">
                                            
                                            <button type="submit" class="btn btn-dark btn-sm col-3">Alterar</button>
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
