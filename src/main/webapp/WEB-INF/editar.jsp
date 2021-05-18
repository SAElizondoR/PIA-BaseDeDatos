<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sergio
  Date: 16/05/21
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Editar</title>
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
            <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-toolbox"></i></div>
                <div class="sidebar-brand-text mx-3"><span>toolbox</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="nav navbar-nav text-light" id="accordionSidebar">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/ReyesMagosServlet"><i class="fas fa-tachometer-alt"></i><span>Índice</span></a></li>
                <!--<li class="nav-item"><a class="nav-link" href=${pageContext.request.contextPath}/Almacen?accion=IrBuscar><i class="fa fa-search"></i><span>Buscar</span></a></li>-->
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
                                    <div class="input-group"><!--<input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">-->
                                        <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item dropdown no-arrow mx-1"></li>
                        <li class="nav-item dropdown no-arrow mx-1">
                            <div class="shadow dropdown-list dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown"></div>
                        </li>
                        <!-- <div class="d-none d-sm-block topbar-divider"></div> -->
                        <li class="nav-item dropdown no-arrow"></li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <h3 class="text-dark mb-1" style="font-size: 40px;text-align: center;"><strong>Editar</strong></h3>
                <div class="row">
                    <div class="col">
                        <div></div>
                    </div>
                    <div class="col" style="background: #ffffff;border-radius: 14px;box-shadow: 0 0 8px;">
                        <form action="ReyesMagosServlet" method="post">
                            <h2 class="sr-only">Login Form</h2>
                            <!--<div class="illustration" style="margin: 0;"><i class="la la-edit" style="font-size: 107px;color: rgb(24,22,22);display: inline-block;width: 100%;text-align: center;"></i></div>-->
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend"></div>
                                    <div class="input-group-append"></div>
                                </div>
                            </div>
                            <%--@elvariable id="tabla" type="java.lang.String"--%>
                            <c:if test="${tabla == 'barrio'}"><%--@elvariable id="barrio" type="modelo.Barrio"--%>
                                <input type="hidden" name="id" value=${barrio.id_barrio}>
                                <label for="nombre_barrio">Nombre del barrio</label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="nombre_barrio" name="nombre_barrio" placeholder="${barrio.nombre_barrio}">
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="editarBDbarrio" type="submit" style="background: rgb(95,82,245);">Editar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'vecino'}"><%--@elvariable id="vecino" type="modelo.Vecino"--%>
                                <input type="hidden" name="id" value=${vecino.dni_vecino}>
                                <label for="nombre_vecino">Nombre(s)</label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" id="nombre_vecino" name="nombre_vecino" placeholder="${vecino.nombre_vecino}">
                                <label for="paterno_vecino">Apellido paterno</label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" id="paterno_vecino" name="paterno_vecino" placeholder="${vecino.apellido_paterno_vecino}">
                                <label for="materno_vecino">Apellido materno</label>
                                    <input class="form-control" type="text" style="margin: 0 0 10px;" id="materno_vecino" name="materno_vecino" placeholder="${vecino.apellido_materno_vecino}">
                                <label for="rey_mago">Rey mago que representa</label>
                                <select class="form-control" id="rey_mago" name="rey_mago">
                                    <option value="1" ${vecino.id_rey_mago == 1 ? 'selected="selected"' : ''}>Melchor</option>
                                    <option value="2" ${vecino.id_rey_mago == 2 ? 'selected="selected"' : ''}>Gaspar</option>
                                    <option value="3" ${vecino.id_rey_mago == 3 ? 'selected="selected"' : ''}>Baltazar</option>
                                </select>
                                <!--<label for="id_grupo">ID del grupo</label>-->
                                <input type="hidden" id="id_grupo" name="id_grupo" value="${vecino.id_grupo}">
                                <!--<select disabled class="form-control" id="id_grupo" name="id_grupo">
                                    <%--@elvariable id="listaGrupos" type="java.util.List"--%>
                                    <option value="$vecino.id_grupo} selected}">$vecino.id_grupo}</option>
                                </select>-->
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="editarBDvecino" type="submit" style="background: rgb(95,82,245);">Editar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'evento'}"><%--@elvariable id="evento" type="modelo.Evento"--%>
                                <input type="hidden" name="id" value=${evento.id_evento}>
                                <label for="fecha_hora">Fecha y hora. Ej.: 2021-06-08 12:35:29</label>
                                <input class="form-control" type="datetime-local" style="margin: 0 0 10px;" id="fecha_hora" name="fecha_hora" placeholder="${evento.fecha_hora}">
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="editarBDevento" type="submit" style="background: rgb(95,82,245);">Editar</button>
                                </div>
                            </c:if>
                            <c:if test="${tabla == 'nino'}"><%--@elvariable id="nino" type="modelo.Nino"--%>
                                <input type="hidden" name="id" value=${nino.id_nino}>
                                <label for="nombre_nino">Nombre(s)</label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="nombre_nino" name="nombre_nino" placeholder="${nino.nombre_nino}">
                                <label for="paterno_nino">Apellido paterno</label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="paterno_nino" name="paterno_nino" placeholder="${nino.apellido_paterno_nino}">
                                <label for="materno_nino">Apellido materno</label>
                                <input class="form-control" type="text" style="margin: 0 0 10px;" id="materno_nino" name="materno_nino" placeholder="${nino.apellido_materno_nino}">
                                <label for="rey_mago">Rey mago al que pide</label>
                                <select class="form-control" id="rey_mago" name="rey_mago">
                                    <option value="1" ${nino.id_rey_mago == 1 ? 'selected="selected"' : ''}>Melchor</option>
                                    <option value="2" ${nino.id_rey_mago == 2 ? 'selected="selected"' : ''}>Gaspar</option>
                                    <option value="3" ${nino.id_rey_mago == 3 ? 'selected="selected"' : ''}>Baltazar</option>
                                </select>
                                <!--<label for="id_grupo">ID del grupo</label>-->
                                <input type="hidden" id="calle_numero" name="calle_numero" value="${nino.calle_numero}">
                                <input type="hidden" id="id_regalo" name="id_regalo" value="${nino.id_regalo}">
                                <input type="hidden" id="id_barrio" name="id_barrio" value="${nino.id_barrio}">
                                <input type="hidden" id="id_evento" name="id_evento" value="${nino.id_evento}">
                                <!--<select disabled class="form-control" id="id_grupo" name="id_grupo">
                                <%--@elvariable id="listaGrupos" type="java.util.List"--%>
                                <option value="$vecino.id_grupo} selected}">$vecino.id_grupo}</option>
                                </select>-->
                                <br>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-block" name="accion" value="editarBDnino" type="submit" style="background: rgb(95,82,245);">Editar</button>
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
<div class="col">
    <div></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
</body>
</html>
