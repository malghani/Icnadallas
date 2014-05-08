<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        <asp:ListItem Selected="True" Value="3">Select</asp:ListItem>
        <asp:ListItem Value="1">Adult</asp:ListItem>
        <asp:ListItem Value="0">child</asp:ListItem>
    </asp:DropDownList>
    <asp:CompareValidator ID="CompareValidator1" runat="server" Text="Select dropdown" 
ControlToValidate="DropDownList1" Operator="NotEqual" ValueToCompare = "3"
ValidationGroup="CreateRolls"></asp:CompareValidator>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="textbox1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    <asp:TextBox ID="Textbox2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textbox2" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>

    <asp:Button ID="Button1" runat="server" Text="Button" />
</asp:Content>

