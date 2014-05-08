
Partial Class ymquiz
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("userid") Is Nothing) Then

            divactive2.Visible = False
            divinactive2.Visible = True
        ElseIf (Session("familyid") Is Nothing) Then

            divactive2.Visible = False
            divinactive2.Visible = True
        Else


            divactive2.Visible = True
            divinactive2.Visible = False

        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("ymquiz.aspx?message=not connected")
    End Sub
End Class
