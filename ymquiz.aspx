<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ymquiz.aspx.vb" Inherits="ymquiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<div class="ma-tabs-title">
        <ul class="tabs-title">
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>YM Quiz Registration</span></a></li>
        	<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>More Information</span></a></li>
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	<div id="divactive2" runat="server">
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
                     Quiz Category Selection<br /> <img src="images/line.gif" height="1px" width="800" />
                </td>
            </tr>
            <tr>
            
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="Amount">
                </asp:DropDownList>
            
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQLDbConnection %>" 
                    SelectCommand="SELECT [Category], [Amount] FROM [ymcategory]">
                </asp:SqlDataSource>
            
            </td><td></td><td></td></tr>
            <tr><td colspan="3">

                <asp:Button ID="Button1" style="background:#1E74A2; width:140px; height:30px; color:White; font-size:14px; font-weight:600;" runat="server" Text="Apply" />


             </td></tr>
            </table>
            </div>
    
         <div id="divinactive2" runat="server">
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
                     Quiz Category Selection<br /> <img src="images/line.gif" height="1px" width="800" />
                </td>
            </tr><tr><td>Login to apply for the quiz, for more information please visit information tab. Thank you<br /><br />
            
            <a href="login.aspx">Login Now</a></td></tr></table>
            </div>
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

