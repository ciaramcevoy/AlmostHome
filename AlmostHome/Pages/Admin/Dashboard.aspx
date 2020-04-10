<%@ Page Title="" Language="C#" MasterPageFile="~/Master/almostHome.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AlmostHome.Pages.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/material-kit/material-dashboard.css" rel="stylesheet" />
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

        #availableTypes, #rehomedTypes {
            width: 400px;
            height: 150px;
            position: relative;
            right: 50px;
        }

            #availableTypes::before, #rehomedTypes::before {
                content: "";
                position: absolute;
                display: block;
                width: 100px;
                height: 145px;
                left: 250px;
                top: 0;
                background: #FAFAFA;
                box-shadow: 1px 1px 0 0 #DDD;
            }
    </style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <div class="container main-content">
        <div class="card-body">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header card-header-warning card-header-icon">
                                    <div class="card-icon">
                                        <i class="material-icons">store</i>
                                    </div>
                                    <p class="card-category mr-2">Capacity</p>
                                    <h3 class="card-title">49/50
                                    </h3>
                                </div>
                                <div class="card-footer"></div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header card-header-success card-header-icon">
                                    <div class="card-icon">
                                        <i class="material-icons">home</i>
                                    </div>
                                    <p class="card-category mr-2">Rehomed</p>
                                    <h3 class="card-title">50</h3>
                                </div>
                                <div class="card-footer"></div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header card-header-danger card-header-icon">
                                    <div class="card-icon">
                                        <i class="material-icons">accessibility_new</i>
                                    </div>
                                    <p class="card-category mr-2">Volunteers</p>
                                    <h3 class="card-title">75</h3>
                                </div>
                                <div class="card-footer"></div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header card-header-info card-header-icon">
                                    <div class="card-icon">
                                        <i class="material-icons">pets</i>
                                    </div>
                                    <p class="card-category mr-2">Animals</p>
                                    <h3 class="card-title">245</h3>
                                </div>
                                <div class="card-footer"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-success">
                                    <div class="ct-chart" id="weeklyApplicants"></div>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Weekly Applicants</h4>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> updated 4 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-warning">
                                    <div class="ct-chart" id="weeklyVolunteerApplications"></div>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Weekly Volunteer Applications</h4>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-chart">
                                <div class="card-header card-header-danger">
                                    <div class="ct-chart" id="weeklyRehomedAnimals"></div>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Weekly Rehomed Animals</h4>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> campaign sent 2 days ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="card card-chart">
                                <div class="card-header" style="background-color: #f3eeee">
                                    <div id="availableTypes"></div>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Animal Types (Available)</h4>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> updated 4 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="card card-chart">
                                <div class="card-header" style="background-color: #f3eeee">
                                    <div id="rehomedTypes"></div>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Animal Types (Rehomed)</h4>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        <i class="material-icons">access_time</i> updated 4 minutes ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/Scripts/jquery-3.3.1.js"></script>
    <script src="/Scripts/material-kit/material-dashboard.js"></script>
    <script type="text/javascript">
        //google charts
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawCharts);
        function drawCharts() {
            getAnimalsByType(false);
            getAnimalsByType(true);
        }
        function drawAnimalPieChart(arrayData, isRehomed) {
            // pie chart data
            var pieData = google.visualization.arrayToDataTable(arrayData);
            // pie chart options
            var pieOptions = {
                backgroundColor: 'transparent',
                pieHole: 0.4,
                colors: ["cornflowerblue",
                    "olivedrab",
                    "orange",
                    "tomato",
                    "crimson",
                    "purple",
                    "turquoise",
                    "forestgreen",
                    "navy",
                    "gray"],
                pieSliceText: 'value',
                tooltip: {
                    text: 'percentage'
                },
                fontName: 'Open Sans',
                chartArea: {
                    width: '100%',
                    height: '94%'
                },
                legend: {
                    textStyle: {
                        fontSize: 13
                    }
                }
            };
            // draw pie chart
            var pieChart;
            if (isRehomed) {
                pieChart = new google.visualization.PieChart(document.getElementById('rehomedTypes'));
            } else {
                pieChart = new google.visualization.PieChart(document.getElementById('availableTypes'));
            }

            pieChart.draw(pieData, pieOptions);
        }
        function getAnimalsByType(isRehomed) {
            $.ajax({
                type: "POST",
                url: "<%= ResolveUrl("Dashboard.aspx/GetAnimalsByType") %>",
                data: JSON.stringify({ 'isRehomed': isRehomed }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var array = [['Type of Animal', 'Count']];
                    $(response.d).each(function (index, value) {
                        array.push([value.Type, value.Count]);
                    });
                    drawAnimalPieChart(array, isRehomed);
                },
                failure: function (response) {

                }
            });
        }


        //material design charts
        
        var seq = 0, delays = 80, durations = 500;
        var seq2 = 0, delays2 = 80, durations2 = 500;
        

        var md = {
            initDashboardPageCharts: function () {

                if ($('#weeklyVolunteerApplications').length != 0) {
                    md.getWeeklyVolunteerApplicantsChart();
                }

                if ($('#weeklyApplicants').length != 0) {
                    md.getWeeklyApplicantsChart();
                }

                if ($('#weeklyRehomedAnimals').length != 0) {
                    md.getWeeklyRehomedAnimalsChart();
                }
            },
            startAnimationForLineChart: function (chart) {
                chart.on('draw', function (data) {
                    if (data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 600,
                                dur: 700,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeOutQuint
                            }
                        });
                    } else if (data.type === 'point') {
                        seq++;
                        data.element.animate({
                            opacity: {
                                begin: seq * delays,
                                dur: durations,
                                from: 0,
                                to: 1,
                                easing: 'ease'
                            }
                        });
                    }
                });

                seq = 0;
            },
            startAnimationForBarChart: function (chart) {

                chart.on('draw', function (data) {
                    if (data.type === 'bar') {
                        seq2++;
                        data.element.animate({
                            opacity: {
                                begin: seq2 * delays2,
                                dur: durations2,
                                from: 0,
                                to: 1,
                                easing: 'ease'
                            }
                        });
                    }
                });

                seq2 = 0;
            },
            initWeeklyVolunteerApplicantsChart: function (array) {
                /* ----------==========     Weekly Volunteer Applications Chart initialization    ==========---------- */

                var dataWeeklyVolunteerApplicants = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        array
                    ]
                };
                var optionsWeeklyVolunteerApplicants = {
                    axisX: {
                        showGrid: false
                    },
                    low: 0,
                    high: 20,
                    chartPadding: {
                        top: 0,
                        right: 5,
                        bottom: 0,
                        left: 0
                    }
                };
                var responsiveOptions = [
                    ['screen and (max-width: 640px)', {
                        seriesBarDistance: 5,
                        axisX: {
                            labelInterpolationFnc: function (value) {
                                return value[0];
                            }
                        }
                    }]
                ];
                var weeklyVolunteerApplications = Chartist.Bar('#weeklyVolunteerApplications', dataWeeklyVolunteerApplicants, optionsWeeklyVolunteerApplicants, responsiveOptions);
                md.startAnimationForBarChart(weeklyVolunteerApplications);
            },
            initWeeklyApplicants: function(array) {
                /* ----------==========     Weekly Applicants Chart initialization    ==========---------- */

                dataWeeklyApplicantsChart = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        array
                    ]
                };

                optionsWeeklyApplicantsChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 20, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    },
                }

                var weeklyApplicants = new Chartist.Line('#weeklyApplicants', dataWeeklyApplicantsChart, optionsWeeklyApplicantsChart);

                md.startAnimationForLineChart(weeklyApplicants);
            },
            initWeeklyRehomedAnimals: function(array) {
                /* ----------==========     Weekly Rehomed Animals Chart initialization    ==========---------- */

                dataWeeklyRehomedAnimalsChart = {
                    labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                    series: [
                        array
                    ]
                };

                optionsWeeklyRehomedAnimalsChart = {
                    lineSmooth: Chartist.Interpolation.cardinal({
                        tension: 0
                    }),
                    low: 0,
                    high: 20, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
                    chartPadding: {
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0
                    }
                }

                var weeklyRehomedAnimals = new Chartist.Line('#weeklyRehomedAnimals', dataWeeklyRehomedAnimalsChart, optionsWeeklyRehomedAnimalsChart);

                // start animation for the Completed Tasks Chart - Line Chart
                md.startAnimationForLineChart(weeklyRehomedAnimals);
            },

            getWeeklyVolunteerApplicantsChart: function () {
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("Dashboard.aspx/GetWeeklyVolunteerApplicants") %>",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        md.initWeeklyVolunteerApplicantsChart(response.d);
                    },
                    failure: function (response) {

                    }
                });
            },

            getWeeklyApplicantsChart: function() {
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("Dashboard.aspx/GetWeeklyApplicants") %>",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        md.initWeeklyApplicants(response.d);
                    },
                    failure: function (response) {

                    }
                });
            },
            getWeeklyRehomedAnimalsChart: function() {
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("Dashboard.aspx/GetWeeklyRehomedAnimals") %>",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        md.initWeeklyRehomedAnimals(response.d);
                    },
                    failure: function (response) {

                    }
                });
            }
        }

        $(window).resize(function () {
            setTimeout(function () {
                md.initDashboardPageCharts();
            }, 500);
        });
        

        $(document).ready(function() {
            $('body').bootstrapMaterialDesign();
            $('[rel="tooltip"]').tooltip();
           
            md.initDashboardPageCharts();
            setInterval(function() {
                md.initDashboardPageCharts();
                drawCharts();
            }, 1 * 60 * 1000); // 60 * 1000 milsec
        });
    </script>
</asp:Content>
