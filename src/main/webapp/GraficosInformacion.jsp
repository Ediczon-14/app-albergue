<%-- 
    Document   : GraficosInformacion
    Created on : 17/11/2022, 12:03:02 PM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page import="Entidad.Mascota"%>
<%@page import="Entidad.Solicitud"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="#" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <img class="bi me-2" width="80" height="62" src="https://thumbs.dreamstime.com/b/icono-del-logo-concepto-de-mascotas-perro-logotipo-dise%C3%B1o-vectorial-162511461.jpg">
                    
                </a>

                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="index.jsp" class="nav-link px-2 link-secondary">Inicio</a></li>
                    <li><a href="login.jsp" class="nav-link px-2 link-dark">Adoptar</a></li>
                    <li><a href="ServletMascota?tipo=GraficoInformacion&id=4" class="nav-link px-2 link-dark">Informacion</a></li>
                    <li><a href="#" class="nav-link px-2 link-dark">Nosotros</a></li>
                </ul>

                <div class="col-md-3 text-end">
                    <a class="btn btn-outline-dark me-2" href="login.jsp">Login</a>
                    <a class="btn btn-dark" href="registrarUsuario.jsp">Sign-up</a>
                </div>
            </header>
            <main>
                <!-- Estadistica-->
                <div class="container marketing">
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
                                    <h6 class="m-0 font-weight-bold text-primary">Adopciones por Tamaño de raza</h6>
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
                                    <h6 class="m-0 font-weight-bold text-primary">Adopciones por Pelaje</h6>
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
                                    <h6 class="m-0 font-weight-bold text-primary">Adopciones por Sexo</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myBarChartSexo"></canvas>
                                    </div>
                                </div>
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
                    Albergue emp = (Albergue) request.getAttribute("data3");
                %>
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
                <!-- Marketing messaging and featurettes
                ================================================== -->
                <!-- Wrap the rest of the page in another container to center all the content. -->
                <br>
                <div class="container marketing">
                    <!-- Three columns of text below the carousel -->
                    <div class="row">
                        <div class="col-lg-4 text-center">
                            <img class="bd-placeholder-img rounded-circle" src="https://elcomercio.pe/resizer/kdpOnVc-NEda1kybtWrNus0oQ6I=/980x528/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/M36IGMLO7NGLHNM7222HJHMQCA.jpg" width="140" height="140" alt="First slide">
                            <h2>Adoptame</h2>
                            <p>Adopta a una macota abandona mediante una evaluacion.</p>
                            <p><a class="btn btn-secondary" href="login.jsp">Adoptar »</a></p>
                        </div><!-- /.col-lg-4 -->
                        <div class="col-lg-4"></div><!-- /.col-lg-4 -->
                        <div class="col-lg-4"></div><!-- /.row -->

                    <!-- START THE FEATURETTES -->

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Encuentra a tu mascota ideal</h2>
                            <p class="lead">La llegada de una nueva mascota a la familia es muy emocionante, pero siempre surgen algunas dudas: ¿Cómo preparar su llegada? ¿Se llevará bien con otros animales? ¿Qué raza o mestizo encaja mejor?. En Purina® resolvemos todas tus dudas y te contamos lo que necesitas saber para que estés preparado antes de tener un nuevo perro o gato.</p>
                        </div>
                        <div class="col-md-5">
                            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="https://www.purina.es/sites/default/files/styles/ttt_image_original/public/2021-12/Hero-Small-Mobile-finding-a-pet_0.webp?itok=99pcVDEj"  width="500" height="500" aria-label="Placeholder: 500x500" alt="Third slide">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Todo sobre perros</h2>
                            <p class="lead">Elegir tener un perro en la familia es una decisión importante, y como todas las decisiones importantes en la vida, hay que informarse antes de dar el paso. Asegúrate de que estás eligiendo el compañero de vida que más se adapta a ti y tu familia. </p>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="https://www.purina.es/sites/default/files/styles/ttt_image_690/public/2021-12/image-text-component-getting-a-dog.webp?itok=4_Qo6Jzb"  width="500" height="500" aria-label="Placeholder: 500x500" alt="Third slide">
                        </div>
                    </div>
                </div>
                    <hr class="featurette-divider">
                    <!-- /END THE FEATURETTES -->

                </div><!-- /.container -->
            </main>
            
            <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
                <div class="col mb-3">   
                </div>

                <div class="col mb-3">
                    <a href="/" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
                        <img class="bi me-2" width="80" height="62" src="https://thumbs.dreamstime.com/b/icono-del-logo-concepto-de-mascotas-perro-logotipo-dise%C3%B1o-vectorial-162511461.jpg">
                    </a>
                    <p class="text-muted">© 2022</p>
                </div>

                <div class="col mb-3">
                    <h5>Nosotros</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>

                <div class="col mb-3">
                    <h5>Informacion</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>

                <div class="col mb-3">
                    <h5>Seccion</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>
            </footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
