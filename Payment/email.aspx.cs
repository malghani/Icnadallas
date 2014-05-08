using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration; 

public partial class email : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {


        string ordernumber = Request.Params["ordernumber"];

        //string email = Request.Params["email"];
        //string decide = Request.Params["decide"];
        //string amount = Request.Params["amount"];
        if(ordernumber == null)
        {
                try
                {
                    string url = Request.Url.AbsoluteUri.ToString();
                    string[] sites = url.Split('/');


                    SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
                    SqlDataReader myReader = null;
                    SqlCommand myCommand = new SqlCommand("SELECT * FROM Payments", myConnection);
                    myConnection.Close();
                    myConnection.Open();
                    myReader = myCommand.ExecuteReader();
                    Response.Write("<table border='0'>");
                    while (myReader.Read())
                    {
                        Response.Write("<tr>");
                        Response.Write("<td>" + myReader["OrderNumber"].ToString() + "</td><td>" + "<a href='email.aspx?ordernumber=" + myReader["OrderNumber"].ToString() + "'>View</a>");
                        Response.Write("</td>");
                        Response.Write("</tr>");
                    }

                    myConnection.Close();
                    Response.Write("</table>");
                    Response.Write("<form id='form1' runat='server'>" +
                                   "<a href='donate.aspx'><button type='button'>Go Back</button></a>" +
                                   "</form>");
                }
                catch (Exception e1)
                {
                    Response.Write(e1.ToString());
                }
        }
        else if (ordernumber != null)
        {
            try
            {
                SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
                SqlDataReader myReader = null;
                SqlCommand myCommand = new SqlCommand("SELECT * FROM Payments WHERE OrderNumber='" + ordernumber + "'", myConnection);
                myConnection.Close();
                myConnection.Open();
                myReader = myCommand.ExecuteReader();
                Response.Write("<table border='0' width='80%'>");
                Response.Write("<col width='10'><col width='10'>");
                Response.Write("<tr><th></th><th align='left'>");
                while (myReader.Read())
                {
                    Response.Write("<label>Thank you for donating to our cause, below is the posted information associated with order number</label> [" + myReader["OrderNumber"].ToString() + "]<label> is available for printing purposes.</label> </br><h4>Order Information</h4><label>Order Number</label>: " + myReader["OrderNumber"].ToString() + "<div style='padding-top:10px;'></div><label>Donated Amount</label>: " + myReader["Amount"].ToString() + "<div style='padding-top:10px;'></div><label>Date Paid</label>: " + myReader["Date_Time"].ToString() + "<hr><h4>Personal Information</h4><label>Name</label>: "
                        + myReader["Name"].ToString() + "<div style='padding-top:10px;'></div><label>Address</label>: " + myReader["Address"].ToString() + "<div style='padding-top:10px;'></div><label>Country</label>: " + myReader["Country"].ToString() + "<div style='padding-top:10px;'></div><label>State/Province</label>: " +
                        myReader["State"].ToString() + "<div style='padding-top:10px;'></div><label>City</label>: " + myReader["City"].ToString() + "<div style='padding-top:10px;'></div><label>Zip/Postal Code</label>: " + myReader["Zip"].ToString() + "<hr><h4>Contact Information</h4><label>Email Address</label>: " + myReader["Email"].ToString() + "<div style='padding-top:10px;'></div><label>Phone Number</label>: " + myReader["Phone"].ToString() +
                        "<hr><h4>Personalized Information (ICNA)</h4> <label>Account Number</label>: " + myReader["AccountNumber"].ToString() + "<div style='padding-top:10px;'></div><label>Category</label>: " + myReader["Category"].ToString());

                    Response.Write("<hr><div style='padding-top:10px;'></div>ICNA DALLAS USA <br>220 E. Spring Valley Rd. Richardson, TX 75081 <br> nonprofit organization <br>PH: 972-669-9625 <br> <div style='padding-top:30px;'></div>");
                    
                }

                myConnection.Close();
                
                Response.Write("<form id='form1' runat='server'>" +
                                   "<a href='donate.aspx'><button type='button'>Go Back</button></a>" +
                                   "</form>");
                Response.Write("</th></tr></table><div style='padding-top:30px;'></div>");
            }
            catch (Exception e1)
            {
                Response.Write(e1.ToString());
            }
        }
    }
}