<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Aging.aspx.cs" Inherits="PAPVN.UrtForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/chart.js/Chart.min.js"></script>
    <%--<div class="content-header" style="padding: 5px">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 style="margin: 0px">Aging/Final Check</h4>
                </div>
            </div>
        </div>
    </div>--%>
    <div class="content" style="margin: 10px 0px 0px 0px">
        <div class="row" style="margin: 0px 15px 0px 15px; background-color:lightgray; border-radius:8px ">
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

            <div class="col-sm-4  mr-2 ml-4">
                <div class="form-group" style="margin: 10px 0px 10px 0px">

                    <div class="input-group date" id="reservationdatetimefrom" data-target-input="nearest">
                        <input style="font-size:20px; font-weight:400" placeholder="Select Date Time From" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimefrom">
                        <div class="input-group-append" data-target="#reservationdatetimefrom" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 mr-2">
                <div class="form-group" style="margin: 10px 0px 10px 0px">
                    <div class="input-group date" id="reservationdatetimeto" data-target-input="nearest">
                        <input  style="font-size:20px; font-weight:400" placeholder="Select Date Time To" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimeto">
                        <div class="input-group-append" data-target="#reservationdatetimeto" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2 mr-2" style="margin: 10px 0px 10px 0px">
                <button style="height:40px; padding:0px; width:200px" type="button" class="btn btn-block btn-info btn-lg">Load Data</button>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row" style="margin: 20px 0px 0px 0px">
                <div class="chart col-sm-6" style="padding: 10px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h4 style="font-weight:600">Biểu đồ tỉ lệ OK/NG</h4>
                    </div>
                    <div class="chart-container">
                        <canvas id="pieChart" style="min-height: 350px; "></canvas>

                    </div>



                </div>
                <div class="chart col-sm-6" style="padding: 10px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h4 style="font-weight:600">Biểu đồ số lượng tủ OK/NG/PENDING</h4>
                    </div>
                    <div class="chart-container">
                  <canvas id="stackedBarChart" style="min-height: 350px;"></canvas>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 10px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h4 style="font-weight:600">Biểu đồ số lượng tủ Pending từng công đoạn</h4>
                    </div>
                    <div class="chart-container">
                        <canvas id="lineChart2" style="min-height: 350px;"></canvas>
                    </div>

                </div>
                <div class="chart col-sm-6" style="padding: 10px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h4 style="font-weight:600">Biểu đồ số lượng tủ NG từng công đoạn</h4>
                    </div>
                    <div class="chart-container">
                        <canvas id="lineChart" style="min-height: 350px;"></canvas>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <%-- <div class="card-body">
                <div id="donut-chart" style="height: 300px;"></div>
              </div>
                <div class="card-body">
                <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>--%>

    <script>
       
        /*var areaChartCanvas = $('#areaChart').get(0).getContext('2d')*/

        var areaChartCanvas = $('#lineChart').get(0)
        var ctx = areaChartCanvas.getContext('2d')
        //var areaChartCanvas1 = $('#lineChart1').get(0)
        //var ctx1 = areaChartCanvas1.getContext('2d')

        var areaChartCanvas2 = $('#lineChart2').get(0)
        var ctx2 = areaChartCanvas2.getContext('2d')

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
        var chart = new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: areaChartOptions

        });
        //var chart1 = new Chart(ctx1, {
        //    type: 'line',
        //    data: chartData,
        //    options: areaChartOptions

        //});

        var chart2 = new Chart(ctx2, {
            type: 'line',
            data: chartData,
            options: areaChartOptions

        });


        function test() {
            $.ajax({
                type: 'POST',
                url: '/MyWebSercive.asmx/DataForLineChart',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    var data = JSON.parse(response.d);
                    chartData.labels = data.labels;
                    chartData.datasets[0].data = data.values;
                    chart.update();
                    //chart1.update();
                    chart2.update();
                },
                error: function (xhr, status, error) {
                    alert(error)
                }
            });
        }
        setInterval(test, 1000);

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
           

            var areaChartData = {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [
                    {
                        label: 'Digital Goods',
                        backgroundColor: '#008000',
                        borderColor: 'rgba(60,141,188,0.8)',
                        pointRadius: false,
                        pointColor: '#3b8bba',
                        pointStrokeColor: 'rgba(00,80,00,1)',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(60,141,188,1)',
                        data: [28, 48, 40, 19, 86, 27, 90]
                    },
                    {
                        label: 'Electronics',
                        backgroundColor: '#FF0000',
                        borderColor: 'rgba(210, 214, 222, 1)',
                        pointRadius: false,
                        pointColor: 'rgba(210, 214, 222, 1)',
                        pointStrokeColor: '#c1c7d1',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(220,220,220,1)',
                        data: [65, 59, 80, 81, 56, 55, 40]
                    },
                    {
                        label: 'Electronics',
                        backgroundColor: '#FFD700',
                        borderColor: 'rgba(210, 214, 222, 1)',
                        pointRadius: false,
                        pointColor: 'rgba(210, 214, 222, 1)',
                        pointStrokeColor: '#c1c7d1',
                        pointHighlightFill: '#fff',
                        pointHighlightStroke: 'rgba(220,220,220,1)',
                        data: [65, 59, 80, 81, 56, 55, 40]
                    },
                ]
            }

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
                        }
                    }],
                    yAxes: [{
                        gridLines: {
                            display: false,
                        }
                    }]
                }
            }
            var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
            var stackedBarChartData = $.extend(true, {}, areaChartData)

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
                data: stackedBarChartData,
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

