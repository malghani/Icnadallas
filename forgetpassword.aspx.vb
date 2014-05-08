Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class forgetpassword
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim LoginID, LoginPassword As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString



        Dim dr As SqlDataReader


        myConn = New SqlConnection(stringcon)

        myConn.Open()



        LoginID = TextBox1.Text


        Dim fetchdata As String
        fetchdata = "Select LoginID, StatusBit, Password from FamilyUser where LoginID='" & LoginID & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()

        If (dr.Read()) Then


            Response.Write("Login Exists")

            'Eamil Script with LoginID and Password



            Dim strFrom = "support@icnadallas.com"
            Dim strTo = LoginID
            Dim MailMsg As New System.Net.Mail.MailMessage(New MailAddress(strFrom.Trim()), New MailAddress(strTo))
            MailMsg.BodyEncoding = Encoding.Default
            MailMsg.Subject = "ICNA account details"
            MailMsg.Body = _
                "Below are your account details<br><br>" & _
                 "<b>LoginID </b>&nbsp;" & _
                dr("LoginID") & _
                "<br><b>Password </b>&nbsp;" & _
                dr("Password") & _
                "<Br><br>Use above credential to login to your acount " & _
                "<a href='http://www.icnadallas.com/login.aspx'>Click Here</a>" & _
                "<br><br>Thank you," & _
                "<br>Management," & _
                "<br>ICNA Dallas"

            MailMsg.Priority = System.Net.Mail.MailPriority.High
            MailMsg.IsBodyHtml = True
            'Smtpclient to send the mail message 

            Dim SmtpMail As New SmtpClient
            Dim basicAuthenticationInfo As New System.Net.NetworkCredential("support@icnadallas.com", "1CN4d4114s")

            SmtpMail.Host = "mail.icnadallas.com"
            SmtpMail.UseDefaultCredentials = False
            SmtpMail.Credentials = basicAuthenticationInfo

            SmtpMail.Send(MailMsg)



            'Email script ends

            Response.Redirect("login.aspx?message=check_email")

        Else



            Response.Redirect("register.aspx?message=register")


        End If



        myConn.Close()
    End Sub
End Class
