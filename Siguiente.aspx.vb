Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Partial Class Siguiente


    Inherits System.Web.UI.Page


    Dim planta As String

    Public Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        planta = Request.QueryString("parametro")

        Label1.Text = planta

    End Sub


   

End Class
