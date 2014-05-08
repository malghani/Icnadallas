using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Data;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid, order_number, total, key, secretword, hash, name, address, phone, country, state, zip, city, email, date1,category,accountnummber;
        secretword = "tango"; // Secret word is set in the 2Checkout Site Management window
        hash = "";

        sid = Request.Params["sid"]; // Sid is the seller id created by 2Checkout
        order_number = Request.Params["order_number"]; // Order number is passed back
        total = Request.Params["total"]; // Total is passed back, here the example is 25.00
        key = Request.Params["key"]; // Returned MD5 hash created by teh secretword, sid, ordernumber and the total
        name = Request.Params["card_holder_name"];
        address = Request.Params["street_address"] + "</br>Address 2" + Session["address2"];
        phone = Request.Params["phone"];
        country = Request.Params["country"];
        state = Request.Params["state"];
        zip = Request.Params["zip"];
        city = Request.Params["city"];
        email = Request.Params["email"];

        

        //category = Session["AccountNumber"].ToString();
        //accountnummber = Session["Category"].ToString();

        string isdemo = ConfigurationManager.AppSettings["isdemo"].ToString();

        if (isdemo == "N")
        {
            hash = getMd5Hash(secretword + sid + order_number + total);
        }
        else if (isdemo == "Y")
        {
            hash = getMd5Hash(secretword + sid + 1 + total); // Order_number is set to 1 for demo account, for live account change 1 back to order_number
        }
        if (hash == key) // Check if the hashes match
        {
            date1 = DateTime.Now.ToString();
            SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
            try
            {
                myConnection.Close();
                myConnection.Open();

                SqlCommand myCommand = new SqlCommand("INSERT INTO Payments (Amount,OrderNumber,MD5Hash,Name,City,Email,Address,Phone,Zip,Country,State,AccountNumber,Date_Time,Category) " +
                    "VALUES ('" + total + "','" + order_number + "','" + key + "','" + name + "','" + city + "','" + email + "','" + address + "'" +
                ",'" + phone + "','" + zip + "','" + country + "','" + state + "','" + Session["AccountNumber"] + "','" + date1 + "','" + Session["Category"] + "')", myConnection);
                myCommand.ExecuteNonQuery();

            }
            catch (Exception e1)
            {
                //MessageBox.Show(e1.ToString());
            }
            myConnection.Close();
            //Label1.Text = "Success";
            //Response.Redirect("email.aspx?email=" + email + "&decide=yes&amount=" + total);
            Response.Redirect("email.aspx?ordernumber="+ order_number);
        }
        else
        {
            Response.Write("Not a Success, Key was not a match.");
            //Label1.Text = "Not Success";
            //Response.Redirect("email.aspx?email=" + email + "&decide=no");
        }
        

    }

    
    public string getMd5Hash(string input)
    {
        // Create a new instance of the MD5CryptoServiceProvider object.
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();

        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data 
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString().ToUpper();
    }

}