Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class Register
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim sqlstring, FName, LName, Address, State, City, Zipcode, Phone, Mobile, LoginID, LoginPassword, StatusBit, DateReg, SquestionID, SquestionName, Sanswer As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString



        Dim dr As SqlDataReader


        myConn = New SqlConnection(stringcon)

        myConn.Open()


        FName = TextBox1.Text
        LName = TextBox2.Text

        Address = TextBox3.Text
        State = TextBox10.Text
        City = TextBox11.Text
        Zipcode = TextBox12.Text

        Phone = TextBox4.Text
        Mobile = TextBox5.Text

        LoginID = TextBox6.Text
        LoginPassword = TextBox7.Text

        SquestionID = DropDownList1.SelectedItem.Value
        SquestionName = DropDownList1.SelectedItem.Text
        Sanswer = TextBox8.Text
        StatusBit = "0"
        DateReg = Now()



        Dim fetchdata As String
        fetchdata = "Select * from FamilyUser where LoginID='" & LoginID & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()

        If (dr.Read()) Then


            Response.Write("Login Exists")
            Response.Redirect("login.aspx?message=member")

        Else


            Randomize()
            ' Generate random value between 1 and 6. 
            Dim rand As Double = CDbl(Int((60000000 * Rnd()) + 1))



            myConn = New SqlConnection(stringcon)

            myConn.Open()

            sqlstring = " INSERT INTO FamilyUser (FNAME, LName, Address, State, City, Zip, Phone, Mobile, LoginID, Password, StatusBit, DateRegistered, LastVerificationCodeSent, QuestionID, AnswerID, QuestionName) VALUES ('" & FName & "','" & LName & "','" & Address & "', '" & State & "', '" & City & "', '" & Zipcode & "', '" & Phone & "','" & Mobile & "','" & LoginID & "','" & LoginPassword & "','" & StatusBit & "','" & DateReg & "','" & rand & "' ,'" & SquestionID & "','" & Sanswer & "','" & SquestionName & "')"

            cmd = New SqlCommand(sqlstring, myConn)

            cmd.ExecuteNonQuery()

            myConn.Close()





            'Eamil Script with LoginID and Password



            Dim strFrom = "support@icnadallas.com"
            Dim strTo = LoginID
            Dim MailMsg As New System.Net.Mail.MailMessage(New MailAddress(strFrom.Trim()), New MailAddress(strTo))
            MailMsg.BodyEncoding = Encoding.Default
            MailMsg.Subject = "Account verification link"
            MailMsg.Body = _
               "Below are your account details<br><br>" & _
                  "LoginID : " & _
                   LoginID & _
                   "<br>Password : " & _
                   LoginPassword & _
                    "<br>Verification Code : " & _
                   rand & _
               "<Br><br>Please click on the verification link below to verify your account " & _
               "<a href='http://www.icnadallas.com/VerCode.aspx?Rand=" & _
               rand & _
               "&ID=" & _
               LoginID & _
               "'>Verify</a>" & _
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


            Dim mes As String
            mes = "inactive"
            'Email script ends
            Response.Redirect("VerCode.aspx?ID=" & LoginID & "&message=" & mes)




        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request("message") = "register" Then
            registeracc.Visible = True

        Else

            registeracc.Visible = False


        End If
    End Sub
End Class
