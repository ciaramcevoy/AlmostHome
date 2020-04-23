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

        .align-right {
            z-index: 10;
            position: absolute;
            right: 0;
            top: 0;
        }
    </style>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <div class="container main-content">
        <div class="card-body">
            <div class="row">
                <a class="btn btn-default btn-round btn-sm align-right" href="/Pages/Admin/Index">
                    <i class="material-icons">keyboard_backspace</i> Return to Admin Home
                    <div class="ripple-container"></div>
                </a>
            </div>
            
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
                                    <h3 class="card-title"><span id="capacityCount"></span>/150
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
                                    <h3 class="card-title"><span id="rehomedCount"></span></h3>
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
                                    <h3 class="card-title"><span id="volunteerCount"></span></h3>
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
                                    <p class="card-category mr-2">Total Animals</p>
                                    <h3 class="card-title"><span id="totalCount"></span></h3>
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
                                        <i class="material-icons">access_time</i> updated&nbsp; <span id="weeklyApplicantsTime" data-lastupdated=""></span>&nbsp; ago
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
                                        <i class="material-icons">access_time</i> updated&nbsp; <span id="weeklyVolunteerApplicationsTime" data-lastupdated=""></span>&nbsp; ago
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
                                        <i class="material-icons">access_time</i> updated&nbsp; <span id="weeklyRehomedAnimalsTime" data-lastupdated=""></span>&nbsp; ago
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
                                        <i class="material-icons">access_time</i> updated&nbsp; <span id="availableTypesTime" data-lastupdated=""></span>&nbsp; ago
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
                                        <i class="material-icons">access_time</i> updated&nbsp; <span id="rehomedTypesTime" data-lastupdated=""></span>&nbsp; ago
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
                $('#rehomedTypesTime').attr('data-lastupdated', new Date().getTime());
                $('#rehomedTypesTime').text('1 second');
            } else {
                pieChart = new google.visualization.PieChart(document.getElementById('availableTypes'));
                $('#availableTypesTime').attr('data-lastupdated', new Date().getTime());
                $('#availableTypesTime').text('1 second');
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

                md.initCounts();
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
                $('#weeklyVolunteerApplicationsTime').attr('data-lastupdated', new Date().getTime());
                $('#weeklyVolunteerApplicationsTime').text('1 second');
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

                $('#weeklyApplicantsTime').attr('data-lastupdated', new Date().getTime());
                $('#weeklyApplicantsTime').text('1 second');
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
               
                $('#weeklyRehomedAnimalsTime').attr('data-lastupdated', new Date().getTime());
                $('#weeklyRehomedAnimalsTime').text('1 second');
            },
            initCounts: function () {
                md.getAnimalCounts(false, false, 1);
                md.getAnimalCounts(true, false, 2);
                md.getAnimalCounts(false, true, 3);
                md.getVolunteerCount();
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
            },
            getAnimalCounts: function(rehomed, all, type) {
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("Dashboard.aspx/GetAnimalCounts") %>",
                    data: JSON.stringify({ 'rehomed': rehomed, 'all': all  }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (type == 1) {
                            $('#capacityCount').text(response.d);
                        } else if (type == 2) {
                            $('#rehomedCount').text(response.d);
                        } else if (type == 3) {
                            $('#totalCount').text(response.d);
                        }
                    },
                    failure: function (response) {
                        return 0;
                    }
                });
            },
            getVolunteerCount: function() {
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("Dashboard.aspx/GetVolunteerCount") %>",
                    data: {},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#volunteerCount').text(response.d);
                    },
                    failure: function (response) {
                        return 0;
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

            //availableTypesTime-rehomedTypesTime auto refresh
            setInterval(function() {
                drawCharts();
            }, 10 * 60 * 1000); // 60 * 1000 milsec

            //getWeeklyVolunteerApplicantsChart auto refresh
            setInterval(function() {
                md.getWeeklyVolunteerApplicantsChart();
            }, 7 * 60 * 1000); // 60 * 1000 milsec

            //getWeeklyApplicantsChart auto refresh
            setInterval(function() {
                md.getWeeklyApplicantsChart();
            }, 4 * 60 * 1000); // 60 * 1000 milsec

            //getWeeklyRehomedAnimalsChart auto refresh
            setInterval(function() {
                md.getWeeklyRehomedAnimalsChart();
            }, 5 * 60 * 1000); // 60 * 1000 milsec


            setInterval(function() {
                updateTimeSince();
            }, 30000); // 60 * 1000 milsec
        });


        function updateTimeSince() {
            $('#weeklyVolunteerApplicationsTime').text(timeSince($('#weeklyVolunteerApplicationsTime').attr('data-lastupdated')));
            $('#weeklyApplicantsTime').text(timeSince($('#weeklyApplicantsTime').attr('data-lastupdated')));
            $('#weeklyRehomedAnimalsTime').text(timeSince($('#weeklyRehomedAnimalsTime').attr('data-lastupdated')));
            $('#availableTypesTime').text(timeSince($('#availableTypesTime').attr('data-lastupdated')));
            $('#rehomedTypesTime').text(timeSince($('#rehomedTypesTime').attr('data-lastupdated')));
        }
        
        //https://stackoverflow.com/questions/3177836/how-to-format-time-since-xxx-e-g-4-minutes-ago-similar-to-stack-exchange-site
        function timeSince(date) {

            var seconds = Math.floor((new Date() - date) / 1000);

            var interval = Math.floor(seconds / 31536000);

            if (interval > 1) {
                return interval + " years";
            }
            interval = Math.floor(seconds / 2592000);
            if (interval > 1) {
                return interval + " months";
            }
            interval = Math.floor(seconds / 86400);
            if (interval > 1) {
                return interval + " days";
            }
            interval = Math.floor(seconds / 3600);
            if (interval > 1) {
                return interval + " hours";
            }
            interval = Math.floor(seconds / 60);
            if (interval > 1) {
                return interval + " minutes";
            }
            return Math.floor(seconds) + " seconds";
        }
    </script>
</asp:Content>
