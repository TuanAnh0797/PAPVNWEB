<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlanGAS.aspx.cs" Inherits="PAPVN.PlanGAS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--     <div class="content-header" style="padding: 5px;">
        <h1 style="margin:0px 0px 0px 20px; font-weight:150">Management Plan/Real Time</h1>
    </div>--%>
    <div class="content" style="margin: 0px 0px 0px 0px;">
        <div class="container-fluid">
            <div class="chart" style="padding: 5px;">
                <div style="background-color: white; padding: 5px">
                    <div style="display: flex; align-items: center; justify-content: center">
                        <h1 style="font-weight: 600">Biểu đồ sản lượng nạp GAS theo model</h1>
                    </div>
                    <div class="chart-container">
                        <canvas id="barchart" style="min-height: 580px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <%-- <div class="chart col-sm-4" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h2 style="font-weight: 600">Biểu đồ tỉ lệ OK/NG nạp GAS</h2>
                        </div>
                        <div class="chart-container">
                            <canvas id="pieChart" style="min-height: 400px;"></canvas>
                        </div>
                    </div>
                </div>--%>
                <div class="chart  col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h1 style="font-weight: 600">Biểu đồ sản lượng nạp GAS Model đặc biệt</h1>
                        </div>
                        <div class="chart-container">
                            <canvas id="barchartmonitor" style="min-height: 438px;"></canvas>
                        </div>
                    </div>
                </div>
                <div class="chart col-sm-6" style="padding: 5px;">
                    <div style="background-color: white; padding: 5px; margin: 0px 0px 0px 0px">
                        <div style="display: flex; align-items: center; justify-content: center">
                            <h1 style="font-weight: 600">Biểu đồ sản lượng nạp GAS theo thời gian</h1>
                        </div>
                        <div class="row ml-3">

                            <div class=" col-sm-2">
                                <h2 style="color:blue; font-weight:bold">Plan: <span id="dataplan"></span></h2>
                            </div>
                            <div class=" col-sm-2">
                                <h2 style="color:#cc9900; font-weight:bold">Target: <span id="datatarget"></span></h2>
                            </div>
                            <div class=" col-sm-2">
                                <h2 style="color:green; font-weight:bold">Actual: <span id="dataactual"></span></h2>
                            </div>


                            <div class=" col-sm-6" style="display: flex; justify-content: flex-end;">
                                <select runat="server" id="modelplan" class="form-control select2" style="width: 200px">
                                    <option>--All Model--</option>
                                </select>

                            </div>



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
            var barChartCanvas = $('#barchart').get(0).getContext('2d')
            var databarchart = {
                labels: [],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#1a53ff',

                        order: 2,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#cc9900',
                        categoryPercentage: 0.6,
                        order: 1,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Actual',
                        //backgroundColor: '#248f24',
                        order: 0,
                        categoryPercentage: 0.35,
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

            var barchartplan = new Chart(barChartCanvas, {
                type: 'bar',
                data: databarchart,
                options: barChartOptions
            })
            //Bar chart monitor
            var barChartCanvasmonitor = $('#barchartmonitor').get(0).getContext('2d')
            var databarchartmonitor = {
                labels: [],
                datasets: [
                    {
                        type: 'bar',
                        label: 'Plan',
                        backgroundColor: '#1a53ff',
                        order: 2,
                        //data: dataPlan,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Plan/Time',
                        backgroundColor: '#cc9900',
                        categoryPercentage: 0.6,
                        order: 1,
                        //data: dataPlanHour,
                        data: []
                    },
                    {
                        type: 'bar',
                        label: 'Actual',

                        //backgroundColor: '#248f24',
                        order: 0,
                        categoryPercentage: 0.35,

                        data: []
                    },
                ]
            }
            var barChartOptionsmonitor = {
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

            var barchartplanmonitor = new Chart(barChartCanvasmonitor, {
                type: 'bar',
                data: databarchartmonitor,
                options: barChartOptionsmonitor
            })


            ////Pie chart
            //var donutData = {
            //    labels: [
            //        'OK',
            //        'NG'
            //    ],
            //    datasets: [
            //        {
            //            data: [],
            //            backgroundColor: ['#008000', '#FF0000'],
            //        }
            //    ]
            //}
            //var pieOptions = {
            //    maintainAspectRatio: false,
            //    responsive: true,
            //    events: false,
            //    animation: {
            //        duration: 500,
            //        easing: "easeOutQuart",
            //        onComplete: function () {
            //            var ctx = this.chart.ctx;
            //            ctx.font = "500 18px Arial";
            //            ctx.textAlign = 'center';
            //            ctx.textBaseline = 'bottom';
            //            donutData.datasets.forEach(function (dataset) {
            //                for (var i = 0; i < dataset.data.length; i++) {
            //                    var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model,
            //                        total = dataset._meta[Object.keys(dataset._meta)[0]].total,
            //                        mid_radius = model.innerRadius + (model.outerRadius - model.innerRadius) / 2,
            //                        start_angle = model.startAngle,
            //                        end_angle = model.endAngle,
            //                        mid_angle = start_angle + (end_angle - start_angle) / 2;
            //                    var x = mid_radius * Math.cos(mid_angle);
            //                    var y = mid_radius * Math.sin(mid_angle);
            //                    ctx.fillStyle = '#fff';
            //                    if (i == 3) { // Darker text color for lighter background
            //                        ctx.fillStyle = '#444';
            //                    }
            //                    var val = dataset.data[i];
            //                    var percent = " (" + String(Math.round(val / total * 100)) + "%)";
            //                    if (val != 0) {
            //                        ctx.fillText(dataset.data[i] + percent, model.x + x, model.y + y);
            //                    }
            //                }
            //            });
            //        }
            //    }
            //}
            //var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
            //var charpie = new Chart(pieChartCanvas, {
            //    type: 'pie',
            //    data: donutData,
            //    options: pieOptions
            //})
            //Line Chart
            var DataLineChart = {
                labels: ['06:00', '06:05', '07:00', '08:00', '08:10', '09:00', '10:00', '10:30', '11:00', '12:00', '12:10', '13:00', '14:00', '14:05', '15:00', '16:00', '16:10', '17:00', '18:00', '18:30', '19:00', '20:00', '20:10', '21:00', '22:00', '22:10', '23:00', '00:00', '00:10', '01:00', '02:00', '02:45', '03:00', '04:00', '04:10', '05:00', '06:00'],
                //labels: [],
                datasets: [
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Plan',
                        borderColor: 'rgb(75, 192, 192)',
                        data: [],
                        fill: false,
                        tension: 0, // làm line đỡ mượt
                    },
                    {
                        type: 'line',
                        yAxisID: 'y-axis-1',
                        label: 'Actual',
                        borderColor: '#b38600',
                        data: [],
                        fill: false,
                        tension: 0, // làm line đỡ mượt
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
                        data: []
                    },
                ]
            };
            var LineChartOption =
            {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    //xAxes: [{

                    //    type: 'linear',
                    //}],
                    x: {
                        ticks: {
                            fontSize: 15
                        },
                        type: 'linear', // Sử dụng linear scale cho trục x
                        position: 'bottom',
                    },
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
            // Load Data OK NG
            //function LoadDataForPieChart() {
            //    $.ajax({
            //        type: 'POST',
            //        url: '/MyWebSercive.asmx/DataForPieChart',
            //        contentType: 'application/json; charset=utf-8',
            //        dataType: 'json',
            //        success: function (response) {
            //            var data = JSON.parse(response.d);
            //            donutData.datasets[0].data = data.Datapiechart;
            //            charpie.update();
            //        },
            //        error: function (xhr, status, error) {
            //            alert(error)
            //        }
            //    });
            //}


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

                        var data1 = databarchart.datasets[2].data;
                        var data2 = databarchart.datasets[1].data;
                        var bgr = [];
                        data1.forEach(function (value1, index) {
                            var value2 = data2[index];
                            if (value1 < value2) {
                                bgr.push('red')
                            }
                            else {
                                bgr.push('green')
                            }
                        });
                        databarchart.datasets[2].backgroundColor = bgr;

                        barchartplan.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }
            // Load Data Plan by Model Monitor
            function LoadDataForBarchartMonitor() {
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForBarChartMonitor',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        databarchartmonitor.datasets[0].data = data.dataplan;
                        databarchartmonitor.datasets[1].data = data.dataplanpertime;
                        databarchartmonitor.datasets[2].data = data.dataactual;
                        databarchartmonitor.labels = data.labels;
                        barChartOptionsmonitor.scales.yAxes[0].ticks.max = Math.max(...data.dataplan) + 30;
                        barchartplanmonitor.options = barChartOptionsmonitor;

                        var data1 = databarchartmonitor.datasets[2].data;
                        var data2 = databarchartmonitor.datasets[1].data;
                        var bgr = [];
                        data1.forEach(function (value1, index) {
                            var value2 = data2[index];
                            if (value1 < value2) {
                                bgr.push('red')
                            }
                            else {
                                bgr.push('green')
                            }
                        });
                        databarchartmonitor.datasets[2].backgroundColor = bgr;
                        barchartplanmonitor.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }

            // Load Data Plan by Total
            function LoadDataForLineChart() {
                var selectedModel = document.getElementById('<%= modelplan.ClientID %>').value;
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/DataForLineChart',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ ModelName: selectedModel }),
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        DataLineChart.datasets[0].data = data.dataplan;
                        DataLineChart.datasets[1].data = data.dataactual;
                        DataLineChart.datasets[2].data = data.datadiff;
                        //DataLineChart.labels = data.labels;
                        const absoluteValues = data.datadiff.map(value => Math.abs(value));
                        const maxAbsoluteValue = Math.max(...absoluteValues) + 100;
                        LineChartOption.scales.yAxes[1].ticks.max = maxAbsoluteValue;
                        LineChartOption.scales.yAxes[1].ticks.min = -maxAbsoluteValue;
                        linechart.options = LineChartOption;

                        var plan = data.TotalPlan;
                        var target = DataLineChart.datasets[0].data[DataLineChart.datasets[0].data.length - 1];
                        var actual = DataLineChart.datasets[1].data[DataLineChart.datasets[1].data.length - 1];


                        $('#dataplan').html(`${plan}`);
                        $('#datatarget').html(`${target}`);
                        $('#dataactual').html(`${actual}`);

                        linechart.update();
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
            }



            $('#<%= modelplan.ClientID %>').on('change', function () {
                LoadDataForLineChart();
            });


            setTimeout(LoadDataForBarchart, 1000);
            setTimeout(LoadDataForLineChart, 3000);
            setTimeout(LoadDataForBarchartMonitor, 2000);

            setInterval(LoadDataForLineChart, 2000);
            setInterval(LoadDataForBarchart, 2000);
            setInterval(LoadDataForBarchartMonitor, 2000);
        });




    </script>
</asp:Content>
