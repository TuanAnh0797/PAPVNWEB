<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgingRealTime.aspx.cs" Inherits="PAPVN.UrtFormHis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/chart.js/Chart.min.js"></script>--%>
    <style>
        .row-ok {
            background-color: #009900 !important; /* xanh nhạt */
            color: black;
            font-weight: bold;
        }

        .row-ng {
            background-color: #ff471a !important; /* đỏ nhạt */
            color: black;
            font-weight: bold;
        }

        .row-pending {
            background-color: yellow !important; /* vàng nhạt */
            color: black;
            font-weight: bold;
        }

        .cell-border {
            border: 1px solid #ccc;
            padding: 0px; /* Tùy bạn */
        }
    </style>


    <div class="content" style="margin: 0px 0px 0px 0px;">
        <h1 id="title_bg" class="bg-gray text-center p-0 m-0" style="font-weight: 600">Đang kiểm tra: <span id="rs_codeback">NR-ABCASDALSJDNCNKJS</span></h1>
        <div class="row ml-0 mr-0 bg-primary" style="font-size: 18px; font-weight: 600">
            <div class="col-sm-1 text-center cell-border ">VP</div>
            <div class="col-sm-1 text-center cell-border ">GAS</div>
            <div class="col-sm-1 text-center cell-border ">WI1 W</div>
            <div class="col-sm-1 text-center cell-border ">WI1 S</div>
            <div class="col-sm-1 text-center cell-border ">IP</div>
            <div class="col-sm-1 text-center cell-border ">DF</div>
            <div class="col-sm-1 text-center cell-border ">TEMP</div>
            <div class="col-sm-1 text-center cell-border ">IOT</div>
            <div class="col-sm-1 text-center cell-border ">WI2</div>
            <div class="col-sm-1 text-center cell-border ">PAN</div>
            <div class="col-sm-1 text-center cell-border ">CAM B</div>
            <div class="col-sm-1 text-center cell-border ">CAM F</div>
        </div>
        <div class="row pl-2 pr-2" style="font-size: 18px; font-weight: 600">
            <div id="rs_vp" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_gas" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_wi1w" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_wi1s" class="col-sm-1 text-center cell-border bg-gray-lights">NA</div>
            <div id="rs_ip" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_df" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_temp" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_iot" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_wi2" class="col-sm-1 text-center cell-border bg-gray-lights">NA</div>
            <div id="rs_pan" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_camb" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
            <div id="rs_camf" class="col-sm-1 text-center cell-border bg-gray-light">NA</div>
        </div>




        <div class="row">
            <div class="col-sm-3 " style="padding: 5px">

                <div class="card" style="background-color: white">

                    <h4 class="card-header bg-info  text-white p-0" style="color: white; background-color: #eb940a; text-align: center; font-weight: bold">Lịch sử 50 tủ gần nhất</h4>
                    <div class="card-body p-1">
                        <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
                            <thead style="background-color: #b2bac2; color: black">
                                <tr class="p-1">
                                    <th>Code Back</th>
                                    <th style="width: 50px">Judge</th>
                                    <th>Time Update</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody" class="p-0" style="font-size: 14px">
                            </tbody>
                        </table>

                    </div>


                </div>
            </div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="chart col-sm-4" style="padding: 5px; height: 285px">
                        <div class="card">
                            <h4 class="card-header bg-info text-white text-center p-0" style="font-weight: 600">Biểu đồ tỉ lệ OK/NG</h4>
                            <div class="chart-container">
                                <canvas id="pieChart" style="min-height: 250px; height: 100%"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class=" chart col" style="padding: 5px; height: 285px">
                        <div class="card" style="background-color: white">

                            <h4 class="card-header bg-info text-black text-center p-0" style="font-weight: 600">Biểu đồ số lượng tủ OK/NG/PENDING</h4>

                            <div class="chart-container">
                                <canvas id="stackedBarChart" style="min-height: 250px; height: 100%"></canvas>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="row">
                    <div class="chart col" style="padding: 5px; height: 245px">
                        <div class="card" style="background-color: white">

                            <h4 class="card-header bg-danger text-black text-center p-0" style="font-weight: 600">Biểu đồ số lượng tủ PENDING</h4>

                            <div class="chart-container">
                                <canvas id="barChartpending" style="min-height: 200px; height: 100%"></canvas>
                            </div>
                        </div>


                    </div>
                    <div class="chart col" style="padding: 5px; height: 245px">
                        <div class="card" style="background-color: white">

                            <h4 class="card-header bg-danger text-black text-center p-0" style="font-weight: 600">Biểu đồ số lượng tủ NG</h4>

                            <div class="chart-container">
                                <canvas id="barChartng" style="min-height: 200px; height: 100%"></canvas>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="card" style="background-color: white;">

                    <h4 class="card-header bg-success text-white text-center p-0" style="color: white; background-color: #6C757D; font-weight: 600">Biểu đồ sản lượng theo thời gian</h4>

                    <div class="row ml-3">
                        <div class=" col">
                            <h3 style="color: blue; font-weight: bold">Plan: <span id="dataplan"></span></h3>
                        </div>
                        <div class="col">
                            <h3 style="color: #cc9900; font-weight: bold">Target: <span id="datatarget"></span></h3>
                        </div>
                        <div class=" col">
                            <h3 style="color: slateblue; font-weight: bold">Actual: <span id="dataactual"></span></h3>
                        </div>
                        <div class=" col">
                            <h3 style="color: green; font-weight: bold">Diff: <span id="datadiff"></span></h3>
                        </div>
                    </div>
                    <div class="chart-container">
                        <canvas id="linechart" style="min-height: 300px;"></canvas>
                    </div>
                </div>
            </div>



        </div>

    </div>
    <script>

        $(document).ready(function () {
            // Khởi tạo DataTable
            var table = $('#dataTable').DataTable({
                pageLength: 15,
                lengthMenu: [15, 20, 30, 40, 50],
                lengthChange: true,
                paging: true,
                searching: false,
                ordering: false, // Tắt sắp xếp tự động để giữ thứ tự từ server
                info: false
            });
            // Kiểm tra SignalR
            if (typeof $.connection === 'undefined') {
                console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                return;
            }
            // Kết nối tới SignalR Hub
            var proxy = $.connection.chatHub;
            var isUpdating = true;
            var interactionTimeout;
            // Xử lý khi nhận dữ liệu mới
            proxy.client.updateTable = function (data) {
                if (!isUpdating) return;


                var data1 = JSON.parse(data.DatabarchartOKNGPENDING);
                donutData.datasets[0].data = data1.Datapiechart;

                dattachartOKNGPending.datasets[0].data = data1.dataok;
                dattachartOKNGPending.datasets[1].data = data1.datang;
                dattachartOKNGPending.datasets[2].data = data1.datapending;
                datachartPending.datasets[0].data = data1.datapending;
                datachartNG.datasets[0].data = data1.datang;

                charpie.update();
                barchartpending.update();
                barcharng.update();
                stackchart.update();
                var data2 = JSON.parse(data.DataLineChartQuantityPerTime);

                DataLineChart.datasets[0].data = data2.dataplan;
                DataLineChart.datasets[1].data = data2.dataactual;
                DataLineChart.datasets[2].data = data2.datadiff;
                var shift = data2.shift;
                var typeplan = data2.typeplan;


                var datacurrent = data.CurrentData;
                $('#rs_codeback').html(`${datacurrent.CodeBack}`);
                $('#rs_vp').html(`${datacurrent.CodeBack}`);
                $('#rs_gas').html(`${datacurrent.CodeBack}`);
                $('#rs_wi1w').html(`${datacurrent.CodeBack}`);
                $('#rs_wi1s').html(`${datacurrent.CodeBack}`);
                $('#rs_ip').html(`${datacurrent.CodeBack}`);
                $('#rs_df').html(`${datacurrent.CodeBack}`);
                $('#rs_temp').html(`${datacurrent.CodeBack}`);
                $('#rs_iot').html(`${datacurrent.CodeBack}`);
                $('#rs_wi2').html(`${datacurrent.CodeBack}`);
                $('#rs_pan').html(`${datacurrent.CodeBack}`);
                $('#rs_camb').html(`${datacurrent.CodeBack}`);
                $('#rs_camf').html(`${datacurrent.CodeBack}`);



                if (typeplan == '2_10') {


                    DataLineChart.labels = ['12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00'];

                }
                else if (typeplan == '2_12') {

                    DataLineChart.labels = ['10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00', '8:05', '8:10', '8:15', '8:20', '8:25', '8:30', '8:35', '8:40', '8:45', '8:50', '8:55', '9:00', '9:05', '9:10', '9:15', '9:20', '9:25', '9:30', '9:35', '9:40', '9:45', '9:50', '9:55', '10:00'];


                }
                else if (typeplan == '2_12_6') {

                    DataLineChart.labels = ['6:00', '6:05', '6:10', '6:15', '6:20', '6:25', '6:30', '6:35', '6:40', '6:45', '6:50', '6:55', '7:00', '7:05', '7:10', '7:15', '7:20', '7:25', '7:30', '7:35', '7:40', '7:45', '7:50', '7:55', '8:00', '8:05', '8:10', '8:15', '8:20', '8:25', '8:30', '8:35', '8:40', '8:45', '8:50', '8:55', '9:00', '9:05', '9:10', '9:15', '9:20', '9:25', '9:30', '9:35', '9:40', '9:45', '9:50', '9:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '0:00', '0:05', '0:10', '0:15', '0:20', '0:25', '0:30', '0:35', '0:40', '0:45', '0:50', '0:55', '1:00', '1:05', '1:10', '1:15', '1:20', '1:25', '1:30', '1:35', '1:40', '1:45', '1:50', '1:55', '2:00', '2:05', '2:10', '2:15', '2:20', '2:25', '2:30', '2:35', '2:40', '2:45', '2:50', '2:55', '3:00', '3:05', '3:10', '3:15', '3:20', '3:25', '3:30', '3:35', '3:40', '3:45', '3:50', '3:55', '4:00', '4:05', '4:10', '4:15', '4:20', '4:25', '4:30', '4:35', '4:40', '4:45', '4:50', '4:55', '5:00', '5:05', '5:10', '5:15', '5:20', '5:25', '5:30', '5:35', '5:40', '5:45', '5:50', '5:55', '6:00'];


                }
                else {

                    DataLineChart.labels = ['06:00', '06:05', '06:10', '06:15', '06:20', '06:25', '06:30', '06:35', '06:40', '06:45', '06:50', '06:55', '07:00', '07:05', '07:10', '07:15', '07:20', '07:25', '07:30', '07:35', '07:40', '07:45', '07:50', '07:55', '08:00', '08:05', '08:10', '08:15', '08:20', '08:25', '08:30', '08:35', '08:40', '08:45', '08:50', '08:55', '09:00', '09:05', '09:10', '09:15', '09:20', '09:25', '09:30', '09:35', '09:40', '09:45', '09:50', '09:55', '10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30', '10:35', '10:40', '10:45', '10:50', '10:55', '11:00', '11:05', '11:10', '11:15', '11:20', '11:25', '11:30', '11:35', '11:40', '11:45', '11:50', '11:55', '12:00', '12:05', '12:10', '12:15', '12:20', '12:25', '12:30', '12:35', '12:40', '12:45', '12:50', '12:55', '13:00', '13:05', '13:10', '13:15', '13:20', '13:25', '13:30', '13:35', '13:40', '13:45', '13:50', '13:55', '14:00', '14:05', '14:10', '14:15', '14:20', '14:25', '14:30', '14:35', '14:40', '14:45', '14:50', '14:55', '15:00', '15:05', '15:10', '15:15', '15:20', '15:25', '15:30', '15:35', '15:40', '15:45', '15:50', '15:55', '16:00', '16:05', '16:10', '16:15', '16:20', '16:25', '16:30', '16:35', '16:40', '16:45', '16:50', '16:55', '17:00', '17:05', '17:10', '17:15', '17:20', '17:25', '17:30', '17:35', '17:40', '17:45', '17:50', '17:55', '18:00', '18:05', '18:10', '18:15', '18:20', '18:25', '18:30', '18:35', '18:40', '18:45', '18:50', '18:55', '19:00', '19:05', '19:10', '19:15', '19:20', '19:25', '19:30', '19:35', '19:40', '19:45', '19:50', '19:55', '20:00', '20:05', '20:10', '20:15', '20:20', '20:25', '20:30', '20:35', '20:40', '20:45', '20:50', '20:55', '21:00', '21:05', '21:10', '21:15', '21:20', '21:25', '21:30', '21:35', '21:40', '21:45', '21:50', '21:55', '22:00', '22:05', '22:10', '22:15', '22:20', '22:25', '22:30', '22:35', '22:40', '22:45', '22:50', '22:55', '23:00', '23:05', '23:10', '23:15', '23:20', '23:25', '23:30', '23:35', '23:40', '23:45', '23:50', '23:55', '00:00', '00:05', '00:10', '00:15', '00:20', '00:25', '00:30', '00:35', '00:40', '00:45', '00:50', '00:55', '01:00', '01:05', '01:10', '01:15', '01:20', '01:25', '01:30', '01:35', '01:40', '01:45', '01:50', '01:55', '02:00', '02:05', '02:10', '02:15', '02:20', '02:25', '02:30', '02:35', '02:40', '02:45', '02:50', '02:55', '03:00', '03:05', '03:10', '03:15', '03:20', '03:25', '03:30', '03:35', '03:40', '03:45', '03:50', '03:55', '04:00', '04:05', '04:10', '04:15', '04:20', '04:25', '04:30', '04:35', '04:40', '04:45', '04:50', '04:55', '05:00', '05:05', '05:10', '05:15', '05:20', '05:25', '05:30', '05:35', '05:40', '05:45', '05:50', '05:55', '06:00'];

                }

                var plan = data2.TotalPlan;
                /*var target = DataLineChart.datasets[0].data[DataLineChart.datasets[0].data.length - 1];*/
                var target = Math.max(...DataLineChart.datasets[0].data);
                var actual = DataLineChart.datasets[1].data[DataLineChart.datasets[1].data.length - 1];
                $('#dataplan').html(`${plan}`);
                $('#datatarget').html(`${target}`);
                $('#dataactual').html(`${actual}`);
                linechart.update();


                table.clear();
                $.each(data.Datahistory, function (index, item) {
                    let rowClass = '';

                    if (item.Judge === 'OK') {
                        rowClass = 'row-ok';
                    } else if (item.Judge === 'NG') {
                        rowClass = 'row-ng';
                    } else {
                        rowClass = 'row-pending';
                    }
                    // Thêm dòng với class
                    table.row.add([
                        item.CodeBack,
                        item.Judge,
                        item.TimeUpdate
                    ]).node().className = rowClass;
                });

                table.draw(false);
            };
            // Hàm xử lý tương tác chuột
            function handleMouseInteraction() {
                isUpdating = false;
                clearTimeout(interactionTimeout);

                interactionTimeout = setTimeout(function () {
                    isUpdating = true;
                    proxy.server.getInitialData();
                }, 5000);
            }
            // Gắn sự kiện chuột trên table
            $('#dataTable').on('mousemove click', handleMouseInteraction);

            // Bắt đầu kết nối SignalR
            $.connection.hub.start().done(function () {
                console.log("SignalR connected");
                proxy.server.getInitialData();
            }).fail(function (error) {
                console.error("SignalR connection failed: ", error);
            });
        });
        //Pie chart
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
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
                            //var percent = " (" + String(Math.round(val / total * 100)) + "%)";
                            var percent = String(Math.round(val / total * 100)) + "%";
                            if (val != 0) {
                                //ctx.fillText(dataset.data[i] + percent, model.x + x, model.y + y);

                                ctx.fillText(percent, model.x + x, model.y + y);
                            }
                        }
                    });
                }
            },
            legend: {
                labels: {
                    fontColor: 'black',     // 👈 Màu chữ
                    fontSize: 20,           // 👈 Cỡ chữ
                    fontStyle: 'bold',      // 👈 Độ đậm

                },
                display: true,
                position: 'right'
            },
        }
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
        var charpie = new Chart(pieChartCanvas, {
            type: 'pie',
            data: donutData,
            options: pieOptions
        })




        // Stackbarchar OK NG PEnding
        var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
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
                    data: []
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
                    data: []
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
                    data: []
                },
            ]
        }
        var stackedBarChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                xAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 15, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }],
                yAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 15, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }]
            },
            legend: {
                labels: {
                    fontColor: 'black',     // 👈 Màu chữ
                    fontSize: 15,           // 👈 Cỡ chữ
                    fontStyle: 'bold',      // 👈 Độ đậm

                }
            },

        }
        var stackchart = new Chart(stackedBarChartCanvas, {
            type: 'bar',
            data: dattachartOKNGPending,
            options: stackedBarChartOptions
        })
        //Barchar Pending
        var barChartCanvas = $('#barChartpending').get(0).getContext('2d')
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
                    data: []
                },

            ]

        }
        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            animation: {
                duration: 1,
                onComplete: function () {

                    var chartInstance = this.chart,
                        ctx = chartInstance.ctx;
                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';
                    ctx.font = 'bold 13px Arial';
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            },
            scales: {
                xAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 13, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }],
                yAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 13, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }]
            },
            legend: {
                labels: {
                    fontColor: 'black',     // 👈 Màu chữ
                    fontSize: 13,           // 👈 Cỡ chữ
                    fontStyle: 'bold',      // 👈 Độ đậm

                },
                display: false
            },

        }
        var barchartpending = new Chart(barChartCanvas, {
            type: 'bar',
            data: datachartPending,
            options: barChartOptions
        })
        // Barchart NG
        var barChartCanvas = $('#barChartng').get(0).getContext('2d')
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
                    data: []
                },

            ]

        }
        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,
            animation: {
                duration: 1,
                onComplete: function () {



                    var chartInstance = this.chart,
                        ctx = chartInstance.ctx;
                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';
                    ctx.font = 'bold 13px Arial';
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            },
            scales: {
                xAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 13, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }],
                yAxes: [{
                    stacked: true,
                    ticks: {
                        fontSize: 13, // Tăng cỡ chữ tại đây,
                        fontStyle: 'bold',
                        fontColor: 'black'

                    }
                }]
            },
            legend: {
                labels: {
                    fontColor: 'black',     // 👈 Màu chữ
                    fontSize: 13,           // 👈 Cỡ chữ
                    fontStyle: 'bold',      // 👈 Độ đậm

                },
                display: false
            },
        }

        var barcharng = new Chart(barChartCanvas, {
            type: 'bar',
            data: datachartNG,
            options: barChartOptions
        })
        // quantitypertime
        var DataLineChart = {
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
                    borderWidth: 2,
                    pointRadius: 2, //
                },
                {
                    type: 'line',
                    yAxisID: 'y-axis-1',
                    label: 'Actual',
                    borderColor: '#b38600',
                    data: [],
                    fill: false,
                    //tension: 0, // làm line đỡ mượt
                    borderWidth: 2,
                    pointRadius: 2, //
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
                        //max: maxYAxisValuebarchartdiff,
                        //min: -maxYAxisValuebarchartdiff,
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
        var lineChartCanvas = $('#linechart').get(0).getContext('2d')
        var linechart = new Chart(lineChartCanvas, {
            type: 'line',
            data: DataLineChart,
            options: LineChartOption
        })

    </script>

</asp:Content>
