<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

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
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     
 <div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>ICNA Home</span></a></li>
        	<!--<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>Information</span></a></li>-->
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	
            <table style="width: 100%;">
                
             <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Registration<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>

                
            <tr><td colspan="3" style="font-size:14px; font-weight:400;">Click <a style=" text-decoration:underline;" href="register.aspx">Account Registration</a> to register as a member.</td></tr>

            <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Account Login<br />
            <img src="images/line.gif" width="800" /></td>
            </tr>
            <tr><td colspan="3" style="font-size:14px; font-weight:400;">Click <a style=" text-decoration:underline;" href="login.aspx">Login</a> for logging in to your account. </td></tr>

             <tr><td colspan="3" style="font-size:16px; font-weight:400;">&nbsp;</td></tr>
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">YM Quiz Event<br />
            <img src="images/line.gif" width="800" /></td>
            </tr>

             <tr><td colspan="3" style="font-size:14px; font-weight:400;">Click <a style=" text-decoration:underline;" href="ymquiz.aspx">YM Quiz</a> for event registration.</td></tr>

               
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