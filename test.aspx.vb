Imports System.Web.Mail
Imports System.Net.Mail

Partial Class test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim LoginID As String
        Randomize()
        ' Generate random value between 1 and 6. 
        Dim rand As Double = CDbl(Int((60000000 * Rnd()) + 1))

        LoginID = "info@hirewebprogrammers.com"

        Dim strFrom = "support@icnadallas.com"
        Dim strTo = "info@hirewebprogrammers.com"
        Dim MailMsg As New System.Net.Mail.MailMessage(New MailAddress(strFrom.Trim()), New MailAddress(strTo))
        MailMsg.BodyEncoding = Encoding.Default
        MailMsg.Subject = "This is a test"
        MailMsg.Body = _
               "Below are your account details<br><br>" & _
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
        label1.Text = "Mail Sent"
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedValue = "1" Then
            RequiredFieldValidator1.Enabled = False
            RequiredFieldValidator2.Enabled = False
        Else
            RequiredFieldValidator1.Enabled = True
            RequiredFieldValidator2.Enabled = True
        End If
    End Sub
End Class
