<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanURT.aspx.cs" Inherits="PAPVN.RealTimePlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--     <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:150">Management Plan/Real Time</h1>
    </div>--%>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
            <div class="chart" style="padding: 5px;">
                <div style="background-color: white; padding: 5px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h1 style="font-weight: 600">Biểu đồ sản lượng URT theo model</h1>
                    </div>
                    <div class="chart-container">
                        <canvas id="barchart" style="min-height: 580px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="chart col-sm-4" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG URT</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 400px; height: 100%"></canvas>
                        </div>
                    </div>
                </div>
                <div class="chart col-sm-8" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 5px 0px 0px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tổng sản lượng URT</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="linechart" style="min-height: 400px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            //Bar chart
            var databarchart = {
                labels: [],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#248f24',
                        order: 2,
                        //data: dataPlan,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#ffff4d',
                        categoryPercentage: 0.6,
                        order: 1,
                        //data: dataPlanHour,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Actual',
                        backgroundColor: '#668cff',
                        order: 0,
                        categoryPercentage: 0.35,
                        // data: dataPlanActual,
                        data: []
                    },
                ]
            }
            var barChartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                datasetFill: false,
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 20
                        },
                        gridLines: {
                            display: false
                        },
                        stacked: true,
                    }],
                    yAxes: [{
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                        },
                    }],
                },
                legend: {
                    position: 'bottom',
                    labels: {
                        fontSize: 15,
                    },
                },
                animation: {
                    duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                            ctx = chartInstance.ctx;
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                        this.data.datasets.forEach(function (dataset, i) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y);
                            });
                        });
                    }
                }
            }
            var barChartCanvas = $('#barchart').get(0).getContext('2d')
            var barchartplan = new Chart(barChartCanvas, {
                type: 'bar',
                data: databarchart,
                options: barChartOptions
            })
            //Pie chart
            var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
            var donutData = {
                labels: [
                    'OK',
                    'NG'
                ],
                datasets: [
                    {
                        data: [],
                        backgroundColor: ['#008000', '#FF0000'],
                    }
                ]
            }
            var pieOptions = {
                maintainAspectRatio: false,
                responsive: true,
                events: false,
                animation: {
                    duration: 500,
                    easing: "easeOutQuart",
                    onComplete: function () {
                        var ctx = this.chart.ctx;
                        ctx.font = "500 18px Arial";
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                        donutData.datasets.forEach(function (dataset) {
                            for (var i = 0; i < dataset.data.length; i++) {
                                var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
                                    total = dataset._meta[Object.keys(dataset._meta)[0]].total,
                                    mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius) / 2,
                                    start_angle = model.startAngle,
                                    end_angle = model.endAngle,
                                    mid_angle = start_angle + (end_angle - start_angle) / 2;
                                var x = mid_radius * Math.cos(mid_angle);
                                var y = mid_radius * Math.sin(mid_angle);
                                ctx.fillStyle = '#fff';
                                if (i == 3) { // Darker text color for lighter background
                                    ctx.fillStyle = '#444';
                                }
                                var val = dataset.data[i];
                                var percent = " (" + String(Math.round(val / total * 100)) + "%)";
                                if (val != 0) {
                                    ctx.fillText(dataset.data[i] + percent, model.x + x, model.y + y);
                                }
                            }
                        });
                    }
                }
            }
            var charpie = new Chart(pieChartCanvas, {
                type: 'pie',
                data: donutData,
                options: pieOptions
            })
            //Line Chart
            var DataLineChart = {
                labels: ['06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', '00:00', '01:00', '02:00', '03:00', '04:00', '05:00'],
                datasets: [
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        data:[],
                        fill: false,
                    },
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Actual',
                        borderColor: '#b38600',
                        data:[],
                        fill: false,
                    },
                    {
                        type: 'bar',
                        label: 'Diff',
                        backgroundColor: function (context) {
                            var value = context.dataset.data[context.dataIndex];
                            return value < 0 ? 'red' : 'green';
                        },
                        yAxisID: 'y-axis-2',
                        order: 1,
                        data:[]
                    },
                ]
            };
           
            //var maxDataValuebarchartdiff = Math.max(...DataLineChart.datasets[2].data);
            //var maxYAxisValuebarchartdiff = maxDataValuebarchartdiff + 10;
            var LineChartOption =
            {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        ticks: {
                            fontSize: 15
                        },
                    }],
                    yAxes: [{
                        beginAtZero: true,
                        id: 'y-axis-1', // ID của trục y thứ nhất
                        type: 'linear',
                        position: 'left', // Vị trí của trục y thứ nhất
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                        },
                    },
                    {
                        id: 'y-axis-2', // ID của trục y thứ hai
                        type: 'linear',
                        position: 'right', // Vị trí của trục y thứ hai
                        ticks: {
                            fontSize: 15,
                            beginAtZero: true,
                            //max: maxYAxisValuebarchartdiff,
                            //min: -maxYAxisValuebarchartdiff,
                        },
                        gridLines: {
                            display: false
                        },
                    }]
                },
                animation: {
                    duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                            ctx = chartInstance.ctx;
                        ctx.font = "500 18px Arial";
                        ctx.fillStyle = '#000000';
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';
                        this.data.datasets.forEach(function (dataset, i) {
                            if (i == 2) {
                                var meta = chartInstance.controller.getDatasetMeta(i);
                                meta.data.forEach(function (bar, index) {
                                    var data = dataset.data[index];
                                    if (data >= 0) {
                                        ctx.fillText(data, bar._model.x, bar._model.y - 5);
                                    }
                                    else {
                                        ctx.fillText(data, bar._model.x, bar._model.y + 20);
                                    }
                                });
                            }
                        });
                    }
                }
            };
            var lineChartCanvas = $('#linechart').get(0).getContext('2d')
            var linechart = new Chart(lineChartCanvas, {
                type: 'line',
                data: DataLineChart,
                options: LineChartOption
            })

            LoadDataForPieChart();
            LoadDataForBarchart();
            LoadDataForLineChart();
            setInterval(LoadDataForPieChart, 5000);
            setInterval(LoadDataForBarchart, 5000);
            setInterval(LoadDataForLineChart, 5000);
            // Load Data OK NG
            function LoadDataForPieChart() {
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForPieChart',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        donutData.datasets[0].data = data.Datapiechart;
                        charpie.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }
             // Load Data Plan by Model
            function LoadDataForBarchart() {
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForBarChart',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        databarchart.datasets[0].data = data.dataplan;
                        databarchart.datasets[1].data = data.dataplanpertime;
                        databarchart.datasets[2].data = data.dataactual;
                        databarchart.labels = data.labels;
                        barChartOptions.scales.yAxes[0].ticks.max = Math.max(...data.dataplan) + 30;
                        barchartplan.options = barChartOptions;
                        barchartplan.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }
            // Load Data Plan by Total
            function LoadDataForLineChart() {
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForLineChart',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        DataLineChart.datasets[0].data = data.dataplan;
                        DataLineChart.datasets[1].data = data.dataactual;
                        DataLineChart.datasets[2].data = data.datadiff;
                        var maxvl = Math.max(...data.datadiff) + 10;
                        LineChartOption.scales.yAxes[1].ticks.max = maxvl;
                        LineChartOption.scales.yAxes[1].ticks.min = -maxvl;
                        linechart.options = LineChartOption;
                        linechart.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }
        });
    </script>
</asp:Content>
