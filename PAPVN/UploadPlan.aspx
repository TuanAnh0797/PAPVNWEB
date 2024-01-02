<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadPlan.aspx.cs" Inherits="PAPVN.UploadPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="m-2">
          <asp:FileUpload   ID="FileUpload1" runat="server" Font-Size="20px" />
            <div class="row" style="margin: 0px 0px 0px 0px; background-color: #fffefe; border-radius: 8px;">
            <div class="col">
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
            </div>
            <div class="col">
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
            </div>
        </div>

        <asp:Button type ="button" Text="Upload Plan" OnClick="Importdata_Click"  runat="server" name="btn_Import" style="font-size:20px; font-weight:600" class="btn btn-outline-primary btn-block mt-1">
        
        </asp:Button>
       
    </div>
    <div class="card">
        <div class="card-header">
            <div class="text-center">
                <h2>Kế hoạch sản xuất ngày <%=DateTime.Now.ToString("dd/MM/yyyy")%></h2>
            </div>

        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Model</th>
                        <th>Plan</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                </thead>
                <tbody id="dt_plan" runat="server">

                </tbody>
                  

            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <script>
       
    </script>
</asp:Content>
