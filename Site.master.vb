
Partial Class Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("userid") IsNot Nothing And Session("familyid") IsNot Nothing) Then
            divactive.Visible = True
            divinactive.Visible = False

            donationactive.Visible = True
            donationinactive.Visible = False

            topmenu1.Visible = True
            topmenu2.Visible = False

        Else
            divactive.Visible = False
            divinactive.Visible = True

            donationactive.Visible = False
            donationinactive.Visible = True

            topmenu1.Visible = False
            topmenu2.Visible = True

        End If
    End Sub
End Class

