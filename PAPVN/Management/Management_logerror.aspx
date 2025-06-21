<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Management_logerror.aspx.cs" Inherits="PAPVN.Management.Management_logerror" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="m-2">
      <div class="row" style="background-color: #fffefe; border-radius: 8px;">
          <div class="col" style="margin-top: 5px; margin-bottom: 5px">
             <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
          </div>
          
          <div class="col-sm-3" style="margin-top: 5px; margin-bottom: 5px">
              <asp:Button type="button" Text="Upload" OnClick="btnImport_Click" runat="server" name="btn_Import" Style="font-size: 20px; font-weight: 600; padding: 5px" class="btn btn-outline-primary btn-block "></asp:Button>
          </div>

      </div>

  </div>
    <table style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px; padding-top: 10px" id="dataTable" class="table table-striped table-bordered text-center">
        <thead style="background-color: #b2bac2; color: black">
            <tr class="p-0">
                <th class="p-1">Name Machine </th>
                <th class="p-1">Code Error</th>
                <th class="p-1">Name Error </th>
                <th class="p-1">Time Update </th>
            </tr>
        </thead>
        <tbody id="tableBody" class="p-0" style="font-size: 14px" runat="server">
        </tbody>
    </table>
    <script>
        $(document).ready(function () {
            // Khởi tạo DataTable
            var table = $('#dataTable').DataTable({
                pageLength: 3,
                lengthChange: false,
                paging: true,
                searching: false,
                ordering: false,
                info: false,


            });
           
        });
    </script>
</asp:Content>
