<%@page import="java.util.List"%>
<%@page import="Entity.ClienteEntity"%>
<%@page import="Logic.ClienteBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ClienteBL BL = new ClienteBL();

    String miAccion = request.getParameter("accion");
    String miId = request.getParameter("id");

    if ("DELETE".equalsIgnoreCase(miAccion)) {
        BL.eliminar(miId);
    }
    if ("CREATE".equalsIgnoreCase(miAccion)) {
        ClienteEntity item = new ClienteEntity();
        item.setIdCliente(Integer.parseInt(miId));
        item.setNombre(request.getParameter("nombre"));
        item.setTelefono(request.getParameter("telefono"));
        item.setDireccion(request.getParameter("direccion"));
        item.setCorreo(request.getParameter("correo"));
        BL.insertar(item);
    }
    if ("UPDATE".equalsIgnoreCase(miAccion)) {
        ClienteEntity item = new ClienteEntity();
        item.setIdCliente(Integer.parseInt(miId));
        item.setNombre(request.getParameter("nombre"));
        item.setTelefono(request.getParameter("telefono"));
        item.setDireccion(request.getParameter("direccion"));
        item.setCorreo(request.getParameter("correo"));

        BL.actualizar(item);
    }

    List<ClienteEntity> lista = BL.listar();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includecss.jsp" %>

        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="includenavbar.jsp" %>
            <div id="page-wrapper" class="gray-bg">
                <%@include file="includenavbarheader.jsp" %>
                <%@include file="includepageheading.jsp" %>
                <div class="wrapper wrapper-content animated fadeInRight">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox ">
                                <div class="ibox-content">
                                    <a class='btn btn-outline-success' href='cliente-edit.jsp?accion=CREATE'> <i class='fa fa-plus' aria-hidden='true'></i> Nuevo </a>
                                    <a class='btn btn-outline-primary' href='cliente-list.jsp?accion=REFRESH'> <i class='fa fa-refresh' aria-hidden='true'></i> Actualizar </a>        
                                    <button type='button' class='btn btn-outline-warning'><i class='fa fa-print' aria-hidden='true'></i> Imprimir</button>
                                    <table class="table table-striped table-hover">
                                        <thead>
                                        <th></th>
                                        <th>Codigo</th>
                                        <th>nombre</th>
                                        <th>telefono</th>
                                        <th>direccion</th>
                                        <th>correo</th>
                                        </thead>
                                        <tbody>
                                            <%  for (int x = 0; x < lista.size(); x++) {
                                                    ClienteEntity item = lista.get(x);
                                                    out.write("<tr>");
                                                    out.write("<td>");
                                                    out.write("<a class='btn btn-outline-info' href='cliente-edit.jsp?accion=UPDATE&id=" + item.getIdCliente()+ "'> <i class='fa fa-pencil' aria-hidden='true'></i> </a>");
                                                    out.write("<a class='btn btn-outline-danger' href='cliente-list.jsp?accion=DELETE&id=" + item.getIdCliente() + "'> <i class='fa fa-trash' aria-hidden='true'></i> </a>");
                                                    out.write("</td>");
                                                    out.write("<td>" + item.getIdCliente() + "</td> ");
                                                    out.write("<td>" + item.getNombre() + "</td> ");
                                                    out.write("<td>" + item.getTelefono() + "</td> ");
                                                    out.write("<td>" + item.getDireccion() + "</td> ");
                                                    out.write("<td>" + item.getCorreo() + "</td> ");
                                                    out.write("</tr>");
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="includefooter.jsp" %>
            </div>
        </div>
        <%@include file="includejs.jsp" %>
    </body>
</html>
