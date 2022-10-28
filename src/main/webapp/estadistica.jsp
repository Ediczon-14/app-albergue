<%@page import="Entidad.Albergue"%>
<%@page import="Entidad.Mascota"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<%@page import="Entidad.Solicitud"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Solicitud> da= (List<Solicitud>)request.getAttribute("data");
%>
<%
    List<Mascota> da2= (List<Mascota>)request.getAttribute("data2");
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
    <% 
        Albergue emp = (Albergue) request.getAttribute("data3");
    %>
    <!-- Page Wrapper -->
    <div id="wrapper">
        
        <!-- Sidebar -->
        
        <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Opciones
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="ServletMascota?tipo=GraficoMascotas&id=<%=emp.getIdAlbergue()%>">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Graficos</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="ServletMascota?tipo=listarMascotasAdoptadas&id=<%=emp.getIdAlbergue()%>"><i class="fas fa-fw fa-table"></i><span>Tabla</span></a>  
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=emp.getNombreAlbergue()%></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Perfil
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Menu Albergue
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="login.jsp" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Salir
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Content Row -->
                    <div class="row">
                        <%  Date date = new Date();
                            int adoptadosAnual=0;
                            int adoptadosMes=0;
                            Calendar calendar = Calendar.getInstance();
                            calendar.setTime(date);
                            int dateYear = calendar.get(Calendar.YEAR);
                            int dateMes= calendar.get(Calendar.MONTH)+1;
                            if(da!=null)
                            { 
                                for(Solicitud a:da)
                                {
                                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                                    {
                                        String sCadena = a.getFechaEntrega();
                                        String sSubCadena = sCadena.substring(0,4);
                                        if(sSubCadena.equalsIgnoreCase(String.valueOf(dateYear)))
                                        {
                                            adoptadosAnual++;
                                        }
                                    }
                                }
                            }
                            if(da!=null)
                            {   
                                for(Solicitud a:da)
                                {
                                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                                    {
                                        String sCadena = a.getFechaEntrega();
                                        String sSubCadena = sCadena.substring(5,7);
                                        if(sSubCadena.equalsIgnoreCase(String.valueOf(dateMes)))
                                        {
                                            adoptadosMes++;
                                        }
                                    }
                                }
                            }
                            //Conteo de Mascotas de albergue
                            int TotalMascotas=0;
                            if(da2!=null)
                            {   
                                for(Mascota a:da2)
                                {
                                    if(a.getEstado()==1){
                                        TotalMascotas++;
                                    }
                                }
                            }
                        %>
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Mascotas Adoptadas Mensualmente</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=adoptadosMes%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Mascotas Adoptadas Anualmente</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=adoptadosAnual%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Total de Mascotas en Albergue</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=TotalMascotas%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calculator fa-2x text-gray-300"></i>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4"></div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Pie Chart -->
                        <div class="col-xl-6 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Preferencia de Adopcion segun el Tamaño de Raza</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChartInicio"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Grande
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Mediano
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Pequeño
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <%@include file="/footer.jsp"%>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">¿Desea salir?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <div class="modal-body">Seleccione "Cerrar sesión" a continuación si está listo para finalizar su sesión actual.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="login.jsp">Salir</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    
    <script>
        // Preferencia de Tamaño
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';
        
        
        <%
            int pequeño=0;
            int mediano=0;
            int grande=0;
            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdTamaño()==1)
                        {
                            pequeño++;
                        }
                    }
                }
            }
            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdTamaño()==2)
                        {
                            mediano++;
                        }
                    }
                }
            }
            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdTamaño()==3)
                        {
                            grande++;
                        }
                    }
                }
            }
        %>
        // Pie Chart Example
        var ctx = document.getElementById("myPieChartInicio");
        var myPieChart = new Chart(ctx, {
          type: 'doughnut',
          data: {
            labels: ["Grande", "Mediano", "Pequeño"],
            datasets: [{
              data: [<%=grande%>, <%=mediano%>, <%=pequeño%>],
              backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
              hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
              hoverBorderColor: "rgba(234, 236, 244, 1)",
            }],
          },
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false
            },
            cutoutPercentage: 80,
          },
        });
    </script>
</body>

</html>