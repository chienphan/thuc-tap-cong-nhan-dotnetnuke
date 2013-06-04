<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDepartmentsPage.ascx.cs" Inherits="DNN.Modules.DepartmentsPage.EditDepartmentsPage" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<table width=100% cellspacing="0" cellpadding="0" border="0" summary="Edit Table">
    
	<tr>
		<td class="SubHead" width="125"><h3>Update infor for : </h3></td>
		<td><h3><asp:Label ID="LabelTitle" runat="server"></asp:Label></h3></td>
	</tr>
    
    <tr valign="top" height="300">
		<td class="SubHead" width="125"><h3>Content :</h3></td>
		<td>
			<dnn:texteditor id="txtContent" runat="server" height=100% width=100% />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" resourcekey="valContent.ErrorMessage" ControlToValidate="txtContent"
				CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required" Runat="server" />
		</td>
	</tr>
    <tr >
		<td class="SubHead" width="125"><h3>Poster: </h3></td>
		<td><h3><asp:Label ID="LabelPoster" runat="server"></asp:Label></h3></td>
	</tr>
</table>
<p>
    <asp:linkbutton cssclass="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none" text="Update" OnClick="cmdUpdate_Click"></asp:linkbutton>&nbsp;
    <asp:linkbutton cssclass="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none" text="Cancel" causesvalidation="False" OnClick="cmdCancel_Click"></asp:linkbutton>&nbsp;
</p>
<asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
