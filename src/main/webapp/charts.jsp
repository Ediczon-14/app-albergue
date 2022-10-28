<%@page import="Entidad.Albergue"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Entidad.Mascota"%>
<%@page import="Entidad.Solicitud"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

    
    
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Charts</title>

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
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%-- <jsp:getProperty name="albergueBean" property ="nombreAlbergue"/> --%></span>
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

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Mascotas Adoptadas</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-6 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Preferencia de Tamaño de raza</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
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
                        <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Preferencia de Pelaje</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarCharPelaje"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Preferencia de Sexo</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChartSexo"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Area Chart -->
                        <div class="col-xl-6 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Preferencia de Edad</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChartEdad"></canvas>
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
    
    <%
        List<Solicitud> da= (List<Solicitud>)request.getAttribute("data");
        List<Mascota> da2= (List<Mascota>)request.getAttribute("data2");
    %>

    <script>
        // Adopcion
        
        <%  
            int m1=0;
            int m2=0;
            int m3=0;
            int m4=0;
            int m5=0;
            int m6=0;
            int m7=0;
            int m8=0;
            int m9=0;
            int m10=0;
            int m11=0;
            int m12=0;
            if(da!=null)
            {   
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        String sCadena = a.getFechaEntrega();
                        String sSubCadena = sCadena.substring(5,7);
                        if(sSubCadena.equalsIgnoreCase("01"))
                        {
                            m1++;
                        }
                        else if(sSubCadena.equalsIgnoreCase("01"))
                            {
                                m1++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("02"))
                            {
                                m2++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("03"))
                            {
                                m3++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("04"))
                            {
                                m4++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("05"))
                            {
                                m5++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("06"))
                            {
                                m6++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("07"))
                            {
                                m7++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("08"))
                            {
                                m8++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("09"))
                            {
                                m9++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("10"))
                            {
                                m10++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("11"))
                            {
                                m11++;
                            }
                        else if(sSubCadena.equalsIgnoreCase("12"))
                            {
                                m12++;
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
        
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';
        

        function number_format(number, decimals, dec_point, thousands_sep) {
          // *     example: number_format(1234.56, 2, ',', ' ');
          // *     return: '1 234,56'
          number = (number + '').replace(',', '').replace(' ', '');
          var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
            };
          // Fix for IE parseFloat(0.55).toFixed(0) = 0;
          s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
          if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
          }
          if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
          }
          return s.join(dec);
        }

        // Area Chart Example
        var ctx = document.getElementById("myAreaChart");
        var myLineChart = new Chart(ctx, {
          type: 'line',
          data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
              label: "Adopciones",
              lineTension: 0.3,
              backgroundColor: "rgba(78, 115, 223, 0.05)",
              borderColor: "rgba(78, 115, 223, 1)",
              pointRadius: 3,
              pointBackgroundColor: "rgba(78, 115, 223, 1)",
              pointBorderColor: "rgba(78, 115, 223, 1)",
              pointHoverRadius: 3,
              pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
              pointHoverBorderColor: "rgba(78, 115, 223, 1)",
              pointHitRadius: 10,
              pointBorderWidth: 2,
              data: [<%=m1%>, <%=m2%>, <%=m3%>, <%=m4%>, <%=m5%>, <%=m6%>, <%=m7%>, <%=m8%>, <%=m9%>, <%=m10%>, <%=m11%>, <%=m12%>],
            }],
          },
          options: {
            maintainAspectRatio: false,
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
            scales: {
              xAxes: [{
                time: {
                  unit: 'date'
                },
                gridLines: {
                  display: false,
                  drawBorder: false
                },
                ticks: {
                  maxTicksLimit: 7
                }
              }],
              yAxes: [{
                ticks: {
                  maxTicksLimit: 5,
                  padding: 10,
                  // Include a dollar sign in the ticks
                  callback: function(value, index, values) {
                    return ' ' + number_format(value);
                  }
                },
                gridLines: {
                  color: "rgb(234, 236, 244)",
                  zeroLineColor: "rgb(234, 236, 244)",
                  drawBorder: false,
                  borderDash: [2],
                  zeroLineBorderDash: [2]
                }
              }],
            },
            legend: {
              display: false
            },
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              titleMarginBottom: 10,
              titleFontColor: '#6e707e',
              titleFontSize: 14,
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              intersect: false,
              mode: 'index',
              caretPadding: 10,
              callbacks: {
                label: function(tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                }
              }
            }
          }
        });
    </script>
    <script>
        // Grafico de Sexo
        <%
            int hembra=0;
            int macho=0;
            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdSexo()==1)
                        {
                            macho++;
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
                        if(a.getIdSexo()==2)
                        {
                            hembra++;
                        }
                    }
                }
            } 
        %>
        
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
          // *     example: number_format(1234.56, 2, ',', ' ');
          // *     return: '1 234,56'
          number = (number + '').replace(',', '').replace(' ', '');
          var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
            };
          // Fix for IE parseFloat(0.55).toFixed(0) = 0;
          s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
          if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
          }
          if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
          }
          return s.join(dec);
        }

        // Bar Chart Example
        var ctx = document.getElementById("myBarChartSexo");
        var myBarChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["Macho", "Hembra"],
            datasets: [{
              label: "Mascotas ",
              backgroundColor: "#4e73df",
              hoverBackgroundColor: "#2e59d9",
              borderColor: "#4e73df",
              data: [<%=macho%>, <%=hembra%>],
            }],
          },
          options: {
            maintainAspectRatio: false,
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
            scales: {
              xAxes: [{
                time: {
                  unit: 'date'
                },
                gridLines: {
                  display: false,
                  drawBorder: false
                },
                ticks: {
                  maxTicksLimit: 7
                }
              }],
              yAxes: [{
                ticks: {
                  maxTicksLimit: 5,
                  padding: 10,
                  // Include a dollar sign in the ticks
                  callback: function(value, index, values) {
                    return ' ' + number_format(value);
                  }
                },
                gridLines: {
                  color: "rgb(234, 236, 244)",
                  zeroLineColor: "rgb(234, 236, 244)",
                  drawBorder: false,
                  borderDash: [2],
                  zeroLineBorderDash: [2]
                }
              }],
            },
            legend: {
              display: false
            },
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              titleMarginBottom: 10,
              titleFontColor: '#6e707e',
              titleFontSize: 14,
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              intersect: false,
              mode: 'index',
              caretPadding: 10,
              callbacks: {
                label: function(tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                }
              }
            }
          }
        });
    </script>
    
    <script>
        // Grafico de Pelaje
        <%
            int Duro=0;
            int Rizado=0;
            int Corto=0;
            int Largo=0;

            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdPelaje()==1)
                        {
                            Duro++;
                        }
                    }
                }
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdPelaje()==2)
                        {
                            Rizado++;
                        }
                    }
                }
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdPelaje()==3)
                        {
                            Corto++;
                        }
                    }
                }
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getIdPelaje()==4)
                        {
                            Largo++;
                        }
                    }
                }
            }
                
        %>
        
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
          // *     example: number_format(1234.56, 2, ',', ' ');
          // *     return: '1 234,56'
          number = (number + '').replace(',', '').replace(' ', '');
          var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
            };
          // Fix for IE parseFloat(0.55).toFixed(0) = 0;
          s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
          if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
          }
          if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
          }
          return s.join(dec);
        }

        // Bar Chart Example
        var ctx = document.getElementById("myBarCharPelaje");
        var myBarChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["Duro", "Rizado", "Corto", "Largo"],
            datasets: [{
              label: "Mascotas ",
              backgroundColor: "#4e73df",
              hoverBackgroundColor: "#2e59d9",
              borderColor: "#4e73df",
              data: [<%=Duro%>, <%=Rizado%>, <%=Corto%>, <%=Largo%>],
            }],
          },
          options: {
            maintainAspectRatio: false,
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
            scales: {
              xAxes: [{
                time: {
                  unit: 'date'
                },
                gridLines: {
                  display: false,
                  drawBorder: false
                },
                ticks: {
                  maxTicksLimit: 7
                }
              }],
              yAxes: [{
                ticks: {
                  maxTicksLimit: 5,
                  padding: 10,
                  // Include a dollar sign in the ticks
                  callback: function(value, index, values) {
                    return ' ' + number_format(value);
                  }
                },
                gridLines: {
                  color: "rgb(234, 236, 244)",
                  zeroLineColor: "rgb(234, 236, 244)",
                  drawBorder: false,
                  borderDash: [2],
                  zeroLineBorderDash: [2]
                }
              }],
            },
            legend: {
              display: false
            },
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              titleMarginBottom: 10,
              titleFontColor: '#6e707e',
              titleFontSize: 14,
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              intersect: false,
              mode: 'index',
              caretPadding: 10,
              callbacks: {
                label: function(tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                }
              }
            }
          }
        });
    </script>
    <script>
        // Grafico de Edad
        <%
            int adulto=0;
            int juvenil=0;
            int cachorro=0;
            if(da!=null)
            { 
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getMeses()<=4)
                        {
                            cachorro++;
                        }
                    }
                }
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getMeses()>=5 && a.getMeses()<=24)
                        {
                            juvenil++;
                        }
                    }
                }
                for(Solicitud a:da)
                {
                    if(a.getEstado().equalsIgnoreCase("Finalizado"))
                    {
                        if(a.getMeses()>=25)
                        {
                            adulto++;
                        }
                    }
                }
            }
        %>
        
        
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
          // *     example: number_format(1234.56, 2, ',', ' ');
          // *     return: '1 234,56'
          number = (number + '').replace(',', '').replace(' ', '');
          var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
            };
          // Fix for IE parseFloat(0.55).toFixed(0) = 0;
          s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
          if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
          }
          if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
          }
          return s.join(dec);
        }

        // Bar Chart Example
        var ctx = document.getElementById("myBarChartEdad");
        var myBarChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["Cachorro",  "Juvenil", "Adulto"],
            datasets: [{
              label: "Mascotas ",
              backgroundColor: "#4e73df",
              hoverBackgroundColor: "#2e59d9",
              borderColor: "#4e73df",
              data: [<%=cachorro%>, <%=juvenil%>, <%=adulto%>],
            }],
          },
          options: {
            maintainAspectRatio: false,
            layout: {
              padding: {
                left: 10,
                right: 25,
                top: 25,
                bottom: 0
              }
            },
            scales: {
              xAxes: [{
                time: {
                  unit: 'date'
                },
                gridLines: {
                  display: false,
                  drawBorder: false
                },
                ticks: {
                  maxTicksLimit: 7
                }
              }],
              yAxes: [{
                ticks: {
                  maxTicksLimit: 5,
                  padding: 10,
                  // Include a dollar sign in the ticks
                  callback: function(value, index, values) {
                    return ' ' + number_format(value);
                  }
                },
                gridLines: {
                  color: "rgb(234, 236, 244)",
                  zeroLineColor: "rgb(234, 236, 244)",
                  drawBorder: false,
                  borderDash: [2],
                  zeroLineBorderDash: [2]
                }
              }],
            },
            legend: {
              display: false
            },
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              titleMarginBottom: 10,
              titleFontColor: '#6e707e',
              titleFontSize: 14,
              borderColor: '#dddfeb',
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              intersect: false,
              mode: 'index',
              caretPadding: 10,
              callbacks: {
                label: function(tooltipItem, chart) {
                  var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                  return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                }
              }
            }
          }
        });
    </script>
    
    <script>
        // Preferencia de Tamaño
        
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
        
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        // Pie Chart Example
        var ctx = document.getElementById("myPieChart");
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