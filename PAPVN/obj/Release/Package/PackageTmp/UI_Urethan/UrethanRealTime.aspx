<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UrethanRealTime.aspx.cs" Inherits="PAPVN.UI_Urethan.UrethanRealTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .oee-card {
            text-align: center;
            padding: 10px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            transition: transform 0.3s ease;
        }

            .oee-card:hover {
                transform: scale(1.05);
            }

            .oee-card h1 {
                font-size: 0.5rem;
                margin-bottom: 0px;
                opacity: 0.9;
            }

            .oee-card .value {
                font-size: 2rem;
                font-weight: bold;
            }
    </style>
    <div class="m-2">


        <div class="form-group row mb-0 justify-content-end align-items-center">
            <h1 class="text-right mr-4"
                style=" font-weight: 700; color: #0d47a1; text-transform: uppercase; letter-spacing: 2px; text-shadow: 1px 1px 3px rgba(0,0,0,0.1);">DASHBOARD SẢN LƯỢNG CÔNG ĐOẠN URT
            </h1>
            <div class="input-group date col-1" id="dateselect" data-target-input="nearest"  style="height:39px">
                <input type="text" class="form-control datetimepicker-input" data-target="#dateselect" />
                <div class="input-group-append" data-target="#dateselect" data-toggle="datetimepicker">
                    <div class="input-group-text m-0 p-1 justify-content-center" style="height:38px; width:40px"><i class="fa fa-calendar"></i></div>
                </div>
            </div>
            <select id="cb_shift" class="form-control col-1 mr-2">
                <option value ="" >---Ca---</option>
                <option value="Ca 1">Ca 1</option>
                <option value="Ca 2">Ca 2</option>
                <option value="Ca 3">Ca 3</option>
            </select>
            <select id="cb_model" class="form-control col-1">
                <option value="All Model">---Model---</option>
            </select>

        </div>
        <div class=" row p-0 ml-2 mr-2">

            <div class="oee-card bg-blue col m-2">
                <h3 class="mb-0" style="font-weight: 600">Plan</h3>
                <div class="value" id="plan">0</div>
                <%-- <small>Thời gian hoạt động</small>--%>
            </div>
            <div class="oee-card bg-info col m-2">
                <h3 class="mb-0" style="font-weight: 600">Plan time</h3>
                <div class="value" id="plantime">0</div>
                <%-- <small>Hiệu suất sản xuất</small>--%>
            </div>
            <div class="oee-card bg-success col m-2">
                <h3 class="mb-0" style="font-weight: 600">Actual</h3>
                <div class="value" id="actual">0</div>
                <%-- <small>Chất lượng sản phẩm</small>--%>
            </div>
            <div class="oee-card bg-danger col m-2" id="diff_bag">
                <h3 class="mb-0" style="font-weight: 600; color: white">Diff</h3>
                <div style="color: white" class="value" id="diff">0</div>
                <%-- <small>Hiệu quả tổng thể</small>--%>
            </div>
            <div class="oee-card bg-warning col m-2">
                <h3 class="mb-0" style="font-weight: 600; color: white">Remain</h3>
                <div style="color: white" class="value" id="remain">0</div>
                <%-- <small>Hiệu quả tổng thể</small>--%>
            </div>
        </div>




        <div class="row">



            <div class="card ml-2 mr-2 mb-2 col p-0" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo phút" />
                </h4>
                <div class="chart-container">
                    <canvas id="QuantityPerTimechart" style="min-height: 400px; height: 100%; max-height: 500px"></canvas>
                </div>
            </div>

            <div class="card m-0 mb-2 col p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo giờ" />
                </h4>
                <div class="chart-container">
                    <canvas id="QuantityPerHourchart" style="min-height: 400px; height: 100%; max-height: 500px"></canvas>
                </div>
            </div>

            <%-- <div class="card m-0 mb-2 col-sm-4 p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Model theo dõi đặc biệt" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybymodelmonitor" style="min-height: 250px; height: 100%"></canvas>
                </div>
            </div>--%>
        </div>
        <div class="row">

            <div class="card m-0 mb-2 col p-0 mr-2 ml-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo Model" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybymodel" style="min-height: 400px; height: 100%; max-height: 500px"></canvas>
                </div>
            </div>

            <div class="card m-0 mb-2 col p-0 mr-2" style="background-color: white">
                <h4 class="card-header bg-secondary text-black text-center p-0" style="font-weight: 600">
                    <asp:Literal runat="server" Text="Sản lượng theo nhóm Model" />
                </h4>
                <div class="chart-container">
                    <canvas id="quantitybygroupmodel" style="min-height: 400px; height: 100%; max-height: 500px"></canvas>
                </div>
            </div>

        </div>

    </div>
    <script>


       

        //
        var DataQuantityPerTimechart = {
            labels: [],
            datasets: [
                {
                    type: 'line',
                    yAxisID: 'y-axis-1',
                    label: 'Plan',
                    borderColor: 'rgb(75, 192, 192)',
                    data: [],
                    fill: false,
                    //tension: 0, // làm line đỡ mượt
                    borderWidth: 1,
                    pointRadius: 1, //
                },
                {
                    type: 'line',
                    yAxisID: 'y-axis-1',
                    label: 'Actual',
                    borderColor: '#b38600',
                    data: [],
                    fill: false,
                    //tension: 0, // làm line đỡ mượt
                    borderWidth: 1,
                    pointRadius: 1, //
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
        var QuantityPerTimeChartOption =
        {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                //xAxes: [{
                //    type: 'linear',
                //}],
                x: {
                    ticks: {
                        fontSize: 15,
                        fontColor: 'black',
                        fontStyle: 'bold',
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                },
                {
                    id: 'y-axis-2', // ID của trục y thứ hai
                    type: 'linear',
                    position: 'right', // Vị trí của trục y thứ hai
                    ticks: {
                        fontSize: 15,
                        beginAtZero: true,
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 300, // Đặt giá trị tối đa của trục y là 100
                        // min: -300,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                    gridLines: {
                        display: false
                    },
                }]
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
                },
            },

        };
        var QuantityPerTimechart = $('#QuantityPerTimechart').get(0).getContext('2d')
        var QuantityPerTimechartCanvas = new Chart(QuantityPerTimechart, {
            type: 'line',
            data: DataQuantityPerTimechart,
            options: QuantityPerTimeChartOption
        })
        //
        //
        var QuantityByModelChartCanvas = $('#quantitybymodel').get(0).getContext('2d')
        var dataquantitybymodel = {
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
                    backgroundColor: '#f5e10c',
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
        var QuantityByModelChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            scales: {
                xAxes: [{
                    ticks: {
                        padding: 15
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                }],
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y);
                        });
                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[1].data;
                    var actualData = datasets[2].data;
                    var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }


        }
        var QuantityByModelChart = new Chart(QuantityByModelChartCanvas, {
            type: 'bar',
            data: dataquantitybymodel,
            options: QuantityByModelChartOptions
        })
        //
        //
        //var QuantityByModelMonitorChartCanvas = $('#quantitybymodelmonitor').get(0).getContext('2d')
        //var dataquantitybymodelmonitor = {
        //    labels: [],
        //    datasets: [
        //        {
        //            type: 'bar',
        //            label: 'Plan',
        //            backgroundColor: '#1a53ff',
        //            order: 2,
        //            data: []
        //        },
        //        {
        //            type: 'bar',
        //            label: 'Plan/Time',
        //            backgroundColor: '#f5e10c',
        //            categoryPercentage: 0.6,
        //            order: 1,
        //            data: []
        //        },
        //        {
        //            type: 'bar',
        //            label: 'Actual',
        //            //backgroundColor: '#248f24',
        //            order: 0,
        //            categoryPercentage: 0.35,
        //            data: []
        //        },
        //    ]
        //}
        //var QuantityByModelMonitorChartOptions = {
        //    responsive: true,
        //    maintainAspectRatio: false,
        //    datasetFill: false,
        //    scales: {
        //        xAxes: [{
        //            ticks: {
        //                padding: 15,
        //            },
        //            gridLines: {
        //                display: false
        //            },
        //            stacked: true,
        //        }],
        //        yAxes: [{
        //            ticks: {
        //                fontSize: 15,
        //                beginAtZero: true,
        //                fontColor: 'black',
        //                fontStyle: 'bold',
        //                //max: 3000, // Đặt giá trị tối đa của trục y là 100
        //                //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
        //                //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
        //            },
        //        }],
        //    },
        //    legend: {
        //        position: 'bottom',
        //        labels: {
        //            fontSize: 15,
        //            fontColor: 'black',
        //            fontStyle: 'bold',
        //        },
        //    },
        //    animation: {
        //        duration: 1,
        //        onComplete: function () {
        //            var chartInstance = this.chart,
        //                ctx = chartInstance.ctx;

        //            ctx.font = "500 18px Arial";
        //            ctx.fillStyle = '#000000';
        //            ctx.textAlign = 'center';
        //            ctx.textBaseline = 'bottom';

        //            // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
        //            this.data.datasets.forEach(function (dataset, i) {
        //                var meta = chartInstance.controller.getDatasetMeta(i);
        //                meta.data.forEach(function (bar, index) {
        //                    var data = dataset.data[index];
        //                    ctx.fillText(data, bar._model.x, bar._model.y);
        //                });
        //            });

        //            // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
        //            var datasets = this.data.datasets;

        //            // Giả sử dataset[1] = Plan, dataset[2] = Actual
        //            var planData = datasets[1].data;
        //            var actualData = datasets[2].data;
        //            var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

        //            metaActual.data.forEach(function (bar, index) {
        //                var diff = actualData[index] - planData[index];
        //                var baseY = bar._model.base;
        //                var x = bar._model.x;
        //                var y = baseY + 5; // dịch xuống 15px để không chồng chữ

        //                ctx.fillStyle = diff >= 0 ? 'green' : 'red';
        //                ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
        //                ctx.fillText(diff, x, y);
        //            });
        //        }

        //    }


        //}
        //var QuantityByModelChartMonitor = new Chart(QuantityByModelMonitorChartCanvas, {
        //    type: 'bar',
        //    data: dataquantitybymodelmonitor,
        //    options: QuantityByModelMonitorChartOptions
        //})
        //
        //
        var QuantityByGroupModelChartCanvas = $('#quantitybygroupmodel').get(0).getContext('2d')
        var dataquantitybygroupmodel = {
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
                    backgroundColor: '#f5e10c',
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
        var QuantityByModelGroupChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            scales: {
                xAxes: [{
                    ticks: {
                        padding: 15,
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                }],
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y);
                        });
                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[1].data;
                    var actualData = datasets[2].data;
                    var metaActual = chartInstance.getDatasetMeta(2); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }


        }
        var QuantityByGroupModelChart = new Chart(QuantityByGroupModelChartCanvas, {
            type: 'bar',
            data: dataquantitybygroupmodel,
            options: QuantityByModelGroupChartOptions
        })
        //
        //
        var DataQuantityPerHourchart = {
            labels: [],
            datasets: [

                {
                    type: 'bar',
                    yAxisID: 'y-axis-1',
                    label: 'Plan',
                    backgroundColor: 'Blue',
                    data: [],
                    order: 3,
                },
                {
                    type: 'bar',
                    yAxisID: 'y-axis-1',
                    label: 'Actual',
                    /* backgroundColor: 'orange',*/
                    data: [],


                    order: 4,
                },
                {
                    type: 'line',
                    label: 'Diff',
                    fill: false,
                    borderColor: 'red',
                    backgroundColor: 'transparent',
                    yAxisID: 'y-axis-2',
                    order: 2,
                    tension: 0, // làm line đỡ mượt
                    borderWidth: 2,
                    pointRadius: 2, //
                    data: []
                },
                //{
                //    borderColor: 'orange',
                //    type: 'line',
                //    label: 'DiffAll',
                //    fill: false,
                //    //borderColor: function (context) {
                //    //    var value = context.dataset.data[context.dataIndex];
                //    //    return value < 0 ? 'red' : 'green';
                //    //},
                //    backgroundColor: 'transparent',
                //    yAxisID: 'y-axis-2',
                //    order: 1,
                //    borderWidth: 2,
                //    pointRadius: 2, //
                //    data: []
                //},

            ]
        };
        var QuantityPerHourChartOption =
        {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                //xAxes: [{
                //    type: 'linear',
                //}],
                xAxes: [{
                    ticks: {



                        padding: 15
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
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 3000, // Đặt giá trị tối đa của trục y là 100
                        //min: 0,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                },
                {
                    id: 'y-axis-2', // ID của trục y thứ hai
                    type: 'linear',
                    position: 'right', // Vị trí của trục y thứ hai
                    ticks: {
                        fontSize: 15,
                        beginAtZero: true,
                        fontColor: 'black',
                        fontStyle: 'bold',
                        //max: 300, // Đặt giá trị tối đa của trục y là 100
                        // min: -300,   // (Tùy chọn) Đặt giá trị tối thiểu nếu cần
                        //stepSize: 300 // (Tùy chọn) Đặt khoảng cách giữa các giá trị trên trục y
                    },
                    gridLines: {
                        display: false
                    },
                }]
            },
            legend: {
                position: 'bottom',
                labels: {
                    fontSize: 15,
                    fontColor: 'black',
                    fontStyle: 'bold',
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

                    // 🟦 PHẦN 1: Vẽ giá trị trên đầu mỗi cột
                    this.data.datasets.forEach(function (dataset, i) {
                        if (i < 2) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y);
                            });
                        }


                    });

                    // 🟥 PHẦN 2: Vẽ độ lệch (diff) dưới chân cột
                    var datasets = this.data.datasets;

                    // Giả sử dataset[1] = Plan, dataset[2] = Actual
                    var planData = datasets[0].data;
                    var actualData = datasets[1].data;
                    var metaActual = chartInstance.getDatasetMeta(1); // ⚠️ bạn nên lấy meta của "Actual" (index = 2)

                    metaActual.data.forEach(function (bar, index) {
                        var diff = actualData[index] - planData[index];
                        var baseY = bar._model.base;
                        var x = bar._model.x;
                        var y = baseY + 5; // dịch xuống 15px để không chồng chữ

                        ctx.fillStyle = diff >= 0 ? 'green' : 'red';
                        ctx.textBaseline = 'top'; // 🟩 vẽ dưới chân thì nên để “top”
                        ctx.fillText(diff, x, y);
                    });
                }
            }

        };
        var QuantityPerHourchart = $('#QuantityPerHourchart').get(0).getContext('2d')
        var QuantityPerHourchartCanvas = new Chart(QuantityPerHourchart, {
            type: 'bar',
            data: DataQuantityPerHourchart,
            options: QuantityPerHourChartOption
        })
        //
        function UpdateDashboard(data) {
            $('#plan').html(data.TotalPlan);
            $('#plantime').html(data.TimePlan);
            $('#actual').html(data.Actual);
            $('#diff').html(data.Diff);
            $('#remain').html(data.Remain);

            if (data.Diff > 0) {
                $('#diff_bag').removeClass('bg-danger');
                $('#diff_bag').addClass('bg-success');
            }
            else {
                $('#diff_bag').removeClass('bg-success');
                $('#diff_bag').addClass('bg-danger');
            }

        }
        function UpdateChartQuantityPerTime(data) {
            DataQuantityPerTimechart.datasets[0].data = data.dataplan;
            DataQuantityPerTimechart.datasets[1].data = data.dataactual;
            DataQuantityPerTimechart.datasets[2].data = data.datadiff;
            DataQuantityPerTimechart.labels = data.labels;



            var maxdiff = Math.max(...data.datadiff);

            var mindiff = Math.min(...data.datadiff);

            var maxy1 = 50;
            var miny1 = -150;


            if (maxdiff > 50) {
                maxy1 = maxdiff;
            }
            if (mindiff < -150) {
                miny1 = mindiff;
            }


            QuantityPerTimechartCanvas.options.scales.yAxes[1].ticks.max = maxy1;

            QuantityPerTimechartCanvas.options.scales.yAxes[1].ticks.min = miny1;



            QuantityPerTimechartCanvas.update();
        }
        function UpdateChartQuantityByModel(data) {
            dataquantitybymodel.datasets[0].data = data.dataplan;
            dataquantitybymodel.datasets[1].data = data.dataplanpertime;
            dataquantitybymodel.datasets[2].data = data.dataactual;
            dataquantitybymodel.labels = data.labels;
            var max = Math.max(...data.dataplan);



            QuantityByModelChart.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);
            //barchartplan.options = barChartOptions;
            var data1 = data.dataactual;
            var data2 = data.dataplanpertime;
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
            dataquantitybymodel.datasets[2].backgroundColor = bgr;
            QuantityByModelChart.update();
        }
        //function UpdateChartQuantityByModelMonitor(data) {
        //    dataquantitybymodelmonitor.datasets[0].data = data.dataplan;
        //    dataquantitybymodelmonitor.datasets[1].data = data.dataplanpertime;
        //    dataquantitybymodelmonitor.datasets[2].data = data.dataactual;
        //    dataquantitybymodelmonitor.labels = data.labels;
        //    var max = Math.max(...data.dataplan);



        //    QuantityByModelChartMonitor.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);
        //    //barchartplan.options = barChartOptions;
        //    var data1 = data.dataactual;
        //    var data2 = data.dataplanpertime;
        //    var bgr = [];
        //    data1.forEach(function (value1, index) {
        //        var value2 = data2[index];
        //        if (value1 < value2) {
        //            bgr.push('red')
        //        }
        //        else {
        //            bgr.push('green')
        //        }
        //    });
        //    dataquantitybymodelmonitor.datasets[2].backgroundColor = bgr;
        //    QuantityByModelChartMonitor.update();
        //}
        function UpdateChartQuantityPerHour(data) {
            DataQuantityPerHourchart.datasets[0].data = data.dataplan;
            DataQuantityPerHourchart.datasets[1].data = data.dataactual;
            DataQuantityPerHourchart.datasets[2].data = data.datadiff;
            //DataQuantityPerHourchart.datasets[3].data = data.datadifftotal;

            DataQuantityPerHourchart.labels = data.labels;

            var max = Math.max(...data.dataplan);

            var maxdiff = Math.max(...data.datadiff);

            var mindiff = Math.min(...data.datadiff);

            var maxy1 = 50;
            var miny1 = -150;


            if (maxdiff > 50 ) {
                maxy1 = maxdiff;
            }
            if (miny1 < -150) {
                miny1 = mindiff;
            }

            QuantityPerHourchartCanvas.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);

            QuantityPerHourchartCanvas.options.scales.yAxes[1].ticks.max = maxy1;

            QuantityPerHourchartCanvas.options.scales.yAxes[1].ticks.min = miny1;


            var actualcolor = [];
            data.dataactual.forEach(function (value, index) {
                if (value < data.dataplan[index]) {
                    actualcolor.push('red');
                }
                else {
                    actualcolor.push('green');
                }
            });
            QuantityPerHourchartCanvas.data.datasets[1].backgroundColor = actualcolor;





            QuantityPerHourchartCanvas.update();
        }
        function UpdateChartQuantityByModelGroup(data) {
            dataquantitybygroupmodel.datasets[0].data = data.dataplan;
            dataquantitybygroupmodel.datasets[1].data = data.dataplanpertime;
            dataquantitybygroupmodel.datasets[2].data = data.dataactual;
            dataquantitybygroupmodel.labels = data.labels;

            var max = Math.max(...data.dataplan);
            QuantityByGroupModelChart.options.scales.yAxes[0].ticks.max = max + Math.ceil(max / 4);




            //barchartplan.options = barChartOptions;
            var data1 = data.dataactual;
            var data2 = data.dataplanpertime;
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
            dataquantitybygroupmodel.datasets[2].backgroundColor = bgr;
            QuantityByGroupModelChart.update();
        }
        $(document).ready(function () {


            //Date picker
            $('#dateselect').datetimepicker({
                format: 'YYYY-MM-DD'
            });

            // Kiểm tra SignalR
            if (typeof $.connection === 'undefined') {
                console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                return;
            }
            // Kết nối tới SignalR Hub
            //$.connection.hub.qs = { page: "Urethan" };
            var hub = $.connection.UrethanHub;
            var isUpdating = true;
            var interactionTimeout;
            var isConnected = false;     // <--- thêm biến này
            var initmodel = false;

            // Xử lý khi nhận dữ liệu mới
            hub.client.updateData = function (data) {
                if (!isUpdating) return;

                UpdateDashboard(data.QuantityPerTimechartCanvas);
                UpdateChartQuantityPerTime(data.QuantityPerTimechartCanvas);
                UpdateChartQuantityByModel(data.quantityByModel);
                /* UpdateChartQuantityByModelMonitor(data.quantityByModelMonitor)*/
                UpdateChartQuantityPerHour(data.quantityPerHour);
                UpdateChartQuantityByModelGroup(data.quantityByModelgroup)
                if (!initmodel) {
                    var $select = $("#cb_model");
                    $select.empty(); // xóa các option cũ
                    $select.append($('<option>', {
                        value: 'All Model',
                        text: '--- Model-- -'
                    }));
                    data.quantityByModel.labels.forEach(function (item) {
                        $select.append($('<option>', {
                            value: item,
                            text: item
                        }));
                    });
                    initmodel = true;
                }

            };
            // Bắt đầu kết nối SignalR
            $.connection.hub.start().done(function () {
                console.log("SignalR connected");
                isConnected = true;   // <--- kết nối xong thì cho phép gửi
            }).fail(function (error) {
                console.error("SignalR connection failed: ", error);
            });
            // Khi 1 trong 3 thay đổi -> gửi lên Hub
            $('#dateselect').on('change.datetimepicker', function (e) {
                sendToHub();
            });

            $("#cb_model").change(sendToHub);

            $("#cb_shift").change(sendToHub);

            function sendToHub() {
                if (!isConnected) {
                    console.warn("SignalR chưa sẵn sàng, không gửi filter.");
                    return;
                }
                clearTimeout(interactionTimeout);
                interactionTimeout = setTimeout(function () {
                    var date = $("#dateselect input").val();
                    var model = $("#cb_model").val();
                    var shift = $("#cb_shift").val();

                    hub.server.updateFilter(date, model, shift);
                }, 400);
            }



        });
       

    </script>
</asp:Content>
