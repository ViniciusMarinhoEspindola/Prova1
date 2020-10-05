<%-- 
    Document   : index
    Created on : 4 de out de 2020, 20:28:51
    Author     : vm_es
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="classes.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(Disciplina.getList() == null || Disciplina.getList().isEmpty()) {
        Disciplina poo = new Disciplina("Programação Orientada a Objetos", "Ementa de POO", 4);
        Disciplina eng = new Disciplina("Engenharia de Software", "Ementa de Eng", 4);
        Disciplina so = new Disciplina("Sistemas Operacionais", "Ementa de SO", 4);
        Disciplina lp = new Disciplina("Linguagem de Programação 4", "Ementa de LP4", 4);
        Disciplina metodologia = new Disciplina("Metodologia", "Ementa de Metodologia", 4);
        Disciplina bd = new Disciplina("Banco de Dados", "Ementa de BD", 4);
        Disciplina si = new Disciplina("Segurança da Informação", "Ementa de SI", 5);
        
        ArrayList<Disciplina> matriculados = new ArrayList<Disciplina>(){{
             add(poo);
             add(eng);
             add(so);
             add(lp);
             add(metodologia);
             add(bd);
             add(si);
        }};
        
        Disciplina.setList(matriculados);
    }
%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/head.jspf" %>
    <body>
        <%@include file="WEB-INF/menu.jspf" %>
        <h1 class="text-center">Aluno</h1>
        
        <div class="row justify-content-center my-5">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row no-gutters">
                  <div class="col-md-4">
                    <img src="images/default-user-image.png" class="card-img" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Vinícius Marinho Espíndola</h5>
                      <p class="card-text text-muted small">RA: 1290481913037</p>
                      <p class="card-text">Matriculado em <%= Disciplina.getList() != null ? Disciplina.getList().size() : 0 %> disciplinas</p>
                      <p class="card-text"><small class="text-muted">04/10/2020</small></p>
                    </div>
                  </div>
                </div>
              </div>
        </div>
        <%@include file="WEB-INF/footer.jspf" %>    
    </body>
</html>
