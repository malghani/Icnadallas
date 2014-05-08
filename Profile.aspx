<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Profile.aspx.vb" Inherits="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



<div class="ma-tabs-title">
        <ul class="tabs-title">
            
        	<li class="ma-featured first"><a href="#tab-featured" title="featured"><span>Family Members</span></a></li>
        	<!--<li class="ma-bestseller "><a href="#tab-bestseller" title="bestseller"><span>Security Information</span></a></li>
            <li class="ma-bestseller2 "><a href="#tab-bestseller2" title="bestseller2"><span>Donation Link</span></a></li>
            -->
            <li class="ma-bestseller3"><a href="#tab-bestseller3" title="bestseller3"><span>Profile</span></a></li>
        </ul>
    </div>
    
    
    <div id="tabsproduct-content" class="ma-tabs-content">
    <div id="tab-featured">
    <div id="tab-featured-content" class="tabs-category-products tabs-first">              
                  
    	<div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">
        	
            <!-- Start here Member page -->
            <table style="width: 100%;">
            <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">
        	Register Members<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>
                <tr><td colspan="3">
                    <div id="divt2" runat="server">
                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                    </div>
                </td>
                </tr>
                <tr>
                    <td colspan="3">
                      <div id="divt" runat="server">
                     




                          <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                          <ItemTemplate>
                        

                              <table style="width: 100%;">
                                  <tr>
                                      <td style="width:40%;"><div><b>First Name: &nbsp;</b><%# Eval("FName")%></div></td> 
                                      <td style="width:5%;">&nbsp;</td>
                                      <td style="width:55%;"><div><b>Last Name: &nbsp;</b><%# Eval("LName")%></div></td>
                                  </tr>
                                   <tr>
                                      <td><div><b>Age: &nbsp;</b><%# Eval("Age")%></div></td> 
                                      <td>&nbsp;</td>
                                      <td></td>
                                  </tr>
                                   <tr>
                                      <td><div><b>School Name: &nbsp;</b><%# Eval("SchoolName")%></div></td> 
                                      <td>&nbsp;</td>
                                      <td><div><b>Grade Name: &nbsp;</b><%# Eval("GradeName")%></div></td>
                                  </tr>
                                  <tr>
                                      <td><div><b>OtherSchoolName: &nbsp;</b><%# Eval("OtherSchoolName")%></div></td> 
                                      <td>&nbsp;</td>
                                      <td></td>
                                  </tr>
                              </table>
                          
                          </ItemTemplate>

                          <AlternatingItemTemplate>
                          <br />

                           <table style="width: 100%;">
                                  <tr>
                                      <td style="width:40%;"><div><b>First Name: &nbsp;</b><%# Eval("FName")%></div></td> 
                                      <td style="width:5%;">&nbsp;</td>
                                      <td style="width:55%;"><div><b>Last Name: &nbsp;</b><%# Eval("LName")%></div></td>
                                  </tr>
                                   <tr>
                                      <td><div><b>Age: &nbsp;</b><%# Eval("Age")%></div></td> 
                                      <td>&nbsp;</td>
                                      <td><div><b>Gender: &nbsp;</b><%# Eval("Gender")%></div></td>
                                  </tr>
                                   <tr>
                                      <td><div><b>School Name: &nbsp;</b><%# Eval("SchoolName")%></div></td> 
                                      <td>&nbsp;</td>
                                      <td><div><b>Grade Name: &nbsp;</b><%# Eval("GradeName")%></div></td>
                                  </tr>
                                  <tr>
                                      <td><div><b>OtherSchoolName: &nbsp;</b><%# Eval("OtherSchoolName")%></div></td> 
                                      <td>&nbsp;</td>
                                        <td>
                                            </td>
                                  </tr>

                              </table>

                          <br />
                          
                          </AlternatingItemTemplate>
                          </asp:Repeater>
                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:SQLDbConnection %>" 
                              SelectCommand="SELECT [FamilyID], [MemberID], [FName], [LName], [Age], [Gender], [OtherSchoolName], [SchoolName], [GradeName] FROM [FamilyMember] WHERE ([FamilyID] = @FamilyID)">
                              <SelectParameters>
                                  <asp:SessionParameter Name="FamilyID" SessionField="familyid" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>




                       </div>
                    </td>
                </tr>
               
                
            </table>
    
    


    <br /><br />
   
    <table style="width:100%;">
    <tr><td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Add Member<br />
            <img src="images/line.gif" height="1px" width="800" /></td></tr>

            </table>
        
        <div id="family" runat="server"><span style="color:#880000; font-size: 14px; ">
        Family member added, please fill the form if you want to add another member of the family.</span> </div>
        <table>
        <tr><td colspan="3"> <!--<span style="color:Red; font-size: 12px;">* Fields are mandatory</span>--></td></tr>
        <tr><td colspan="3"> &nbsp;</td></tr>
        <tr>
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;
                First Name&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox1" ForeColor="Brown" ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;
                Last Name&nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox2" ForeColor="Brown" ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr><td >Adult: <br />
            <asp:DropDownList ID="DropDownList3" AutoPostBack="True" runat="server">
            
            <asp:ListItem Value="1">Adult</asp:ListItem>
            <asp:ListItem Selected="True" Value="0">Child</asp:ListItem>
            </asp:DropDownList>
        </td><td></td><td><span style="color:Red; font-size:12px;">*</span>&nbsp;Gender<br />
            <asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem Value ="Male" Selected="True">Male</asp:ListItem>
                <asp:ListItem Value = "Female">Female</asp:ListItem>
            </asp:DropDownList>
            
        </td></tr>
        <div id="divactive" runat="server">
        <tr>
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;
                Age &nbsp;<asp:RequiredFieldValidator ControlToValidate="textbox3" ForeColor="Brown" ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage=" ** required"></asp:RequiredFieldValidator><br />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;School Name<br />
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="SchoolName" 
                    DataValueField="SchoolID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQLDbConnection %>" 
                    SelectCommand="SELECT [SchoolID], [SchoolName] FROM [School]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><span style="color:Red; font-size:12px;">*</span>&nbsp;Grade Name<br />
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="GradeName" 
                    DataValueField="GradeID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQLDbConnection %>" 
                    SelectCommand="SELECT [GradeID], [GradeName] FROM [Grade]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>Other School Name (if not in the list)<br />
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>

        </div>
        <tr>
            <td>

                <asp:Button ID="Button1" style="background:#1E74A2; width:140px; height:40px; color:White; font-size:14px; font-weight:600;" runat="server" Text="Add" />
             </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>


            <!-- CLose here -->


   
    <br />
 
   
    
    
        </div>
           
    </div>		
    </div>
    
    <div id="tab-bestseller3">
    <div id="tab-bestseller3-content"  class="tabs-category-products ">
    
        <div style="margin-left:40px; margin-top:20px; margin-bottom:40px; ">

    
        
            <table style="width: 100%;">

                <tr>
                <td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">
                     Personal Details<br /> <img src="images/line.gif" height="1px" width="800" />
                </td>
                </tr>

                <tr>
                    <td style="width:40%">
                        <b>First Name: </b>&nbsp; <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
   
                    </td>
                    <td style="width:40%">
                        <b>Last Name: </b>&nbsp;   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td style="width:20%">
                        &nbsp;
                    </td>
                </tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr>
                    <td>
                        <b>State: </b>&nbsp; 
                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
   
                    </td>
                    <td>
                        <b>City: </b>&nbsp;   
                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                        
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>

                <tr><td colspan="3"> <b>Zip: </b>&nbsp; 
                    <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                </td></tr>
                <tr><td colspan="3">&nbsp;</td></tr>
                <tr>
                    <td colspan="2">
                        <b>Address: </b>&nbsp;<br /><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    
                    </td>
                    
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr><td colspan="3"><br /><br /></td></tr>
                  <tr>
                <td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">
                     Contact Details<br /> <img src="images/line.gif" height="1px" width="800" />
                </td></tr>
                <tr>
                    <td>
                        <b>Phone: </b>&nbsp;    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <b>Mobile: </b>&nbsp;<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr><td colspan="3"><br /><br /></td></tr>
                <!--<tr>
                <td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">
                     Login Information<br /> <img src="images/line.gif" height="1px" width="800" />
                </td></tr>
                
                <tr>
                    <td>
                        <b>Login Name:</b> &nbsp; 
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <b>Login Password:</b> &nbsp;
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td width="200">
                        &nbsp;
                    </td>
                </tr>
                -->
                <tr><td colspan="3"><br /><br /></td></tr>

                <tr>
                    <td colspan="3" style="font-size:16px; color:#004080; font-weight:600;">Secret Questions<br />
                        <img src="images/line.gif" height="1px" width="800" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Selected Question:</b> &nbsp;<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <b>Answer: </b>&nbsp;<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>



                    </div>
                                    
                </div>		
                </div>

</asp:Content>

