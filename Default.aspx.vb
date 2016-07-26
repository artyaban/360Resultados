
Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Button1_Click1(sender As Object, e As EventArgs)
        Dim var As String
        var = DropDownList1.Text
        Response.Redirect("Siguiente.aspx?parametro=" + DropDownList1.Text)

    End Sub
End Class
