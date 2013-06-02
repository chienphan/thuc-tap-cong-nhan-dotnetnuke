<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Delete.ascx.cs" Inherits="DNN.Modules.DemoGobom.Delete" %>
<p>
    <p>Do you want to delete: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></p>
    <asp:LinkButton ID="linkButtonOK" runat="server" OnClick="cmd_OK">Delete</asp:LinkButton>
    <asp:LinkButton ID="LinkButtonCancel" runat="server" OnClick="cmd_Cancel">Cancel</asp:LinkButton>
</p>