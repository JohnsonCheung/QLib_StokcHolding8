Attribute VB_Name = "MxVbFsFt"
Option Compare Text
Option Explicit
Const CLib$ = "QVb."
Const CMod$ = CLib & "MxVbFsFt."
Const CNs$ = "Fs"
Const C_BlkSi% = 8192
Type XXX
    A() As Byte
    B() As String
End Type
Public XXX1 As XXX
Sub DmpFt(Ft)
D LineszFt(Ft)
End Sub

Function EnsFt(Ft, Optional S$) As Boolean
'Ret : :B ! Ensure @Ft has value of @S.  Ret true if changed.  @@
Dim XHas As Boolean: XHas = HasFfn(Ft)
Dim XWrt As Boolean: If XHas Then XWrt = Not IsEqFfnStr(Ft, S) Else XWrt = True
'----
Dim Msg$
    Dim L As String * 10: RSet L = Len(S)
    Dim M$: M = "S-Len=" & L & " Ft=" & Ft
    Select Case True
    Case Not XHas: Msg = "EnsFt: Ft not exist, S is written.  " & M
    Case XWrt:     Msg = "EnsFt: Ft exist and dif from S. S is written.  " & M
    Case Else:     Msg = "EnsFt: Ft exist and sam as S.  Ft is no change.  " & M
    End Select
'----
Debug.Print Msg
If XWrt Then WrtStr S, Ft
EnsFt = XWrt
End Function

Function FstNBlk$(Fno%, N&)
If N <= 0 Then Exit Function
Dim O$(): ReDim O(N - 1)
Dim A As String * C_BlkSi, J&: For J = 1 To N
    Get #Fno, J, A
    PushI O, A
Next
FstNBlk = Join(O, "")
End Function

Function LasBlk$(Fno%, NCmplBlk&, LasBlkSi%)
If LasBlkSi = 0 Then Exit Function
Dim A As String * C_BlkSi: Get #Fno, NCmplBlk + 1, A
LasBlk = Left(A, LasBlkSi)
End Function

Function LasBlkSi%(Si&)
LasBlkSi = Si - ((NBlk(Si, C_BlkSi) - 1) * C_BlkSi)
End Function

Function LineszFt$(Ft)
With Fso.GetFile(Ft)
    If .Size = 0 Then Exit Function
    LineszFt = .OpenAsTextStream.ReadAll
End With
End Function

Private Sub FstNChrzFfn__Tst()
MsgBox FstNChrzFfn(MB52LasIFx, 3)
End Sub

Function FstNChrzFfn$(Ffn, N&)
Dim L&: L = FileLen(Ffn): If N > L Then Thw CSub, "@Ft does not have N-Chr", "Ffn N", Ffn, N
Dim F%: F = FnoBin(Ffn)
FstNChrzFfn = String(N, " ")
Get #F, , FstNChrzFfn
Close #F
End Function

Function LyzFt(Ft) As String()
LyzFt = SplitCrLf(LineszFt(Ft))
End Function

Sub CrtFfn(Ffn)
'Do : Crt-Empty-Ffn
Close #FnoO(Ffn)
End Sub
