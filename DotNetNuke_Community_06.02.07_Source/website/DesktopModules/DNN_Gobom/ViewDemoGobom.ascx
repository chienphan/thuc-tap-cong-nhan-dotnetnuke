<%@ Control Language="C#" Inherits="DNN.Modules.DemoGobom.ViewDemoGobom"  AutoEventWireup="true" CodeBehind="ViewDemoGobom.ascx.cs" %>
<%@ Register Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" TagPrefix="cc1" %>
<asp:GridView ID="GridView1" runat="server">
     <RowStyle Width=100% />    
</asp:GridView>
<asp:DataList ID="DataList1" RepeatDirection= Vertical runat="Server">
    <ItemTemplate>
        <a href="./Default.aspx?TabID=89&NewsID=<%# DataBinder.Eval(Container.DataItem, "ID") %>"><h1><%# DataBinder.Eval(Container.DataItem, "Title") %></h1></a>
        <%# DataBinder.Eval(Container.DataItem, "Contents") %>
    </ItemTemplate>
</asp:DataList>
