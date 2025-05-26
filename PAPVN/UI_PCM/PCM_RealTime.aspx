<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PCM_RealTime.aspx.cs" Inherits="PAPVN.UI_Cutting.CuttingRealTimeMachine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <style>
            /*body { padding: 20px; }*/
            /* .gantt-container { max-width: 1200px; margin: 0 auto; } */
            .legend {
                margin-top: 15px;
            }

                .legend .badge {
                    margin-right: 15px;
                    font-size: 1rem;
                    padding: 8px 12px;
                }

            .error-legend, .oee-legend {
                margin-top: 10px;
            }

            .status-card {
                margin-bottom: 15px;
            }

            .status-running {
                border-color: #4CAF50;
                background-color: rgba(76, 175, 80, 0.1);
            }

                .status-running .status-text {
                    color: #4CAF50;
                }

            .status-error {
                border-color: #F44336;
                background-color: rgba(244, 67, 54, 0.1);
            }

                .status-error .status-text {
                    color: #F44336;
                }

            .status-stopped {
                border-color: #9E9E9E;
                background-color: rgba(158, 158, 158, 0.1);
            }

                .status-stopped .status-text {
                    color: #9E9E9E;
                }

            .card-header {
                font-weight: bold;
            }

            h5 {
                font-weight: 600;
                color: white;
            }
        </style>
        <div class="row ml-1 mr-1">
            <!-- Trạng thái hiện tại -->
            <div class="card shadow m-1 col-2 p-0">
                <div class="card-header p-2 bg-gradient-pink text-center">
                    <h5 class="mb-0">Trạng Thái Máy</h5>
                </div>
                <div class="card-body p-2">

                    <!-- Trạng thái máy -->
                    <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
                        <i class="bi bi-cpu-fill text-primary me-2 fs-5"></i>
                        <strong class="me-2">Trạng thái:</strong>
                        <span id="txt_statusmachine" class="badge bg-success">Chạy</span>
                    </div>

                    <!-- Nguyên nhân dừng -->
                    <div id="stop-reason-container" class="d-flex align-items-start mb-3 pb-3 border-bottom">
                        <i class="bi bi-exclamation-triangle-fill text-danger me-2 fs-5"></i>
                        <div>
                            <strong>Nguyên nhân dừng:</strong>
                            <p id="stop-reason" class="text-danger mb-0 ms-1">Mất điện đột ngột</p>
                        </div>
                    </div>

                    <!-- Tổng số lần dừng -->
                    <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
                        <i class="bi bi-x-circle-fill text-warning me-2 fs-5"></i>
                        <strong class="me-2">Tổng số lần dừng:</strong>
                        <span id="total-stops" class="text-dark fw-semibold">3</span>
                    </div>

                    <!-- Tổng thời gian dừng -->
                    <div class="d-flex align-items-center">
                        <i class="bi bi-clock-history text-info me-2 fs-5"></i>
                        <strong class="me-2">Tổng thời gian dừng:</strong>
                        <span id="total-stop-time" class="text-dark fw-semibold">02:35:00</span>
                    </div>
                </div>
            </div>
            <!-- Biểu đồ Gantt -->
            <div class="card shadow col m-1 p-0">
                <div class="card-header p-2 bg-blue text-center">
                    <h5 class="m-0">Biểu đồ trạng thái máy theo thời gian</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_statusmachine" style="min-height: 200px; height: 100%"></canvas>
                    </div>
                    <div class="legend text-center mt-1">
                        <span class="badge" style="background-color: #4CAF50;">Chạy</span>
                        <span class="badge" style="background-color: #F44336;">Lỗi</span>
                        <span class="badge" style="background-color: #9E9E9E;">Dừng</span>
                    </div>
                </div>
            </div>
            <div class="card shadow col m-1 p-0">
                <div class="card-header p-2 bg-orange text-center">
                    <h5 class="m-0">Biểu đồ thống kê lỗi</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_sumary_error" style="min-height: 200px; height: 100%"></canvas>
                    </div>
                    <%-- <div class="error-legend text-center">
    <span class="badge" style="background-color: #FF5722;">Lỗi 1</span>
    <span class="badge" style="background-color: #2196F3;">Lỗi 2</span>
    <span class="badge" style="background-color: #FFC107;">Lỗi 3</span>
