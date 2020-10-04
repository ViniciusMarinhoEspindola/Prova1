<%-- 
    Document   : index
    Created on : 4 de out de 2020, 20:28:51
    Author     : vm_es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                      <p class="card-text">Matriculado em 10 disciplinas</p>
                      <p class="card-text"><small class="text-muted">04/10/2020</small></p>
                    </div>
                  </div>
                </div>
              </div>
        </div>
        <%@include file="WEB-INF/footer.jspf" %>    
    </body>
</html>
