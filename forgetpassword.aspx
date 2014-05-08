<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="forgetpassword.aspx.vb" Inherits="forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>Forget Password</span></a></li>
        	
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                   
                
            
            <tr>
                <td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">
                     Lost Password<br /> <img src="images/line.gif" height="1px" width="800" />
                </td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
            
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;Email Address
            
            </td>
            <td>
            
            
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;<a 
                href="mailto:example@example.com">example@example.com</a>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="textbox1"
            ValidationExpression="^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" runat="server" 
            ForeColor="Brown" ErrorMessage=" ** Format invalid"></asp:RegularExpressionValidator>
            
                            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" ForeColor="Brown" runat="server" ControlToValidate="textbox1" ErrorMessage=" ** Required"></asp:RequiredFieldValidator>
            
            </td>
            <td></td>
            </tr>
            <tr><td valign="middle">

            <span style="color:Red; font-size:12px;">*</span>&nbsp;Confirm Email
            </td>
            <td valign="middle">
                    
                      <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                      <asp:CompareValidator ID="CompareValidator1" Display="dynamic"
                        ControlToValidate="textbox2"
                        ControlToCompare="textbox1"
                        ForeColor="brown"
                        Type="String"
                        Text=" ** must match" 
                        runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator> 
             </td>
             <td></td></tr>
            <tr><td colspan="3">

                <asp:Button ID="Button1" style="background:#1E74A2; width:150px; height:40px; color:White; font-size:14px; font-weight:600;" runat="server" Text="Submit" />
             </td></tr>
            </table>
            
    
         
        </div>
           
    </div>		
    </div>



</asp:Content>

