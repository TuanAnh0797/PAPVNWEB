<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadGroup.aspx.cs" Inherits="PAPVN.UI_Plan.UploadGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="m-2">
     <div class="row" style="background-color: #fffefe; border-radius: 8px;">
         <div class="col" style="margin-top: 5px; margin-bottom: 5px">
             <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="20px" />
         </div>

         <div class="col-sm-3" style="margin-top: 5px; margin-bottom: 5px">
             <asp:Button type="button" Text="Upload" OnClick="Unnamed_Click" runat="server" name="btn_Import" Style="font-size: 20px; font-weight: 600; padding: 5px" class="btn btn-outline-primary btn-block "></asp:Button>
         </div>

     </div>

 </div>
      <div class="card">
      <div class="card-header">
          <div class="text-center">
              <h1 style="font-weight: bold">Group Model </h1>
          </div>
      </div>
      <!-- /.card-header -->
      <div class="card-body">
          <table id="example1" class="table table-bordered table-striped">
              <thead>
                  <tr style="font-size: 16px">
                      <th>Type1</th>
                      <th>Type2</th>
                      <th>TypeName</th>
                      <th>CodeModel</th>
                  </tr>
              </thead>
              <tbody style="font-size: 16px" id="dt_group" runat="server">
              </tbody>
          </table>
      </div>
      <!-- /.card-body -->
  </div>
   
</asp:Content>
