Public Sub example()
    Dim table As Variant
    Dim element As Variant

    table = Array("word1", "word2")

    For Each element In table
        do_something (element)
    Next element
End Sub

Sub do_something(ByVal e As String)
    Debug.Print (Chr(34) + e + Chr(34) + ": {" + vbCrLf  _
                    + Chr(34) + "prefix" + Chr(34) + ": " + Chr(34) + "$" + e + Chr(34) + "," + vbCrLf 
                    + Chr(34) + "body" + Chr(34) + ": " + Chr(34) + e + Chr(34) + "," + vbCrLf 
    })
End Sub