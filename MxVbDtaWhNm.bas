Attribute VB_Name = "MxVbDtaWhNm"
Option Explicit
Option Compare Text
Const CLib$ = "QVb."
Const CNs$ = "Dta"
Const CMod$ = CLib & "MxVbDtaWhNm."
Type WhNm
    Rx As RegExp
    ExlLikAy() As String
    LikAy() As String
    IsEmp As Boolean
End Type

Function EmpWhNm() As WhNm
End Function

Function IsEqWhNm(A As WhNm, B As WhNm) As Boolean
With A
Select Case True
Case _
    ObjPtr(.Rx) <> ObjPtr(.Rx), _
    IsEqAy(.ExlLikAy, B.ExlLikAy), _
    IsEqAy(.LikAy, B.LikAy)
Case Else
    IsEqWhNm = True
End Select
End With
End Function

Function WhNm(WhStr$) As WhNm
Dim P As Dictionary: Set P = Lpm(WhStr, "-Sw Prv Pub Frd Sub Fun Prp Get Set Let WiRet WoRet")
'WhNm = WhNmzP(P, WhNm(NmPfx))
End Function

Function WhNmStr$(A As WhNm)
'If IsEmpWhNm(A) Then ToStr = "#Emp": Exit Function
Dim O$()
'Push O, Quo(X_Re.Pattern, "Patn(*)")
'Push O, Quo(TLn(X_LikAy), "LikAy(*)")
'Push O, Quo(TLn(X_ExlLikAy), "ExlLikAy(*)")
'ToStr = JnCrLf(O)
End Function

Function IsEmpWhNm(A As WhNm) As Boolean
IsEmpWhNm = IsEqWhNm(A, EmpWhNm)
End Function
