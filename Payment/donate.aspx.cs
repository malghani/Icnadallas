using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

public partial class donate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid = ConfigurationManager.AppSettings["sid"].ToString();
        string isdemo = ConfigurationManager.AppSettings["isdemo"].ToString();
        
        siid.Value = sid;
        issdemo.Value = isdemo;

        
        Session["address2"] = Request["street_address2"];
        Session["secondaryno"] = Request["phone2"];

        bool result = string.IsNullOrEmpty(Request.QueryString["Amount"] as string);
        bool result1 = string.IsNullOrEmpty(Request.QueryString["Category"] as string);
        bool result2 = string.IsNullOrEmpty(Request.QueryString["Account"] as string);


        Console.WriteLine(result);
        Console.WriteLine(result1);
        Console.WriteLine(result2);

        if (result)
        {
            Session["Amount"] = "0";
           

        }
        else
        {
            Session["Amount"] = Server.HtmlEncode(Request.QueryString["Amount"]);
         
    }

        if (result1)
        {
            
            Session["Category"] = "NA";

        }
        else
        {
            
            Session["Category"] = Server.HtmlEncode(Request.QueryString["Category"]);
        }


        if (result2)
        {
            
            Session["AccountNumber"] = "NA";
            

        }
        else
        {
           
            Session["AccountNumber"] = Server.HtmlEncode(Request.QueryString["Account"]);
            
        }

        string strconnect = System.Configuration.ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(strconnect);

        String sql_query1;

        sql_query1 = "SELECT * FROM [FamilyUser] WHERE [LoginID] = '" + Session["userid"] + "'";

        System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand(sql_query1, con);

        con.Open();
        System.Data.SqlClient.SqlDataReader dr = com.ExecuteReader();

        if (dr.Read())
        {
            
            //Response.Write(Session["userid"]);

            Session["FullName"] = dr["FName"].ToString() + " " + dr["LName"].ToString();
            //Response.Write(Session["FullName"]);

            Session["Email"] = dr["LoginID"].ToString();
            //Response.Write(Session["Email"]);

            Session["Address"] = dr["Address"].ToString();
            //Response.Write(Session["Address"]);

            Session["City"] = dr["City"].ToString();
            //Response.Write(Session["City"]);

            Session["State"] = dr["State"].ToString();
            //Response.Write(Session["State"]);

            Session["Zip"] = dr["Zip"].ToString();
            //Response.Write(Session["Zip"]);

            Session["Zip"] = dr["Zip"].ToString();
            //Response.Write(Session["Zip"]);

            Session["Phone"] = dr["Phone"].ToString();
            //Response.Write(Session["Phone"]);


        }
        else
        {


            bool result3 = string.IsNullOrEmpty(Request.QueryString["FName"] as string);
            bool result4 = string.IsNullOrEmpty(Request.QueryString["LName"] as string);
            bool result5 = string.IsNullOrEmpty(Request.QueryString["Address"] as string);
            bool result6 = string.IsNullOrEmpty(Request.QueryString["City"] as string);
            bool result7 = string.IsNullOrEmpty(Request.QueryString["State"] as string);
            bool result8 = string.IsNullOrEmpty(Request.QueryString["Zip"] as string);
            bool result9 = string.IsNullOrEmpty(Request.QueryString["Phone"] as string);
            bool result10 = string.IsNullOrEmpty(Request.QueryString["Email"] as string);



            Console.WriteLine(result3);
            Console.WriteLine(result4);
            Console.WriteLine(result5);
            Console.WriteLine(result6);
            Console.WriteLine(result7);
            Console.WriteLine(result8);
            Console.WriteLine(result9);
            Console.WriteLine(result10);
       

            if (result3)
            {
                Session["FullName"] = "Enter Full Name";


            }
            else
            {
                Session["FullName"] = Server.HtmlEncode(Request.QueryString["FName"] + " " + Request.QueryString["LName"]);

            }

            if (result5)
            {
                Session["Address"] = "Enter Address";


            }
            else
            {
                Session["Address"] = Server.HtmlEncode(Request.QueryString["Address"]);

            }

            if (result6)
            {
                Session["City"] = "Enter City Name";


            }
            else
            {
                Session["City"] = Server.HtmlEncode(Request.QueryString["City"]);

            }

            if (result7)
            {
                Session["State"] = "Enter your State";


            }
            else
            {
                Session["State"] = Server.HtmlEncode(Request.QueryString["State"]);

            }

            if (result8)
            {
                Session["Zip"] = "Enter Zip Code";


            }
            else
            {
                Session["Zip"] = Server.HtmlEncode(Request.QueryString["Zip"]);

            }

            if (result9)
            {
                Session["Phone"] = "Enter Phone Number";


            }
            else
            {
                Session["Phone"] = Server.HtmlEncode(Request.QueryString["Phone"]);

            }


            if (result10)
            {
                Session["Email"] = "Enter Email";


            }
            else
            {
                Session["Email"] = Server.HtmlEncode(Request.QueryString["Email"]);

            }

        }
        dr.Close();
        con.Close();


        
        
    }
}