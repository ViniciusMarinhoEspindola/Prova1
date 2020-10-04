<%-- 
    Document   : sobre
    Created on : 4 de out de 2020, 20:38:40
    Author     : vm_es
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/head.jspf" %>
    <body>
        <%@include file="WEB-INF/menu.jspf" %>
        <h1 class="text-center">Sobre</h1>
        
        <div class="row justify-content-center my-5">
            <div class="card col-8">
                <img src="images/default-user-image.png" class="card-img-top ml-auto mr-auto mt-4 rounded-circle" style="max-width: 300px;max-height: 300px;" alt="...">
                <div class="card-body">
                    <h2 class="text-center">Vinícius Marinho Espíndola</h2>
                    <div class="row text-center text-muted my-4">
                        <p class="col-3">RA: 1290481913037</p>
                        <p class="col-6">GitHub: <a href="https://github.com/ViniciusMarinhoEspindola">https://github.com/ViniciusMarinhoEspindola</a></p>
                        <p class="col-3">Ciclo: 4º Ciclo</p>
                    </div>
                    <h4>Descrição</h4>
                    <p class="card-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
                </div>
             </div>
        </div>
        
        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
