<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadPlan.aspx.cs" Inherits="PAPVN.UploadPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #popupDiv {
            background-color: #f9f9f9;
            padding: 0px 20px 0px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }

        .ui-dialog-titlebar {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px 5px 0 0;
            height: 50px;
        }
        /* Style cho nút "Close" trong thanh taskbar */
        .ui-dialog-titlebar-close {
            color: black;
            font-size: 14px;
            width: 50px;
            height: 30px;
            margin-top: 10px;
             margin-left: 10px;
            padding: 0px;
            background-color: red;
        }
        /*.ui-dialog .ui-dialog-titlebar-close .ui-icon {
            background: #ff0000 !important;
        }*/
    </style>
    <div class="m-2">
        <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
        <div class="row" style="margin: 0px 0px 0px 0px; background-color: #fffefe; border-radius: 8px;">
            <%--            <div class="col">
                <div class="form-group" style="margin: 10px 0px 10px 0px">
                    <div class="d-flex flex-row">
                        <div>
                            <p style="margin:5px 3px 0px 0px; font-size:20px; font-weight:600"> Thời gian bắt đầu sản xuất:</p>
                        </div>
                         <div class="flex-fill">
                             <div class=" input-group date" id="reservationdatetimefromplan" data-target-input="nearest">
                            <input runat="server" id="datefrom" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time From" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimefrom">
                            <div class="input-group-append" data-target="#reservationdatetimefromplan" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                        </div>
                         </div>
                    </div>
                </div>
            </div>--%>
            <%-- <div class="col">
                <div class="form-group" style="margin: 10px 0px 10px 0px">
                    <div class="d-flex flex-row">
                        <div>
                            <p style="margin:5px 3px 0px 0px; font-size:20px; font-weight:600"> Thời gian kết thúc sản xuất:</p>
                        </div>
                        <div class="flex-fill">
                            <div class="input-group date" id="reservationdatetimetoplan" data-target-input="nearest">
                        <input runat="server" id="dateto" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time To" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimeto">
                        <div class="input-group-append" data-target="#reservationdatetimetoplan" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <asp:Button type="button" Text="Upload Plan" OnClick="Importdata_Click" runat="server" name="btn_Import" Style="font-size: 20px; font-weight: 600" class="btn btn-outline-primary btn-block mt-1"></asp:Button>
    </div>
    <div class="card">
        <div class="card-header">
            <div class="text-center">
                <h1 style="font-weight: bold">Kế hoạch sản xuất ngày <%=datenow%></h1>
            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr style="font-size: 16px">
                        <th>Model</th>
                        <th>Plan All Day</th>
                        <th>Plan shift 1</th>
                        <th>Plan shift 2</th>
                        <th>Plan shift 3</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Monitor Sepecial</th>
                        <th>Modify Plan</th>
                    </tr>
                </thead>
                <tbody style="font-size: 16px" id="dt_plan" runat="server">
                    <tr>
                        <td>{dt.Rows[i][Model]} </td>
                        <td>{dt.Rows[i][QuantityDay]} </td>
                        <td>{dt.Rows[i][Quantity1]} </td>
                        <td>{dt.Rows[i][Quantity2]} </td>
                        <td>{dt.Rows[i][Quantity3]} </td>
                        <td>{dt.Rows[i][TimeStart]} </td>
                        <td>{dt.Rows[i][TimeEnd]} </td>
                        <td>
                            <button style="width: 120px" type="button" class="btn-success" onclick="MonitorSpecial(this)"><i class="fas fa-plus"></i>Add </button>
                        </td>
                        <td>
                            <button style="width: 120px" type="button" onclick="showPopup(this)"><i class="fas fa-edit"></i>Edit</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <%--    POPUP_Adjust--%>
    <div id="popupDiv" style="display: none;">
        <h1 style="text-align: center; margin: 0px">Adjust Date Time Plan</h1>
        <h2 style="margin: 0px">Model: <span id="ModelSelect"></span></h2>
        <div class="d-flex flex-row">
            <div>
                <p style="font-size: 25px; font-weight: 600">Thời gian bắt đầu sản xuất:</p>
            </div>
            <div class="flex-fill">
                <div class=" input-group date" id="reservationdatetimefromplan" data-target-input="nearest">
                    <input id="datefrom" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time From" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimefromplan">
                    <div class="input-group-append" data-target="#reservationdatetimefromplan" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex flex-row" style="margin: 10px 0px">
            <div>
                <p style="font-size: 25px; font-weight: 600">Thời gian bắt đầu sản xuất:</p>
            </div>
            <div class="flex-fill">
                <div class=" input-group date" id="reservationdatetimetoplan" data-target-input="nearest">
                    <input id="dateto" style="font-size: 20px; font-weight: 400" placeholder="Select Date Time To" type="text" class="form-control datetimepicker-input" data-target="#reservationdatetimetoplan">
                    <div class="input-group-append" data-target="#reservationdatetimetoplan" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: flex; justify-content: center; align-items: center;">
            <button type="button" style="height: 40px; width: 250px" class="btn-danger" onclick="UpdateDateTimePlan()">
                <i class="fas fa-upload"></i>
                Update
            </button>
        </div>
    </div>
    <div id="popuploading" style="display: none;">
        <h2>LOADING...</h2>
    </div>
    <script>
        var isMonitorSpecial = 0;
        var isUpdateDateTimePlan = 0;
        function showPopupLoading() {
            var windowHeight = $(window).height();
            var windowWidth = $(window).width();
            $("#popuploading").dialog({
                modal: true,
                width: windowWidth * 0.2,
                height: windowHeight * 0.2,
                closeOnEscape: false,
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", ui.dialog).hide(); // Ẩn nút đóng trong title bar
                }
            });
        }
        function UpdateDateTimePlan() {
            if (isUpdateDateTimePlan == 0) {
                isUpdateDateTimePlan = 1;
                var datetimefrom = $("#datefrom").val();
                var datetimeto = $("#dateto").val();
                var NameModel = $('#ModelSelect').html();
                if (datetimefrom.length < 10 || datetimeto.length < 10) {
                    alert('Hãy nhập thời gian bắt đầu và kết thúc')
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/MyWebSercive.asmx/UpdateDateTimePlan',
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        data: JSON.stringify({ ModelName: NameModel, TimeFrom: datetimefrom, TimeTo: datetimeto }),
                        success: function (response) {
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            alert(error)
                            location.reload();
                        }
                    });
                }
                isUpdateDateTimePlan = 0;
            }
        }
        function showPopup(elm) {
            var datarow = elm.parentNode.parentNode;
            var windowHeight = $(window).height();
            var windowWidth = $(window).width();
            $("#popupDiv").dialog({
                modal: true,
                width: windowWidth * 0.4,
                height: windowHeight * 0.33,
                //beforeClose: function (event, ui) {
                //    // Thêm nội dung bên trong nút close
                //    $(".ui-dialog-titlebar-close").html("<span class='custom-close-button'>X</span>");
                //    alert('close')
                //},
                
            });
            $('#ModelSelect').html(` ${datarow.cells[0].textContent}`)
        }
        function MonitorSpecial(elm) {
            if (isMonitorSpecial == 0) {
                isMonitorSpecial = 1;
                var htmlelm = elm.innerHTML;
                var datarow = elm.parentNode.parentNode;
                var NameModel = ` ${datarow.cells[0].textContent}`;
                $.ajax({
                    type: 'POST',
                    url: '/MyWebSercive.asmx/MonitorSpecial',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: JSON.stringify({ ModelName: NameModel }),
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        if (data.rs = '1') {
                            if (htmlelm.includes('Add')) {
                                elm.innerHTML = '<i class="fas fa-trash"></i> Remove'
                                elm.classList.remove('btn-success')
                                elm.classList.add('btn-danger');
                            }
                            else {
                                elm.innerHTML = '<i class="fas fa-plus"></i> Add </button>'
                                elm.classList.remove('btn-danger')
                                elm.classList.add('btn-success');
                            }
                        }
                    },
                    error: function (xhr, status, error) {
                        alert(error)
                    }
                });
                isMonitorSpecial = 0;
            }
        }
    </script>
</asp:Content>
