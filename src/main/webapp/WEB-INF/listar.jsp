<%--@elvariable id="tabla" type="java.lang.String"--%>
<%--
  Created by IntelliJ IDEA.
  User: sergio
  Date: 14/05/21
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Reyes Magos Sin Fronteras</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome5-overrides.min.css">
</head>
<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(24,22,22);">
        <div class="container-fluid d-flex flex-column p-0">
            <!-- <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-toolbox"></i></div>
                <div class="sidebar-brand-text mx-3"><span>toolbox</span></div>
            </a> -->
            <hr class="sidebar-divider my-0">
            <ul class="nav navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/ReyesMagosServlet"><i class="fas fa-tachometer-alt"></i><span>Índice</span></a></li>
                <!--<li class="nav-item"><a class="nav-link" href=$pageContext.request.contextPath}/Almacen?accion=IrBuscar><i class="fa fa-search"></i><span>Buscar</span></a></li>-->
                <li class="nav-item"><a class="nav-link" href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=agregar><i class="fa fa-angle-double-down"></i><span>Agregar</span></a></li>
            </ul>
            <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                    <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"></button></div>
                        </div>
                    </form>
                    <ul class="nav navbar-nav flex-nowrap ml-auto">
                        <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
                            <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto navbar-search w-100">
                                    <div class="input-group">
                                        <label for="busqueda">Buscar</label>
                                        <input id="busqueda" class="bg-light form-control border-0 small" type="text" placeholder="Buscar">
                                        <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow mx-1">
                            <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"></a>

                            </div>
                        </li>

                        <!-- <div class="d-none d-sm-block topbar-divider"></div>
                        <li class="nav-item dropdown no-arrow">

                        </li> -->
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="d-sm-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark mb-0">Reyes magos sin fronteras</h3><a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#" onClick="window.print()"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" class="bi bi-printer-fill fa-sm text-white-50">
                    <path d="M5 1a2 2 0 0 0-2 2v1h10V3a2 2 0 0 0-2-2H5z"></path>
                    <path fill-rule="evenodd" d="M11 9H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1z"></path>
                    <path fill-rule="evenodd" d="M0 7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v2H2a2 2 0 0 1-2-2V7zm2.5 1a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"></path>
                </svg>&nbsp; &nbsp; Imprimir</a></div>
                <!-- <div class="row">
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-left-primary py-2">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col mr-2">
                                        <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span># de herramientas en existencia</span></div>
                                        <div class="text-dark font-weight-bold h5 mb-0"><span>c:out value="$tamano}"/></span></div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-tools fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-left-success py-2">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col mr-2">
                                        <div class="text-uppercase text-success font-weight-bold text-xs mb-1"><span># tipos de herramientas</span></div>
                                        <div class="text-dark font-weight-bold h5 mb-0"><span>c:out value="$cantCategorias}"/></span></div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-stroopwafel fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-left-info py-2">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col mr-2">
                                        <div class="text-uppercase text-info font-weight-bold text-xs mb-1"><span># Marcas totales</span></div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="text-dark font-weight-bold h5 mb-0 mr-3"><span>c:out value="$cantMarcas}"/></span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto"><i class="fas fa-dolly fa-2x text-gray-300"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3 mb-4">
                        <div class="card shadow border-left-warning py-2">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col mr-2">
                                        <div class="text-uppercase text-warning font-weight-bold text-xs mb-1"><span># Tamaños totales</span></div>
                                        <div class="text-dark font-weight-bold h5 mb-0"><span>c:out value="$cantTamanos}"/></span></div>
                                    </div>
                                    <div class="col-auto"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" class="fa-2x text-gray-300">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6V4H20V20H12V18H8V16H4V8H8V6H12ZM14 6H18V18H14V6ZM12 8H10V16H12V8ZM8 10V14H6V10H8Z" fill="currentColor"></path>
                                    </svg></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <form action="${pageContext.request.contextPath}/ReyesMagosServlet" method="get">
                    <label for="tabla">Escoja la tabla a mostrar</label>
                    <select id="tabla" name="tabla">
                        <option disabled ${tabla == 'ninguno' ? 'selected="selected"' : ''}>Seleccione una opción</option>
                        <option value="barrio" ${tabla == 'barrio' ? 'selected="selected"' : ''}>Barrios</option>
                        <option value="vecino" ${tabla == 'vecino' ? 'selected="selected"' : ''}>Vecinos</option>
                        <option value="evento" ${tabla == 'evento' ? 'selected="selected"' : ''}>Eventos</option>
                        <option value="nino" ${tabla == 'nino' ? 'selected="selected"' : ''}>Niños</option>
                    </select>
                    <p>
                        <input type="submit" name="accion" value="listar"/>
                    </p>
                </form>
                <div class="row">
                    <div class="col">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <%--@elvariable id="atributosLista" type="java.util.List"--%>
                                    <c:forEach items="${atributosLista}" var="atributo">
                                        <th>${atributo}</th>
                                    </c:forEach>
                                    <!-- <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Categoría</th>
                                    <th>Marca</th>
                                    <th>Dimensión</th>
                                    <th>Unidades</th>
                                    <th></th> -->
                                </tr>
                                </thead>
                                <tbody>
                                <%--@elvariable id="lista" type="java.util.List"--%>
                                <c:if test="${tabla == 'barrio'}">
                                    <c:forEach items="${lista}" var="elemento">
                                        <tr>
                                            <td><c:out value="${elemento.nombre_barrio}"/></td>
                                            <td><c:out value="${elemento.nombre_municipio}"/></td>
                                            <td><c:out value="${elemento.nombre_comunidad_autonoma}"/></td>
                                            <td>
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=editar&id=${elemento.id_barrio}>Editar</a>
                                                |
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=eliminar&id=${elemento.id_barrio}>Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${tabla == 'vecino'}">
                                    <c:forEach items="${lista}" var="elemento">
                                        <tr>
                                            <td><c:out value="${elemento.dni_vecino}"/></td>
                                            <td><c:out value="${elemento.nombre_vecino}"/></td>
                                            <td><c:out value="${elemento.rey_mago}"/></td>
                                            <td><c:out value="${elemento.id_grupo}"/></td>
                                            <td>
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=editar&id=${elemento.dni_vecino}>Editar</a>
                                                |
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=eliminar&id=${elemento.dni_vecino}>Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${tabla == 'evento'}">
                                    <c:forEach items="${lista}" var="elemento">
                                        <tr>
                                            <td><c:out value="${elemento.fecha_hora}"/></td>
                                            <td><c:out value="${elemento.calle_numero}"/></td>
                                            <td><c:out value="${elemento.id_grupo}"/></td>
                                            <td><c:out value="${elemento.nombre_barrio}"/></td>
                                            <td><c:out value="${elemento.nombre_municipio}"/></td>
                                            <td>
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=editar&id=${elemento.id_evento}>Editar</a>
                                                |
                                                <a href=${pageContext.request.contextPath}/ReyesMagosServlet?accion=eliminar&id=${elemento.id_evento}>Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Página diseñada por Sergio Andrés y Diego Rangel Pardo</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>
</html>
