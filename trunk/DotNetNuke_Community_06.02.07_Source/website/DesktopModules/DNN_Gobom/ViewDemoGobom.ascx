<%@ Control Language="C#" Inherits="DNN.Modules.DemoGobom.ViewDemoGobom"  AutoEventWireup="true" CodeBehind="ViewDemoGobom.ascx.cs" %>
<%@ Register Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" TagPrefix="cc1" %>
<asp:GridView ID="GridView1" runat="server">
     <RowStyle Width=100% />    
</asp:GridView>
<asp:DataList ID="DataList1" RepeatDirection= Vertical runat="Server">
    <ItemTemplate>
            <a href="./tabid/89/NewsID/<%# DataBinder.Eval(Container.DataItem, "ID") %>/Default.aspx"><h3><%# DataBinder.Eval(Container.DataItem, "Title") %></h3></a>
            <div>
                <div style="width:20%; float:left"><img src="<%# DataBinder.Eval(Container.DataItem, "ImageURL") %>" height="100" width="100"></div>
                <div style="text-align:justify; width:80%; float:right"><%# DataBinder.Eval(Container.DataItem, "Contents").ToString().Substring(0, 400) + "..."%></div>
    
            </div>
    </ItemTemplate>
</asp:DataList>
