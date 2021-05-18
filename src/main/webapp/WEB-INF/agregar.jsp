<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--@elvariable id="tabla" type="java.lang.String"--%>
<%--
  Created by IntelliJ IDEA.
  User: sergio
  Date: 16/05/21
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Agregar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/line-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Login-Form-Clean.css">
</head>
<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(24,22,22);">
        <div class="container-fluid d-flex flex-column p-0">
            <!--<a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-toolbox"></i></div>
                <div class="sidebar-brand-text mx-3"><span>toolbox</span></div>
            </a>-->
            <hr class="sidebar-divider my-0">
            <ul class="nav navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/ReyesMagosServlet"><i class="fas fa-tachometer-alt"></i><span>Índice</span></a></li>
                <!-- <li class="nav-item"><a class="nav-link" href=${pageContext.request.contextPath}/Almacen?accion=IrBuscar><i class="fa fa-search"></i><span>Buscar</span></a></li> -->
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
                                        <label for="input-a"></label>
                                        <input id="input-a" class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                        <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow mx-1"></li>
                        <li class="nav-item dropdown no-arrow mx-1">
                            <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                        </li>
                        <!--<div class="d-none d-sm-block topbar-divider"></div>-->
                        <li class="nav-item dropdown no-arrow"></li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <form action="${pageContext.request.contextPath}/ReyesMagosServlet" method="get">
                    <label for="tabla">¿Qué desea registrar?</label>
                    <select id="tabla" name="tabla">
                        <option disabled ${tabla == 'ninguno' ? 'selected="selected"' : ''}>Seleccione una opción</option>
                        <option value="barrio" ${tabla == 'barrio' ? 'selected="selected"' : ''}>Barrios</option>
                        <option value="vecino" ${tabla == 'vecino' ? 'selected="selected"' : ''}>Vecinos</option>
                        <option value="evento" ${tabla == 'evento' ? 'selected="selected"' : ''}>Eventos</option>
                        <option value="nino" ${tabla == 'nino' ? 'selected="selected"' : ''}>Niños</option>
                    </select>
                    <button type="submit" name="btnagregar" value="Seleccionar">Seleccionar</button>
                </form>
                <!-- <h3 class="text-dark mb-1" style="text-align: center;font-size: 40px;margin-bottom: 0;"><strong>Registro de herramienta</strong></h3> -->
                <div class="row" style="margin-top: 10px;">
                    <div class="col">
                        <div></div>
                    </div>
                    <div class="col" style="background: #ffffff;border-radius: 14px;box-shadow: 0 0 8px;">
                        <form action="${pageContext.request.contextPath}/ReyesMagosServlet" method="post">
                            <h2 class="sr-only">Login Form</h2>
                            <div class="illustration" style="margin: 0;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="font-size: 107px;color: rgb(24,22,22);display: inline-block;width: 100%;text-align: center;">
                                <path d="M12 6C12.5523 6 13 6.44772 13 7V11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H13V17C13 17.5523 12.5523 18 12 18C11.4477 18 11 17.5523 11 17V13H7C6.44772 13 6 12.5523 6 12C6 11.4477 6.44772 11 7 11H11V7C11 6.44772 11.4477 6 12 6Z" fill="currentColor"></path>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M5 22C3.34315 22 2 20.6569 2 19V5C2 3.34315 3.34315 2 5 2H19C20.6569 2 22 3.34315 22 5V19C22 20.6569 20.6569 22 19 22H5ZM4 19C4 19.5523 4.44772 20 5 20H19C19.5523 20 20 19.5523 20 19V5C20 4.44772 19.5523 4 19 4H5C4.44772 4 4 4.44772 4 5V19Z" fill="currentColor"></path>
                            </svg></div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend"></div>
                                    <div class="input-group-append"></div>
                                </div>
                            </div>
                            <c:if test="${tabla == 'barrio'}">
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="nombre_barrio" placeholder="Nombre del barrio">
                                </label>
                                <label for="municipio">Municipio</label>
                                <select class="form-control" id="municipio" name="municipio">
                                    <%--@elvariable id="listaMunicipios" type="java.util.List"--%>
                                    <c:forEach items="${listaMunicipios}" var="mun">
                                        <option value="${mun.id_municipio}">${mun.nombre_municipio}</option>
                                    </c:forEach>
                                </select>
                                <!--<label for="comunidad">Comunidad autónoma</label>
                                <select class="form-control" id="comunidad" name="comunidad">
                                    <%--@elvariable id="listaComunidades" type="java.util.List"--%>
                                c:forEach items="$listaComunidades}" var="com">
                                    <option value="$com.id_comunidad_autonoma}">$com.nombre_comunidad_autonoma}</option>
                                /c:forEach>
                            </select>-->
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="agregarBDbarrio" type="submit" style="background: rgb(95,82,245);">Agregar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'vecino'}">
                                <label for="dni_vecino_num">Número de 8 dígitos</label>
                                <input class="form-control" type="number" style="margin: 0 0 10px;" id="dni_vecino_num" name="dni_vecino_num" placeholder="Número DNI" min="00000000" max="99999999">
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="dni_vecino_let" placeholder="Letra DNI" maxlength="1">
                                </label>
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="nombre_vecino" placeholder="Nombre(s)">
                                </label>
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="paterno_vecino" placeholder="Apellido paterno">
                                </label>
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="materno_vecino" placeholder="Apellido materno">
                                </label>
                                <label for="rey_mago">Rey mago que representa</label>
                                <select class="form-control" id="rey_mago" name="rey_mago">
                                    <option value="1">Melchor</option>
                                    <option value="2">Gaspar</option>
                                    <option value="3">Baltazar</option>
                                </select>
                                <label for="id_grupo">ID del grupo</label>
                                <select class="form-control" id="id_grupo" name="id_grupo">
                                    <%--@elvariable id="listaGrupos" type="java.util.List"--%>
                                    <c:forEach items="${listaGrupos}" var="grup">
                                        <option value="${grup.id_grupo}">${grup.id_grupo}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="agregarBDvecino" type="submit" style="background: rgb(95,82,245);">Agregar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'evento'}">
                                <label for="fecha_hora">Fecha y hora. Ej.: 2021-06-08 12:35:29</label>
                                <input class="form-control" type="datetime-local" style="margin: 0 0 10px;" id="fecha_hora" name="fecha_hora">
                                <label for="calle">Calle</label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="calle" name="calle">
                                <label for="numero">Número</label>
                                <input class="form-control" type="number" style="margin: 0 0 10px;" id="numero" name="numero">
                                <label for="id_grupo">Grupo</label>
                                <select class="form-control" id="id_grupo" name="id_grupo">
                                        <%--@elvariable id="listaGrupos" type="java.util.List"--%>
                                    <c:forEach items="${listaGrupos}" var="grup">
                                        <option value="${grup.id_grupo}">${grup.id_grupo}</option>
                                    </c:forEach>
                                </select>
                                <label for="id_barrio">Barrio</label>
                                <select class="form-control" id="id_barrio" name="id_barrio">
                                        <%--@elvariable id="listaBarrios" type="java.util.List"--%>
                                    <c:forEach items="${listaBarrios}" var="bar">
                                        <option value="${bar.id_barrio}">${bar.nombre_barrio}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="agregarBDevento" type="submit" style="background: rgb(95,82,245);">Agregar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'nino'}">
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="nombre_nino" placeholder="Nombre(s)">
                                </label>
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="paterno_nino" placeholder="Apellido paterno">
                                </label>
                                <label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" name="materno_nino" placeholder="Apellido materno">
                                </label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="calle" name="calle" placeholder="Calle">
                                <input class="form-control" type="number" style="margin: 0 0 10px;" id="numero" name="numero" placeholder="Número">
                                <label for="rey_mago">Rey mago que le pide</label>
                                <select class="form-control" id="rey_mago" name="rey_mago">
                                    <option value="1">Melchor</option>
                                    <option value="2">Gaspar</option>
                                    <option value="3">Baltazar</option>
                                </select>
                                <label for="id_regalo">Regalo</label>
                                <select class="form-control" id="id_regalo" name="id_regalo">
                                        <%--@elvariable id="listaRegalos" type="java.util.List"--%>
                                    <c:forEach items="${listaRegalos}" var="reg">
                                        <option value="${reg.id_regalo}">${reg.nombre_regalo}</option>
                                    </c:forEach>
                                </select>
                                <label for="id_barrio">Barrio</label>
                                <select class="form-control" id="id_barrio" name="id_barrio">
                                        <%--@elvariable id="listaBarrios" type="java.util.List"--%>
                                    <c:forEach items="${listaBarrios}" var="bar">
                                        <option value="${bar.id_barrio}">${bar.nombre_barrio}</option>
                                    </c:forEach>
                                </select>
                                <label for="id_evento">ID evento</label>
                                <select class="form-control" id="id_evento" name="id_evento">
                                        <%--@elvariable id="listaEventos" type="java.util.List"--%>
                                    <c:forEach items="${listaEventos}" var="ev">
                                        <option value="${ev.id_evento}">${ev.id_evento}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="agregarBDnino" type="submit" style="background: rgb(95,82,245);">Agregar</button>
                                </div>
                            </c:if>
                        </form>
                    </div>
                    <div class="col" style="border-radius: 68px;">
                        <div></div>
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