</div>--%>
                </div>
            </div>
        </div>
        <div class="row  ml-1 mr-1">
            <div class="card shadow col-3 mt-0 m-1 p-0">
                <div class="card-header p-2 bg-olive text-center">
                    <h5 class="m-0">Biểu đồ tỉ lệ OK/NG</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_scaleokng" style="min-height: 250px; height: 100%"></canvas>
                    </div>
                </div>
            </div>
            <!-- Biểu đồ lỗi -->
            <div class="card shadow col mt-0 m-1 p-0">
                <div class="card-header p-2 bg-yellow text-center">
                    <h5 class="m-0">Biểu đồ sản lượng theo Model</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_quantitymodel" style="min-height: 250px; height: 100%"></canvas>
                    </div>
                </div>
            </div>

        </div>
        <div class="row  ml-1 mr-1 ">
            <!-- Biểu đồ OEE -->
            <div class="card shadow col mt-0 m-1 p-0">
                <div class="card-header p-2 bg-gradient-indigo text-center">
                    <h5 class="m-0">Biểu đồ sản lượng theo thời gian</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_quantitybytime" style="min-height: 300px; height: 100%"></canvas>
                    </div>
                </div>
            </div>
            <!-- Biểu đồ OEE -->
            <div class="card shadow col-3 mt-0 m-1 p-0">
                <div class="card-header p-2 bg-gradient-gray text-center">
                    <h5 class="m-0">Biểu đồ OEE</h5>
                </div>
                <div class="card-body p-2">
                    <div class="chart-container">
                        <canvas id="chart_oee" style="min-height: 200px; height: 100%"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <script>

            //Biểu đồ trạng thái máy theo thời gian
            // Lưu reference của chart để có thể cập nhật sau
            let ganttChart;
            // Khởi tạo chart ban đầu
            function initGanttChart(machineData) {
                const ganttDatasets = [{
                    data: machineData.map(item => ({
                        x: [new Date(item.start), new Date(item.end)],
                        y: ''
                    })),
                    backgroundColor: machineData.map(item => {
                        return item.status === "Chạy" ? "#4CAF50" :
                            item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                    }),
                    borderColor: machineData.map(item => {
                        return item.status === "Chạy" ? "#4CAF50" :
                            item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                    }),
                    borderWidth: 1
                }];

                const ganttCtx = document.getElementById('chart_statusmachine').getContext('2d');
                ganttChart = new Chart(ganttCtx, {
                    type: 'bar',
                    data: { datasets: ganttDatasets },
                    options: {
                        indexAxis: 'y',
                        categoryPercentage: 0.3,
                        barPercentage: 0.5,
                        scales: {
                            x: {
                                type: 'time',
                                time: { unit: 'hour', displayFormats: { hour: 'HH:mm' } },
                                title: { display: false, text: 'Thời gian', font: { size: 14 }, color: 'black' },
                                ticks: { color: 'black', font: { size: 12 } },
                                min: '2025-05-03 08:00:00',
                                max: '2025-05-03 24:00:00'
                            },
                            y: {
                                ticks: { color: 'black', font: { size: 12 } },
                                title: { display: false, text: 'Máy', font: { size: 14 }, color: 'black' }
                            }
                        },
                        plugins: {
                            legend: { display: false },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        const data = context.raw;
                                        const start = new Date(data.x[0]).toLocaleTimeString('vi-VN');
                                        const end = new Date(data.x[1]).toLocaleTimeString('vi-VN');
                                        return `${start} - ${end}`;
                                    }
                                }
                            }
                        },
                        maintainAspectRatio: false
                    }
                });
            }
            function updateGanttChart(newMachineData) {
                if (!ganttChart) return;

                // Cập nhật data
                ganttChart.data.datasets[0].data = newMachineData.map(item => ({
                    x: [new Date(item.start), new Date(item.end)],
                    y: ''
                }));

                // Cập nhật màu sắc
                ganttChart.data.datasets[0].backgroundColor = newMachineData.map(item => {
                    return item.status === "Chạy" ? "#4CAF50" :
                        item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                });

                ganttChart.data.datasets[0].borderColor = newMachineData.map(item => {
                    return item.status === "Chạy" ? "#4CAF50" :
                        item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                });

                // Render lại chart
                ganttChart.update();
            }






            function generateMachineData(machineName, date = '2025-05-03') {
                const states = ['Chạy', 'Dừng', 'Lỗi'];
                const weights = { 'Chạy': 0.7, 'Dừng': 0.15, 'Lỗi': 0.15 }; // Chạy chiếm đa số
                const getRandomState = () => {
                    const r = Math.random();
                    if (r < weights['Chạy']) return 'Chạy';
                    if (r < weights['Chạy'] + weights['Dừng']) return 'Dừng';
                    return 'Lỗi';
                };
                const result = [];
                let currentTime = new Date(`${date}T00:00:00`);
                const endTime = new Date(`${date}T23:59:59`);
                while (currentTime < endTime) {
                    const status = getRandomState();
                    const duration = Math.floor(Math.random() * 60) + 30; // từ 30 đến 90 phút
                    const start = new Date(currentTime);
                    const end = new Date(start.getTime() + duration * 60000);
                    if (end > endTime) end.setTime(endTime.getTime());
                    result.push({
                        machine: machineName,
                        status: status,
                        start: start.toISOString(),
                        end: end.toISOString()
                    });
                    currentTime = new Date(end.getTime());
                }
                return result;
            }
            $(document).ready(function () {

                // Kiểm tra SignalR
                if (typeof $.connection === 'undefined') {
                    console.error("SignalR not loaded. Check jQuery and signalr/hubs scripts.");
                    return;
                }
                // Kết nối tới SignalR Hub
                var proxy = $.connection.PCMHub;
                var isUpdating = true;
                var interactionTimeout;

                // Xử lý khi nhận dữ liệu mới
                proxy.client.UpdateData = function (data) {
                    if (!isUpdating) return;

                    debugger; 

                   


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
                /*$('#dataTable').on('mousemove click', handleMouseInteraction);*/

                // Bắt đầu kết nối SignalR
                $.connection.hub.start().done(function () {
                    console.log("SignalR connected");
                    proxy.server.getInitialData();
                }).fail(function (error) {
                    console.error("SignalR connection failed: ", error);
                });

               


               


                //
                // Dữ liệu Gantt
                const machineData = [
                    ...generateMachineData("Máy 1"),
                    /* ...generateMachineData("Máy 2")*/
                ];
                // Dữ liệu lỗi
                const errorData = [
                    { machine: "Máy 1", errorType: "Lỗi 1", count: 3 },
                    { machine: "Máy 1", errorType: "Lỗi 2", count: 2 },
                    { machine: "Máy 1", errorType: "Lỗi 3", count: 1 },
                ];
                // Dữ liệu OEE
                const oeeData = [
                    { machine: "Máy 1", oee: 85 },
                    /* { machine: "Máy 2", oee: 70 }*/
                ];
               
                // Nhóm dữ liệu
                const machines = [...new Set(machineData.map(item => item.machine))];
                const errorTypes = [...new Set(errorData.map(item => item.errorType))];
                
                const ganttDatasets = [{
                    //label: 'Máy 1',
                    data: machineData.map(item => ({
                        x: [new Date(item.start), new Date(item.end)],
                        y: '' // Tất cả đều có cùng 1 tên để hiển thị trên 1 dòng
                    })),
                    backgroundColor: machineData.map(item => {
                        return item.status === "Chạy" ? "#4CAF50" :
                            item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                    }),
                    borderColor: machineData.map(item => {
                        return item.status === "Chạy" ? "#4CAF50" :
                            item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                    }),
                    borderWidth: 1
                }];
                const ganttCtx = document.getElementById('chart_statusmachine').getContext('2d');
                new Chart(ganttCtx, {
                    type: 'bar',
                    data: { datasets: ganttDatasets },
                    options: {
                        indexAxis: 'y',
                        // Cách 1: Sử dụng barThickness để đặt độ dày cố định (pixel)
                        // barThickness: 20, // Độ dày cố định 20px cho mỗi thanh
                        // Điều chỉnh để hiển thị trên 1 dòng
                        categoryPercentage: 0.3, // Sử dụng toàn bộ không gian category
                        barPercentage: 0.5,      // Các thanh chiếm 80% không gian
                        // Cách 3: Sử dụng maxBarThickness để giới hạn độ dày tối đa
                        // maxBarThickness: 50, // Độ dày tối đa 50px
                        // Cách 4: Sử dụng minBarLength để đặt độ dài tối thiểu
                        // minBarLength: 10, // Độ dài tối thiểu 10px
                        scales: {
                            x: {
                                type: 'time',
                                time: { unit: 'hour', displayFormats: { hour: 'HH:mm' } },
                                title: {
                                    /*display: true, text: 'Thời gian', font: { size: 14 }, color: 'black' // màu chữ cho tiêu đề trục X*/
                                    display: false, text: 'Thời gian', font: { size: 14 }, color: 'black' // màu chữ cho tiêu đề trục X
                                },
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                                min: '2025-05-03 08:00:00',
                                max: '2025-05-03 24:00:00'
                            },
                            y: {
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                                /* title: { display: true, text: 'Máy', font: { size: 14 }, color: 'black' }*/
                                title: { display: false, text: 'Máy', font: { size: 14 }, color: 'black' }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false, labels: {
                                    color: 'black', // nếu có legend, đổi màu chữ
                                    font: { size: 12 }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        const data = context.raw;
                                        const start = new Date(data.x[0]).toLocaleTimeString('vi-VN');
                                        const end = new Date(data.x[1]).toLocaleTimeString('vi-VN');
                                        return `${context.dataset.label}: ${start} - ${end}`;
                                    }
                                },
                                //titleFont: { size: 14 },
                                //bodyFont: { size: 12 },
                                //titleColor: 'black',
                                //bodyColor: 'black'
                            }
                        },
                        maintainAspectRatio: false
                    }
                });
                // --- Vẽ biểu đồ lỗi ---
                const errorDatasets = errorTypes.map(type => {
                    const color = type === "Lỗi 1" ? "#FF5722" : type === "Lỗi 2" ? "#2196F3" : "#FFC107";
                    return {
                        label: type,
                        data: machines.map(machine => {
                            const error = errorData.find(e => e.machine === machine && e.errorType === type);
                            return error ? error.count : 0;
                        }),
                        backgroundColor: color,
                        borderColor: color,
                        borderWidth: 1
                    };
                });
                const errorCtx = document.getElementById('chart_sumary_error').getContext('2d');
                new Chart(errorCtx, {
                    type: 'bar',
                    data: {
                        labels: machines,
                        datasets: errorDatasets
                    },
                    options: {
                        scales: {
                            x: {
                                title: { display: false, text: 'Máy', font: { size: 14 } },
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                            },
                            y: {
                                title: { display: false, text: 'Số lần lỗi', font: { size: 14 } },
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            legend: { display: false },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return `${context.dataset.label}: ${context.raw} lần`;
                                    }
                                }
                            }
                        },
                        maintainAspectRatio: false,
                        barPercentage: 0.3,
                        categoryPercentage: 0.9
                    }
                });
                // --- Vẽ biểu đồ OEE ---
                const oeeDatasets = [{
                    label: 'OEE',
                    data: machines.map(machine => {
                        const oee = oeeData.find(o => o.machine === machine);
                        return oee ? oee.oee : 0;
                    }),
                    backgroundColor: '#2196F3',
                    borderColor: '#2196F3',
                    borderWidth: 1
                }];
                const oeeCtx = document.getElementById('oeeChart').getContext('2d');
                new Chart(oeeCtx, {
                    type: 'bar',
                    data: {
                        labels: machines,
                        datasets: oeeDatasets
                    },
                    options: {
                        scales: {
                            x: {
                                title: { display: false, text: 'Máy', font: { size: 14 } },
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                            },
                            y: {
                                title: { display: false, text: 'OEE (%)', font: { size: 14 } },
                                ticks: {
                                    color: 'black',  // màu chữ cho các mốc trục X
                                    font: { size: 12 } // kích thước chữ
                                },
                                beginAtZero: true,
                                max: 100
                            }
                        },
                        plugins: {
                            legend: { display: false },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return `${context.label}: ${context.raw}% OEE`;
                                    }
                                }
                            }
                        },
                        maintainAspectRatio: false,
                        barPercentage: 0.4
                    }
                });
            });
        </script>
</asp:Content>
