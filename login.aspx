<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>Account Login</span></a></li>
        	<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>Information</span></a></li>
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
            <div id="accverified" runat="server"><span style="color:#880000; font-size: 14px; ">Your account has been verified, please Login below. </span></div>
        	<div id="alreadymember" runat="server"><span style="color:#880000; font-size: 14px; ">A login with this email has already been registered. Please login below. </span></div>
            <div id="chkemail" runat="server"><span style="color:#880000; font-size: 14px; ">Email with login credentials has been sent. </span></div>
           <table style="width:100%;">
    <tr><td colspan="4"><!--<span style="color:Red; font-size: 12px;">* Fields are mandatory
    
    
    </span>--></td></tr>
            <tr><td colspan="4" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="4" style="font-size:16px; color:#004080; font-weight:600;">Login to your account<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>
    <tr>

     
        <td >
            </td>

     
        <td style="vertical-align:middle;">
           <span style="color:Red; font-size:12px;">*</span>&nbsp; Login Name</td>
        <td>
        
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" ForeColor="Brown" runat="server" ControlToValidate="textbox1" ErrorMessage="Please enter login name"></asp:RequiredFieldValidator>
            <br />
            
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<a 
                href="mailto:example@example.com">example@example.com</a>&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="textbox1"
            ValidationExpression="^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" runat="server" 
            ForeColor="Brown" ErrorMessage="Please follow example format"></asp:RegularExpressionValidator>
            
        </td>
        <td >
        
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td style="vertical-align:middle;">
           <span style="color:Red; font-size:12px;">*</span>&nbsp; Login Password</td>
        <td>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Brown" Display="Dynamic" ControlToValidate="textbox2" runat="server" ErrorMessage="Please enter password"></asp:RequiredFieldValidator>
        <br />
            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;Registration password
         </td>
        <td class="style4">
           </td>
    </tr>
    <tr>
    <td></td>
    <td></td>
    <td><span style="color:Red; font-size: 12px;"><a href="forgetpassword.aspx">Forget password</a>
    
    
    </span></td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            &nbsp;</td>
        <td>

            <asp:Button ID="Button1" style="background:#1E74A2; width:150px; height:40px; color:White; font-size:14px; font-weight:600;" runat="server" Text="Account Login" />


        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>


        </div>
           
    </div>		
    </div>



    <div id="tab-bestseller">
    <div id="tab-bestseller-content" class="tabs-category-products ">
    
        <div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	<table border="0">
            	<tr>
                	<td colspan="2" ><h1>Information</h1></td>
                </tr>
            </table>
        </div>
                                    
    </div>		
    </div>

</asp:Content>

