<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CuttingRealTimeMachine.aspx.cs" Inherits="PAPVN.UI_Cutting.CuttingRealTimeMachine" %>

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

            canvas {
                max-height: 400px;
                min-height: 300px;
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
        </style>



        <!-- <h2 class="text-center mb-4">Biểu đồ trạng thái, lỗi, OEE và trạng thái hiện tại máy</h2> -->

        <!-- Trạng thái hiện tại -->
        <div class="card shadow-sm mb-2">
            <div class="card-body p-2">
                <%--  <h5 class="card-title">Trạng thái hiện tại của máy</h5>--%>
                <div class="row" id="statusContainer"></div>
            </div>
        </div>

        <!-- Biểu đồ Gantt -->
        <div class="card shadow-sm mb-1">
            <div class="card-body p-2">
                <div class="text-center">
                    <h5 class="m-0" style="font-weight: 600">Biểu đồ trạng thái máy theo thời gian</h5>
                </div>
                <canvas id="ganttChart" style="max-height: 350px"></canvas>
                <div class="legend text-center mt-1">
                    <span class="badge" style="background-color: #4CAF50;">Chạy</span>
                    <span class="badge" style="background-color: #F44336;">Lỗi</span>
                    <span class="badge" style="background-color: #9E9E9E;">Dừng</span>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Biểu đồ lỗi -->
            <div class="card shadow-sm col-sm-8 m-2 mt-0">
                <div class="card-body p-2">
                    <div class="text-center">
                        <h5 class="m-0" style="font-weight: 600">Biểu đồ lỗi trên từng máy</h5>
                    </div>
                    <canvas id="errorChart" style="max-height: 300px"></canvas>
                    <div class="error-legend text-center">
                        <span class="badge" style="background-color: #FF5722;">Lỗi 1</span>
                        <span class="badge" style="background-color: #2196F3;">Lỗi 2</span>
                        <span class="badge" style="background-color: #FFC107;">Lỗi 3</span>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ OEE -->
            <div class="card shadow-sm col m-2 mt-0">
                <div class="card-body p-2">
                    <div class="text-center">
                        <h5 class="m-0" style="font-weight: 600">Biểu đồ OEE của từng máy</h5>
                    </div>
                    <canvas id="oeeChart" style="max-height: 300px"></canvas>
                    <div class="oee-legend text-center">
                        <span class="badge" style="background-color: #2196F3;">OEE (%)</span>
                    </div>
                </div>
            </div>
        </div>


    </div>


    <script>




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
            // Dữ liệu Gantt
            const machineData = [
                ...generateMachineData("Máy 1"),
                ...generateMachineData("Máy 2")
            ];
            // Dữ liệu lỗi
            const errorData = [
                { machine: "Máy 1", errorType: "Lỗi 1", count: 3 },
                { machine: "Máy 1", errorType: "Lỗi 2", count: 2 },
                { machine: "Máy 1", errorType: "Lỗi 3", count: 1 },
                { machine: "Máy 2", errorType: "Lỗi 1", count: 1 },
                { machine: "Máy 2", errorType: "Lỗi 2", count: 4 },
                { machine: "Máy 2", errorType: "Lỗi 3", count: 2 }
            ];

            // Dữ liệu OEE
            const oeeData = [
                { machine: "Máy 1", oee: 85 },
                { machine: "Máy 2", oee: 70 }
            ];

            // Dữ liệu trạng thái hiện tại
            const currentStatusData = [
                { machine: "Máy 1", status: "Chạy" },
                { machine: "Máy 2", status: "Lỗi", errorType: "Lỗi phần mềm", fix: "Khởi động lại phần mềm" }
            ];

            // Nhóm dữ liệu
            const machines = [...new Set(machineData.map(item => item.machine))];
            const errorTypes = [...new Set(errorData.map(item => item.errorType))];

            // --- Hiển thị trạng thái hiện tại ---
            const statusContainer = $('#statusContainer');
            currentStatusData.forEach(status => {
                const statusClass = status.status === "Chạy" ? "status-running" :
                    status.status === "Lỗi" ? "status-error" : "status-stopped";
                const errorType = status.status === "Lỗi" ? status.errorType : "-";
                const fix = status.status === "Lỗi" ? status.fix : "-";
                statusContainer.append(`
                    <div class="col-md-6 status-card mb-0">
                        <div class="card ${statusClass} shadow-sm">
                            <div class="card-header p-2">${status.machine}</div>
                            <div class="card-body p-2">
                                <p class="mb-1"><strong>Trạng thái:</strong> <span class="status-text">${status.status}</span></p>
                                <p class="mb-1"><strong>Loại lỗi:</strong> ${errorType}</p>
                                <p class="mb-1"><strong>Cách sửa:</strong> ${fix}</p>
                            </div>
                        </div>
                    </div>
                `);
            });

            // --- Vẽ biểu đồ Gantt ---
            const ganttDatasets = machineData.map(item => {
                const color = item.status === "Chạy" ? "#4CAF50" : item.status === "Lỗi" ? "#F44336" : "#9E9E9E";
                return {
                    label: `${item.machine} (${item.status})`,
                    data: [{
                        x: [new Date(item.start), new Date(item.end)],
                        y: item.machine
                    }],
                    backgroundColor: color,
                    borderColor: color,
                    borderWidth: 1,
                    barPercentage: 1, // Giữ độ dày thanh cố định
                    categoryPercentage: 0.8 // Giữ khoảng cách danh mục cố định
                };
            });

            const ganttCtx = document.getElementById('ganttChart').getContext('2d');
            new Chart(ganttCtx, {
                type: 'bar',
                data: { datasets: ganttDatasets },
                options: {
                    indexAxis: 'y',
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

            const errorCtx = document.getElementById('errorChart').getContext('2d');
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
