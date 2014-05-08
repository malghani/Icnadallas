Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class login
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request("message") = "member" Then
            alreadymember.Visible = True
            chkemail.Visible = False
            accverified.Visible = False

        ElseIf Request("message") = "check_email" Then
            chkemail.Visible = True
            alreadymember.Visible = False
            accverified.Visible = False


        ElseIf Request("message") = "accverified" Then
            accverified.Visible = True
            alreadymember.Visible = False
            chkemail.Visible = False

        Else
            alreadymember.Visible = False
            chkemail.Visible = False
            accverified.Visible = False


        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim LoginID, LoginPassword, vcode As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString



        Dim dr As SqlDataReader


        myConn = New SqlConnection(stringcon)

        myConn.Open()



        LoginID = TextBox1.Text
        LoginPassword = TextBox2.Text


        Dim fetchdata As String
        fetchdata = "Select LoginID, StatusBit, FamilyID, FName, LName, LastVerificationCodeSent from FamilyUser where LoginID='" & LoginID & "' and Password='" & LoginPassword & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()

        If (dr.Read()) Then


            Response.Write("Login Exists")

            If dr("StatusBit") = "0" Then
                vcode = dr("LastVerificationCodeSent")


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
                   vcode & _
                   "<Br><br>Please click on the verification link below to verify your account " & _
                   "<a href='http://www.icnadallas.com/VerCode.aspx?Rand=" & _
                   vcode & _
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
            Else
                Session("userid") = LoginID
                Session("familyid") = dr("FamilyID")
                Session("fullname") = dr("Fname") & " " & dr("LName")
                Response.Redirect("profile.aspx")
            End If


        End If



        myConn.Close()
    End Sub

End Class
