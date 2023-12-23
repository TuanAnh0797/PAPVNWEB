﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgingHistory.aspx.cs" Inherits="PAPVN.UrtForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/chart.js/Chart.min.js"></script>
    <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:500">Aging/Final Check</h1>
        <div class="row" style="margin: 0px 15px 0px 15px; background-color: #fffefe; border-radius: 8px;">
            <%-- <div class="col-sm  mr-2 ml-2">
                <div class="form-group " style="margin: 5px 0px 5px 0px">
                    <select runat="server" class="form-control select2 " style="width: 100%;">
                        <option>--Select Model--</option>
                    </select>
                </div>
            </div>
           
            <div class="col-sm bg-success mr-2">
                <div class="form-group" style="margin: 5px 0px 5px 0px">
                    <select runat="server" class="form-control select2" style="width: 100%;">
                        <option>--Select Model--</option>
                    </select>
                </div>
            </div>--%>
            <div class="col  mr-2 ">
                <div class="form-group" style="margin: 10px 0px 10px 0px">
                    <div class="d-flex flex-row">
                        <div>
                            <p style="margin:5px 3px 0px 0px; font-size:20px; font-weight:600"> Date Time From:</p>
                        </div>
                         <div class="flex-fill">
                             <div class=" input-group date" id="reservationdatetimefrom" data-target-input="nearest">
                            <input id="datefrom" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time From" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimefrom">
                            <div class="input-group-append" data-target="#reservationdatetimefrom" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                         </div>
                        
                        
                    </div>


                </div>
            </div>
            <div class="col mr-2">
                <div class="form-group" style="margin: 10px 0px 10px 0px">

                    <div class="d-flex flex-row">
                        <div>
                            <p style="margin:5px 3px 0px 0px; font-size:20px; font-weight:600"> Date Time To:</p>
                        </div>
                        <div class="flex-fill">
                            <div class="input-group date" id="reservationdatetimeto" data-target-input="nearest">
                        <input id="dateto" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time To" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimeto">
                        <div class="input-group-append" data-target="#reservationdatetimeto" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                        </div>
                    </div>


                    
                </div>
            </div>
            <div class="col mr-2" style="margin: 10px 0px 0px 0px">
                <button id="btn_loaddata" style="height: 40px; padding: 0px; font-size: 25px; font-weight: 600; width:160px" type="button" class="btn btn-block btn-info btn-lg">Load Data</button>
            </div>
        </div>
    </div>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
            <div class="row" style="margin: 10px 0px 0px 0px">
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 350px; height: 100%"></canvas>
                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ OK/NG/PENDING</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="stackedBarChart" style="min-height: 350px; height: 100%"></canvas>
                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ Pending từng công đoạn</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="barChartpending" style="min-height: 350px;"></canvas>

                        </div>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h4 style="font-weight: 600">Biểu đồ số lượng tủ NG từng công đoạn</h4>
                        </div>
                        <div class="chart-container">
                            <canvas id="barChartng" style="min-height: 350px;"></canvas>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
    <script>

        /*var areaChartCanvas = $('#areaChart').get(0).getContext('2d')*/

        //var areaChartCanvas = $('#lineChart').get(0)
        //var ctx = areaChartCanvas.getContext('2d')
        //var areaChartCanvas1 = $('#lineChart1').get(0)
        //var ctx1 = areaChartCanvas1.getContext('2d')

        //var areaChartCanvas2 = $('#lineChart2').get(0)
        //var ctx2 = areaChartCanvas2.getContext('2d')

        var chartData = {
            labels: [],
            datasets: [{
                label: 'Data',
                data: [],
                borderColor: 'blue',
                borderWidth: 1,
                fill: false,
                pointRadius: 1
            }],

        };
        var areaChartOptions = {
            maintainAspectRatio: false,
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                xAxes: [{
                    gridLines: {
                        display: false,
                    }
                }],
                yAxes: [{
                    display: true,
                    ticks: {
                        beginAtZero: true,
                        max: 1000
                    }
                }]
            }
        };
        //var chart = new Chart(ctx, {
        //    type: 'line',
        //    data: chartData,
        //    options: areaChartOptions

        //});
        //var chart1 = new Chart(ctx1, {
        //    type: 'line',
        //    data: chartData,
        //    options: areaChartOptions

        //});

        //var chart2 = new Chart(ctx2, {
        //    type: 'line',
        //    data: chartData,
        //    options: areaChartOptions

        //});


        function LoadDataForChart() {
            var datetimefrom = $('#datefrom').val();
            var datetimeto = $('#dateto').val();
            $.ajax({
                type: 'POST',
                url: '/MyWebSercive.asmx/DataForLineChart',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ DateTimeFrom: datetimefrom, DateTimeTo: datetimeto }),
                success: function (response) {
                    var data = JSON.parse(response.d);
                    //chartData.labels = data.labels;
                    //chartData.datasets[0].data = data.values;
                    //chart.update();
                    //chart1.update();
                    //chart2.update();
                    alert(data.datefrom + data.dateto);
                },
                error: function (xhr, status, error) {
                    alert(error)
                }
            });
        }
        document.getElementById('btn_loaddata').onclick = LoadDataForChart;
        //setInterval(LoadDataForChart, 1000);

        $(function () {
          <%--  var lineChartCanvas = $('#lineChart').get(0).getContext('2d');

            var lineChartData = <%=mydata%>;
            var areaChartOptions = {
                maintainAspectRatio: false,
                responsive: true,
                legend: {
                    display: false
                },
                scales: {
                    xAxes: [{
                        gridLines: {
                            display: false,
                        },
                        type: 'category',
                        position: 'bottom',
                        ticks: {
                            display: false 
                        }
                    }],
                    yAxes: [{
                        display: true,
                        ticks: {
                            beginAtZero: true,
                            max: 1000
                        }
                    }]
                },
                plugins: {
                    zoom: {
                        zoom: {
                            enabled: true, // Kích hoạt plugin zoom
                            mode: 'xy', // Zoom theo trục x
                        }
                    }
                }
            };

            new Chart(lineChartCanvas, {
                type: 'line',
                data: lineChartData,
                options: areaChartOptions
            });

            var donutData = [
                {
                    label: 'OK',
                    data: 90,
                    color: 'Green'
                },
                {
                    label: 'NG',
                    data: 10,
                    color: 'Red'
                }

            ]
            $.plot('#donut-chart', donutData, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        innerRadius: 0.5,
                        label: {
                            show: true,
                            radius: 3 / 4,
                            formatter: labelFormatter,
                            threshold: 0.1
                        }

                    }
                },
                legend: {
                    show: false
                }
            })--%>
            /*
             * END DONUT CHART
             */


            var datachartPending = {
                labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
                datasets: [
                    {
                        label: 'PENDING',
                        backgroundColor: '#FFD700',
                        borderColor: 'rgba(60,141,188,0.8)',
                        pointRadius: false,
                        pointColor: '#3b8bba',
                        pointStrokeColor: 'rgba(00,80,00,1)',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(60,141,188,1)',
                        data: [2, 1, 0, 4, 8, 30, 23,5,6,0,6,0]
                    },
                    
                ]

            }
            var datachartNG = {
                labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
                datasets: [
                    {
                        label: 'NG',
                        backgroundColor: '#FF0000',
                        borderColor: 'rgba(60,141,188,0.8)',
                        pointRadius: false,
                        pointColor: '#3b8bba',
                        pointStrokeColor: 'rgba(00,80,00,1)',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(60,141,188,1)',
                        data: [2, 1, 0, 4, 8, 30, 23, 5, 6, 0, 6, 0]
                    },

                ]

            }


            var dattachartOKNGPending = {
                labels: ['VP', 'GAS', 'WI1(W)', 'WI1(S)', 'IP', 'DF', 'TEMP', 'IOT', 'WI2', 'PAN', 'CAM B', 'CAM F'],
                datasets: [
                    {
                        label: 'OK',
                        backgroundColor: '#008000',
                        borderColor: 'rgba(60,141,188,0.8)',
                        pointRadius: false,
                        pointColor: '#3b8bba',
                        pointStrokeColor: 'rgba(00,80,00,1)',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(60,141,188,1)',
                        data: [2, 1, 0, 4, 8, 30, 23, 5, 6, 0, 6, 0]
                    },
                    {
                        label: 'NG',
                        backgroundColor: '#FF0000',
                        borderColor: 'rgba(210, 214, 222, 1)',
                        pointRadius: false,
                        pointColor: 'rgba(210, 214, 222, 1)',
                        pointStrokeColor: '#c1c7d1',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(220,220,220,1)',
                        data: [2, 1, 0, 4, 8, 30, 23, 5, 6, 0, 6, 0]
                    },
                    {
                        label: 'PENDING',
                        backgroundColor: '#FFD700',
                        borderColor: 'rgba(210, 214, 222, 1)',
                        pointRadius: false,
                        pointColor: 'rgba(210, 214, 222, 1)',
                        pointStrokeColor: '#c1c7d1',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(220,220,220,1)',
                        data: [2, 1, 0, 4, 8, 30, 23, 5, 6, 0, 6, 0]
                    },
                ]
            }

            //var areaChartOptions = {
            //    maintainAspectRatio: false,
            //    responsive: true,
            //    legend: {
            //        display: false
            //    },
            //    scales: {
            //        xAxes: [{
            //            gridLines: {
            //                display: false,
            //            }
            //        }],
            //        yAxes: [{
            //            gridLines: {
            //                display: false,
            //            }
            //        }]
            //    }
            //}
            var barChartCanvas = $('#barChartpending').get(0).getContext('2d')
            //var barChartData = $.extend(true, {}, areaChartData)
            //var temp0 = areaChartData.datasets[0]
            //var temp1 = areaChartData.datasets[1]
            //barChartData.datasets[0] = temp1
            //barChartData.datasets[1] = temp0

            var barChartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                datasetFill: false
            }

            new Chart(barChartCanvas, {
                type: 'bar',
                data: datachartPending,
                options: barChartOptions
            })
            var barChartCanvas = $('#barChartng').get(0).getContext('2d')
            //var barChartData = $.extend(true, {}, areaChartData)
            //var temp0 = areaChartData.datasets[0]
            //var temp1 = areaChartData.datasets[1]
            //barChartData.datasets[0] = temp1
            //barChartData.datasets[1] = temp0

            var barChartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                datasetFill: false
            }

            new Chart(barChartCanvas, {
                type: 'bar',
                data: datachartNG,
                options: barChartOptions
            })


            var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
           /* var stackedBarChartData = $.extend(true, {}, areaChartData)*/

            var stackedBarChartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        stacked: true,
                    }],
                    yAxes: [{
                        stacked: true
                    }]
                }
            }

            new Chart(stackedBarChartCanvas, {
                type: 'bar',
                data: dattachartOKNGPending,
                options: stackedBarChartOptions
            })
            var donutData = {
                labels: [
                    'OK',
                    'NG'

                ],
                datasets: [
                    {
                        data: [700, 100],
                        backgroundColor: ['#008000', '#FF0000'],
                    }
                ]
            }
            var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
            var pieData = donutData;
            var pieOptions = {
                maintainAspectRatio: false,
                responsive: true,
            }
            //Create pie or douhnut chart
            // You can switch between pie and douhnut using the method below.
            new Chart(pieChartCanvas, {
                type: 'pie',
                data: pieData,
                options: pieOptions
            })


        })
        function labelFormatter(label, series) {
            return '<div style="font-size:13px; text-align:center; padding:2px;; color: #fff; font-weight: 600;">'
                + label
                + '<br>'
                + Math.round(series.percent) + '%</div>'
        }

    </script>
</asp:Content>
