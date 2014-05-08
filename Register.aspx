<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 <style type="text/css">
    .style1
    {
        height: 26px;
    }
        .style5
        {
            width: 513px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    
 <div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>Account Registration</span></a></li>
        	<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>Information</span></a></li>
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	<div id="registeracc" runat="server"><span style="color:#880000; font-size: 14px; ">Please fill the form to register as ICNA member</span></div>
            <table style="width: 100%;">
                
            <tr><td colspan="3"> <!--<span style="color:Red; font-size: 12px;">* Fields are mandatory</span>--></td></tr>
             <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Login Information<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>

                 <tr>
               
                <td class="style5">
                    <span style="color:Red; font-size:12px;">*</span>&nbsp;LoginID&nbsp;<asp:RequiredFieldValidator ForeColor="Brown" ControlToValidate="textbox6" ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage=" ** Please enter"></asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    example@example.com&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ControlToValidate="textbox6"
            ValidationExpression="^[_a-z0-9-]+(.[a-z0-9-]+)@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,4})$" runat="server" 
            ForeColor="Brown" ErrorMessage="** format invalid"></asp:RegularExpressionValidator>
            </td>
                <td>
                    
                </td>
                <td>
                </td>
            </tr>
            <tr>
                
                <td class="style5"><span style="color:Red; font-size:12px;">*</span>&nbsp;
                    Password&nbsp;<asp:RequiredFieldValidator ControlToValidate="TextBox7"    ForeColor="Brown" ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator>
<br />
                    <asp:TextBox ID="TextBox7" TextMode="password" runat="server"></asp:TextBox><br />
                    
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" 
                        ErrorMessage="** Should be 6 to 10 & alphanumeric"
                        ControlToValidate="TextBox7"    ForeColor="Brown"
                        ValidationExpression="^[a-zA-Z0-9]{6,50}$" ></asp:RegularExpressionValidator>
                </td>
                <td></td>
                <td><span style="color:Red; font-size:12px;">*</span>&nbsp;Confirm Password&nbsp; 
                    <asp:CompareValidator ID="CompareValidator1" Display="dynamic"
ControlToValidate="textbox9"
ControlToCompare="textbox7"
ForeColor="brown"
Type="String"
Text=" ** must match" 
runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator><br />
                    <asp:TextBox ID="TextBox9" TextMode="password" runat="server"></asp:TextBox>
                </td>
                
            </tr>


            <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Contact Information<br />
            <img src="images/line.gif" width="800" /></td>
            </tr>
            <tr>
                
                <td class="style5">
                    <span style="color:Red; font-size:12px;">*</span>&nbsp;
                    First Name&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox1" ForeColor="Brown" ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="171px"></asp:TextBox>
                </td>
                <td></td>
                <td>
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                Last Name&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox2" ForeColor="Brown" ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator> <br />
                <asp:TextBox ID="TextBox2" runat="server" Width="171px"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>
                <table><tr><td>
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                State&nbsp;
                <asp:RequiredFieldValidator ControlToValidate="textbox10" ForeColor="Brown" ID="RequiredFieldValidator8" runat="server"
                            ErrorMessage=" ** required"></asp:RequiredFieldValidator>
                </td></tr></table>
             
                <asp:TextBox ID="TextBox10" runat="server" Width="170"></asp:TextBox></td>
            <td></td>
            <td>
            <table><tr>
            <td width="130px"><span style="color:Red; font-size:12px;">*</span>&nbsp;
            City&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox11" ForeColor="Brown" ID="RequiredFieldValidator9" runat="server"
                            ErrorMessage=" ** required"></asp:RequiredFieldValidator></td>
            <td>
            <span style="color:Red; font-size:12px;">*</span>&nbsp;
            Zip&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox12" ForeColor="Brown" ID="RequiredFieldValidator10" runat="server"
                            ErrorMessage=" **required"></asp:RequiredFieldValidator>&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Brown"
                            ControlToValidate="textbox12"
                            ValidationExpression="\d{5}"
                            ErrorMessage="5 digits only"
                            runat="server" />
            </td>
            </tr></table>
            
            <asp:TextBox ID="TextBox11" runat="server" Width="110"></asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox12" runat="server" Width="80"></asp:TextBox></td>
            </tr>
            
                 <tr>
                
                <td colspan="3">
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                    Address&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox3" ForeColor="Brown" ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="TextBox3" runat="server" Width="725px" Height="75px"></asp:TextBox></td>
                
            </tr>

            
             <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Contact Information<br />
            <img src="images/line.gif" width="800" /></td>
            </tr>


                <tr>
                
                <td class="style5">
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                    Phone&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox4" ForeColor="Brown" ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br /> 
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp; &nbsp; Format: 1231231234
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ForeColor="Brown"
                            ControlToValidate="textbox4"
                            ValidationExpression="\d{10}"
                            ErrorMessage="Should be 10 digits"
                            runat="server" />
                </td>
                <td></td>
                <td>
                    Mobile (Optional)<br /><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                    
            </tr>


            
            <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Security Information<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>

           
                <tr>
                
                <td class="style5">
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                    Secret Questions<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="QuestionText" 
                        DataValueField="QuestionID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SQLDbConnection %>" 
                        SelectCommand="SELECT [QuestionID], [QuestionText] FROM [SecurityQuestions]">
                    </asp:SqlDataSource>
                    </td>
             <td></td>
                <td>
                <span style="color:Red; font-size:12px;">*</span>&nbsp;
                Answer&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox8" ForeColor="Brown" ID="RequiredFieldValidator7" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br /><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        </td>
                
                    
            </tr>
            <tr>
                    
                    <td colspan="3">
                    <hr />

                        <asp:Button ID="Button1" style="background:#1E74A2; width:160px; height:40px; color:White; font-size:16px; font-weight:600;" runat="server" Text="Click to Register" />
                     </td>
                
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

