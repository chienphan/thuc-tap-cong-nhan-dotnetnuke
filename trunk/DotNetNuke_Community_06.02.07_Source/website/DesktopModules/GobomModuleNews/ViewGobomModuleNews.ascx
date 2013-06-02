<%@ Control Language="C#" Inherits="GobomDNN.Modules.GobomModuleNews.ViewGobomModuleNews"
    AutoEventWireup="true" CodeBehind="ViewGobomModuleNews.ascx.cs" %>
<asp:DataList ID="DataList1" RepeatDirection= "Horizontal" runat="Server">
    <ItemTemplate>
        <h1><p><%# DataBinder.Eval(Container.DataItem, "Title") %></p></h1>
        <p>Ngày đăng: <%# DataBinder.Eval(Container.DataItem, "DateCreate")%></p>
        <br />
        <img src="<%# DataBinder.Eval(Container.DataItem, "ImageURL") %>" height="400" width="600">
        <br />
        <p><div style="text-align:justify"><%# DataBinder.Eval(Container.DataItem, "Contents") %></p></div>
        <br />
        <h3><%# DataBinder.Eval(Container.DataItem, "Poster")%></h3>
    </ItemTemplate>
</asp:DataList>