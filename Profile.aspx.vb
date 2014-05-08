Imports System.Data.SqlClient

Partial Class Profile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If (Session("userid") Is Nothing) Then
            Response.Write("session: <br>" & Session("userid"))
            Response.Redirect("login.aspx?message=Please Login")
        ElseIf (Session("familyid") Is Nothing) Then
            Response.Redirect("login.aspx?message=Please Login")

        End If
        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim LoginID As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString

        Dim dr As SqlDataReader


        myConn = New SqlConnection(stringcon)

        myConn.Open()



        Dim fetchdata As String
        fetchdata = "Select * from FamilyUser where FamilyID='" & Session("familyid") & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()

        If (dr.Read()) Then

            If dr("FName") IsNot DBNull.Value Then
                Label1.Text = dr("FName")
            Else
                Label1.Text = "No Value Specified"
            End If

            If dr("LName") IsNot DBNull.Value Then
                Label2.Text = dr("LName")
            Else
                Label2.Text = "No Value Specified"
            End If

            If dr("Address") IsNot DBNull.Value Then
                Label3.Text = dr("Address")
            Else
                Label3.Text = "No Value Specified"
            End If

            If dr("State") IsNot DBNull.Value Then
                Label11.Text = dr("State")
            Else
                Label11.Text = "No Value Specified"
            End If
            If dr("City") IsNot DBNull.Value Then
                Label12.Text = dr("City")
            Else
                Label12.Text = "No Value Specified"
            End If
            If dr("Zip") IsNot DBNull.Value Then
                Label13.Text = dr("Zip")
            Else
                Label13.Text = "No Value Specified"
            End If

            If dr("Phone") IsNot DBNull.Value Then
                Label4.Text = dr("Phone")
            Else
                Label4.Text = "No Value Specified"
            End If

            If dr("Mobile") IsNot DBNull.Value Then
                Label5.Text = dr("Mobile")
            Else
                Label5.Text = "No Value Specified"
            End If

            'If dr("LoginID") IsNot DBNull.Value Then
            'Label6.Text = dr("LoginID")
            'Else
            '   Label6.Text = "No Value Specified"
            'End If

            'If dr("Password") IsNot DBNull.Value Then
            'Label7.Text = dr("Password")
            'Else
            '   Label7.Text = "No Value Specified"
            'End If

            If dr("QuestionName") IsNot DBNull.Value Then
                Label8.Text = dr("QuestionName")
            Else
                Label8.Text = "No Value Specified"
            End If

            If dr("AnswerID") IsNot DBNull.Value Then
                Label9.Text = dr("AnswerID")
            Else
                Label9.Text = "No Value Specified"
            End If

        End If

        myConn.Close()




        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString



        myConn = New SqlConnection(stringcon)

        myConn.Open()





        fetchdata = "Select MemberID from FamilyMember where FamilyID='" & Session("familyid") & "'"
        cmd = New SqlCommand(fetchdata, myConn)
        dr = cmd.ExecuteReader()
        If (dr.Read()) Then
            
            divt.Visible = True
            divt2.Visible = False
        Else
            divt.Visible = False
            divt2.Visible = True
            Label10.Text = "No Family Member Registered"

        End If


        If Request("message") = "familymember" Then
            family.visible = True
        Else
            family.visible = False
        End If

        myConn.Close()

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click


        Dim myConn As SqlConnection
        Dim cmd As SqlCommand
        Dim sqlstring, FName, LName, Adult, Age, GradeID, SchoolID, OtherSchoolName, GradeName, SchoolName As String


        Dim stringcon As String
        stringcon = ConfigurationManager.ConnectionStrings("SQLDbConnection").ConnectionString


        myConn = New SqlConnection(stringcon)

        myConn.Open()


        FName = TextBox1.Text
        LName = TextBox2.Text


        If DropDownList3.SelectedItem.Value IsNot "" Then
            Adult = DropDownList3.SelectedItem.Value


        End If

        Dim Gender As String

        If (DropDownList4.SelectedValue = "Male") Then
            Gender = "Male"
        Else

            Gender = "Female"
        End If

        If Adult = "1" Then
            Age = "NA"
            SchoolID = "NA"
            SchoolName = "NA"

            OtherSchoolName = "NA"


            GradeID = "NA"
            GradeName = "NA"


        Else

            Age = TextBox3.Text


            If DropDownList1.SelectedItem.Value IsNot "0" Then
                SchoolID = DropDownList1.SelectedItem.Value
                SchoolName = DropDownList1.SelectedItem.Text
            Else
                OtherSchoolName = TextBox4.Text
            End If

            If DropDownList2.SelectedItem.Value IsNot "0" Then
                GradeID = DropDownList2.SelectedItem.Value
                GradeName = DropDownList2.SelectedItem.Text

            End If

        End If

        sqlstring = " INSERT INTO FamilyMember (FamilyID, FName, LName, Adult, Age, GradeID, SchoolID, OtherSchoolName, GradeName, SchoolName, Gender) VALUES ('" & Session("familyid") & "','" & FName & "','" & LName & "', '" & Adult & "', '" & Age & "','" & GradeID & "','" & SchoolID & "','" & OtherSchoolName & "','" & GradeName & "','" & SchoolName & "' ,'" & gender & "')"

        cmd = New SqlCommand(sqlstring, myConn)

        cmd.ExecuteNonQuery()

        myConn.Close()

        Response.Redirect("profile.aspx?message=familymember")

    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList3.SelectedIndexChanged
        If DropDownList3.SelectedValue = "1" Then
            RequiredFieldValidator3.Enabled = False
            'RequiredFieldValidator2.Enabled = False
            divactive.visible = False

        Else
            RequiredFieldValidator3.Enabled = True
            'RequiredFieldValidator2.Enabled = True
            divactive.visible = True

        End If
    End Sub

End Class
