<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="VerCode.aspx.vb" Inherits="VerCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>Account Verification</span></a></li>
        	<!--<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>Information</span></a></li>-->
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">


        <table>
        <tr><td colspan="4" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="4" style="font-size:16px; color:#004080; font-weight:600;">Verify your account<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>
           <tr> <td colspan="4" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
        </table>
        	
<div id="div1" runat="server"><span style="color:#880000; font-size: 14px; ">Click verify to submit verification. </span></div>
<div id="div2" runat="server"><span style="color:#880000; font-size: 14px; ">

    Your account has been created but it will not be activated until you open the email sent to you and click on the verification link to activate your new account.  
    <b>If you have not received the verification email, please check your junk mail folder to ensure the email was not treated as junk mail.</b>
</span></div>
    
    <asp:TextBox ID="TextBox2" Width="380" runat="server"></asp:TextBox>
    <asp:HiddenField ID="HiddenField1" runat="server" />
   <br />
            <asp:Button ID="Button1" style="background:#1E74A2; width:150px; height:35px; color:White; font-size:14px; font-weight:600;" runat="server" Text="Verify Account" />


    
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

