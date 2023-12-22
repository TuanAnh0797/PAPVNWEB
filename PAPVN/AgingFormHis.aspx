<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgingFormHis.aspx.cs" Inherits="PAPVN.UrtFormHis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/chart.js/Chart.min.js"></script>
    <div class="content-header" style="padding:5px">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 style="margin:0px">URT Stage / History</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="content">
        <%--<div style="text-align: center; padding-top: 20px">
            <h2>Biểu đồ minh họa</h2>
        </div>--%>
        <div style="padding: 10px 10px 10px 10px">
            <div class="chart">
                <canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 100%; max-width: 100%;"></canvas>
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
        var areaChartCanvas = $('#lineChart').get(0)
        var ctx = areaChartCanvas.getContext('2d')
        var chartData = {
            labels: [],
            datasets: [{
                label: 'Data',
                data: [],
                borderColor: 'blue',
                borderWidth: 1,
                fill: false
            }],

        };
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
                },
                error: function (xhr, status, error) {
                    alert(error)
                }
            });
        }
        setInterval(test, 1000);

       <%-- $(function () {
            var lineChartCanvas = $('#lineChart').get(0).getContext('2d');

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
            });--%>

        //    var donutData = [
        //        {
        //            label: 'OK',
        //            data: 90,
        //            color: 'Green'
        //        },
        //        {
        //            label: 'NG',
        //            data: 10,
        //            color: 'Red'
        //        }

        //    ]
        //    $.plot('#donut-chart', donutData, {
        //        series: {
        //            pie: {
        //                show: true,
        //                radius: 1,
        //                innerRadius: 0.5,
        //                label: {
        //                    show: true,
        //                    radius: 3 / 4,
        //                    formatter: labelFormatter,
        //                    threshold: 0.1
        //                }

        //            }
        //        },
        //        legend: {
        //            show: false
        //        }
        //    })
        //    /*
        //     * END DONUT CHART
        //     */
        //    var donutData = {
        //        labels: [
        //            'Chrome',
        //            'IE',
        //            'FireFox',
        //            'Safari',
        //            'Opera',
        //            'Navigator',
        //        ],
        //        datasets: [
        //            {
        //                data: [700, 500, 400, 600, 300, 100],
        //                backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        //            }
        //        ]
        //    }
        //    var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        //    var pieData = donutData;
        //    var pieOptions = {
        //        maintainAspectRatio: false,
        //        responsive: true,
        //    }
        //    //Create pie or douhnut chart
        //    // You can switch between pie and douhnut using the method below.
        //    new Chart(pieChartCanvas, {
        //        type: 'pie',
        //        data: pieData,
        //        options: pieOptions
        //    })


        //})
        //function labelFormatter(label, series) {
        //    return '<div style="font-size:13px; text-align:center; padding:2px;; color: #fff; font-weight: 600;">'
        //        + label
        //        + '<br>'
        //        + Math.round(series.percent) + '%</div>'
        //}

    </script>
</asp:Content>
