Imports System.Data.SqlClient

Partial Class VerCode
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim loginID, vcode As String

        loginID = Request("ID")
        vcode = Request("Rand")

        If Request("message") = "inactive" Then

            div1.Visible = False
            div2.Visible = True
        Else
            div2.Visible = False
            div1.Visible = True
        End If

        HiddenField1.Value = loginID

        If Request.QueryString("Rand") <> Nothing Then
            'CODE HERE  
            ' Response.Write("<br>check queryvalue<Br>")
            TextBox2.Text = vcode
        End If
        'Response.Write(loginID)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click




        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim sqlstring, VerificationCode, LoginID, StatusBit As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString

        LoginID = HiddenField1.Value

        VerificationCode = TextBox2.Text
        'Response.Write("Hello" & LoginID & "<br>Vcode" & VerificationCode)


        Dim dr As SqlDataReader


        myConn = New SqlConnection(stringcon)

        myConn.Open()




        Dim fetchdata As String
        fetchdata = "Select LoginID from FamilyUser where LoginID='" & LoginID & "' and LastVerificationCodeSent='" & VerificationCode & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()

        If (dr.Read()) Then


            Response.Write("Login Exists")




            StatusBit = "1"

            myConn = New SqlConnection(stringcon)

            myConn.Open()

            sqlstring = " Update FamilyUser set StatusBit ='" & StatusBit & "' where LoginID='" & LoginID & "'"

            cmd = New SqlCommand(sqlstring, myConn)

            cmd.ExecuteNonQuery()

            myConn.Close()

            Dim mes = "accverified"
            Response.Redirect("login.aspx?message=" & mes)
            div1.Visible = False
            div2.Visible = True

        Else

            div1.Visible = True
            div2.Visible = False

        End If



    End Sub
End Class
