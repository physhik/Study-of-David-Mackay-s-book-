(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.1' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     58871,       1433]
NotebookOptionsPosition[     56682,       1329]
NotebookOutlinePosition[     57268,       1354]
CellTagsIndexPosition[     57225,       1351]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Some setting", "Chapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Data ", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"xn", "=", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{"-", "27.02"}], ",", "3.57", ",", "8.191", ",", "9.898", ",", 
    "9.603", ",", "9.945", ",", "10.056"}], "}"}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "27.02`"}], ",", "3.57`", ",", "8.191`", ",", "9.898`", ",", 
   "9.603`", ",", "9.945`", ",", "10.056`"}], "}"}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Sample mean", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Mean", "[", "xn", "]"}], " "}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData["3.4632857142857145`"], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Normalizing constant", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubsuperscriptBox["\[Integral]", 
   RowBox[{"-", "\[Infinity]"}], "\[Infinity]"], 
  RowBox[{
   RowBox[{"Exp", "[", 
    FractionBox[
     RowBox[{
      RowBox[{"-", "N"}], 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"\[Mu]", "-", "x"}], ")"}], "2"]}], 
     RowBox[{"2", 
      SuperscriptBox["\[Sigma]", "2"]}]], "]"}], 
   RowBox[{"\[DifferentialD]", "\[Mu]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"ConditionalExpression", "[", 
  RowBox[{
   FractionBox[
    SqrtBox[
     RowBox[{"2", " ", "\[Pi]"}]], 
    SqrtBox[
     FractionBox["N", 
      SuperscriptBox["\[Sigma]", "2"]]]], ",", 
   RowBox[{
    RowBox[{"Re", "[", 
     FractionBox["N", 
      SuperscriptBox["\[Sigma]", "2"]], "]"}], "\[GreaterEqual]", "0"}]}], 
  "]"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Posterior distribution function w.o. normalizing constant", "Chapter", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  SubsuperscriptBox["\[Integral]", "0", "\[Infinity]"], 
  RowBox[{
   SuperscriptBox["\[Sigma]", "c"], 
   RowBox[{"Exp", "[", 
    RowBox[{
     FractionBox[
      RowBox[{"-", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}], 
      RowBox[{"2", 
       SuperscriptBox["\[Sigma]", "2"]}]], "-", 
     FractionBox["\[Sigma]", "s"]}], "]"}], 
   RowBox[{"\[DifferentialD]", "\[Sigma]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"ConditionalExpression", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"11.976796597153522`", " ", 
      RowBox[{"HypergeometricPFQ", "[", 
       RowBox[{
        RowBox[{"{", "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "0.050000000000000044`"}], ",", 
          "0.44999999999999996`"}], "}"}], ",", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "800"]}], " ", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], "-", 
     FractionBox[
      RowBox[{"1.2220697972757049`", " ", 
       RowBox[{"HypergeometricPFQ", "[", 
        RowBox[{
         RowBox[{"{", "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1.55`", ",", "0.5`"}], "}"}], ",", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "800"]}], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
      SuperscriptBox[
       RowBox[{"(", 
        FractionBox["1", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]], ")"}], "0.55`"]], "-", 
     FractionBox[
      RowBox[{"0.47443725266903375`", " ", 
       RowBox[{"HypergeometricPFQ", "[", 
        RowBox[{
         RowBox[{"{", "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"2.05`", ",", "1.4999999999999998`"}], "}"}], ",", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["1", "800"]}], " ", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
      SuperscriptBox[
       RowBox[{"(", 
        FractionBox["1", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]], ")"}], "1.05`"]]}], ",", 
    RowBox[{
     RowBox[{"Re", "[", 
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"], "]"}], ">", "0"}]}], "]"}], 
  "/.", 
  RowBox[{"x", "\[Rule]", "10"}]}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"ConditionalExpression", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"11.976796597153522`", " ", 
     RowBox[{"HypergeometricPFQ", "[", 
      RowBox[{
       RowBox[{"{", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "0.050000000000000044`"}], ",", 
         "0.44999999999999996`"}], "}"}], ",", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["1", "800"]}], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], "-", 
    FractionBox[
     RowBox[{"1.2220697972757049`", " ", 
      RowBox[{"HypergeometricPFQ", "[", 
       RowBox[{
        RowBox[{"{", "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"1.55`", ",", "0.5`"}], "}"}], ",", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "800"]}], " ", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
     SuperscriptBox[
      RowBox[{"(", 
       FractionBox["1", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"]], ")"}], "0.55`"]], "-", 
    FractionBox[
     RowBox[{"0.47443725266903375`", " ", 
      RowBox[{"HypergeometricPFQ", "[", 
       RowBox[{
        RowBox[{"{", "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"2.05`", ",", "1.4999999999999998`"}], "}"}], ",", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["1", "800"]}], " ", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
     SuperscriptBox[
      RowBox[{"(", 
       FractionBox["1", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"]], ")"}], "1.05`"]]}], ",", 
   RowBox[{
    RowBox[{"Re", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"10", "-", "\[Mu]"}], ")"}], "2"], "]"}], ">", "0"}]}], 
  "]"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"Assuming", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"Re", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"], "]"}], ">", "0"}], ",", 
   RowBox[{
    SubsuperscriptBox["\[Integral]", "0", "\[Infinity]"], 
    RowBox[{
     SuperscriptBox["\[Sigma]", "0.1"], " ", 
     RowBox[{"Exp", "[", 
      RowBox[{"-", 
       FractionBox[
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"], 
        RowBox[{"2", 
         SuperscriptBox["\[Sigma]", "2"]}]]}], "]"}], 
     RowBox[{"Exp", "[", 
      RowBox[{"-", 
       FractionBox["\[Sigma]", "10"]}], "]"}], 
     RowBox[{"\[DifferentialD]", "\[Sigma]"}]}]}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Define function for posterior distribution of one data", "Subchapter", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"Clear", "[", "plot", "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"plot", "[", "x_", "]"}], ":=", 
  RowBox[{
   RowBox[{"11.976796597153522`", " ", 
    RowBox[{"HypergeometricPFQ", "[", 
     RowBox[{
      RowBox[{"{", "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "0.050000000000000044`"}], ",", "0.44999999999999996`"}],
        "}"}], ",", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["1", "800"]}], " ", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], "-", 
   FractionBox[
    RowBox[{"1.2220697972757049`", " ", 
     RowBox[{"HypergeometricPFQ", "[", 
      RowBox[{
       RowBox[{"{", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1.55`", ",", "0.5`"}], "}"}], ",", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["1", "800"]}], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      FractionBox["1", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]], ")"}], "0.55`"]], "-", 
   FractionBox[
    RowBox[{"0.47443725266903375`", " ", 
     RowBox[{"HypergeometricPFQ", "[", 
      RowBox[{
       RowBox[{"{", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2.05`", ",", "1.4999999999999998`"}], "}"}], ",", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["1", "800"]}], " ", 
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]}]}], "]"}]}], 
    SuperscriptBox[
     RowBox[{"(", 
      FractionBox["1", 
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"]], ")"}], 
     "1.05`"]]}]}]], "Input", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"HypergeometricPFQ", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "0.050000000000000044`"}], ",", "0.44999999999999996`"}], 
    "}"}], ",", 
   RowBox[{
    RowBox[{"-", 
     FractionBox["1", "800"]}], " ", 
    SuperscriptBox[
     RowBox[{"(", "0.1", ")"}], "2"]}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData["1.0005555530348882`"], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Integral]", 
  RowBox[{
   SuperscriptBox["\[Sigma]", "0.1"], " ", 
   RowBox[{"Exp", "[", 
    RowBox[{"-", 
     FractionBox[
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"], 
      RowBox[{"2", 
       SuperscriptBox["\[Sigma]", "2"]}]]}], "]"}], 
   RowBox[{"Exp", "[", 
    FractionBox["\[Sigma]", "10"], "]"}], 
   RowBox[{"\[DifferentialD]", "\[Sigma]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"\[Integral]", 
  RowBox[{
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", 
       FractionBox[
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{"x", "-", "\[Mu]"}], ")"}], "2"], 
        RowBox[{"2", " ", 
         SuperscriptBox["\[Sigma]", "2"]}]]}], "+", 
      FractionBox["\[Sigma]", "10"]}]], " ", 
    SuperscriptBox["\[Sigma]", "0.1`"]}], 
   RowBox[{"\[DifferentialD]", "\[Sigma]"}]}]}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"\[Integral]", 
  RowBox[{
   SuperscriptBox["\[Sigma]", "0.1"], " ", 
   RowBox[{"Exp", "[", "\[Sigma]", "]"}], 
   RowBox[{"\[DifferentialD]", "\[Sigma]"}]}]}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{"1.`", " ", 
    SuperscriptBox["\[Sigma]", "1.1`"], " ", 
    RowBox[{"Gamma", "[", 
     RowBox[{"1.1`", ",", 
      RowBox[{
       RowBox[{"-", "1.`"}], " ", "\[Sigma]"}]}], "]"}]}], 
   SuperscriptBox[
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "1.`"}], " ", "\[Sigma]"}], ")"}], "1.1`"]]}]], "Output", \
"PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Plot", "Chapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["Parameters", "Subchapter", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"Clear", "[", 
  RowBox[{"x", ",", "\[Mu]"}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"s", "=", "10"}], ";", 
  RowBox[{"c", "=", "0.1"}], ";", 
  RowBox[{"x", "=", "12.1"}], ";", 
  RowBox[{"\[Mu]", "=", "10"}], ";"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[""], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Posterior P(\[Mu]|x) for one datum from Xn = -10", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"plot", "[", "10", "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Mu]", ",", 
     RowBox[{"-", "10"}], ",", "15"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1:eJwllX001Ikax8dkEkLeRvLym5nfb+Zn5Cetkq4031aLpPfVC201WSJ5iV7c
MGZdbZ1WrVO3iVWorOqkhIpS+VGLq3Zi10ubESrWqJWYSrG5c8/94znPH9/P
83aec55HuD1+bQSXw+Ek6e1/frO8d2hykmQ566h5wrk8WD3cMmI1QbLK5IJO
tScPjfM078Rjel0VOJDqxYPntI6J5cMkC5Ndc5/68GBS+sgkp0fPP3+VmevP
w62JSolHrZ4PScXszTzwc45t2Zah182tD+cd4qFF7aNmDUmWTcvYUNHNww/N
MuVWnZDl3LUuiC2ainzj6Sam7wUsYuV2yeFGKNN8p9jxkWA5OlI4Lp6Ga+rF
x/ZonFiOke39RANjyOdkrch74cAql51+8VO7MU5XuZWnsfYsZ96VTXSDCSS5
+bGhF+xYpWdyy/67ppAPFD5ZXW7LsunfB9wvmQ7JtvcD3BPWrNLli/tzqs1w
xl9zUX3KkmVTJ0YT68xRP41Ol66wYNnYEHruYwtEtvl8cOObsj2uoedK0mcg
On23Opw2Yj3Gr6c0WVtCeWDFsOVLLovAu3bKakvEBOakR0f/XZNQtbH/4Q4r
5K/v0NjmvatJKJ4Mu2FhjWGz+nx5wGBNQnwl3NTWCG+s5TSNtNYcHn3xwPew
Dd4blvyq/alJ5q2+JNsTZgtPtxIPo/1/yqZl2J4SzedDPXzd2+/EqKy5LBhc
EzuESRv8bGwmZDlXw47NmbBD9u/LA2VcLqpm2Vlc0c5EW7hlbXo/D5vp4zXd
XfaYet7jTSBhgpdpoZe362ah1XDOvWcW5ph4pqgY4jmi4YjfWYWrJaJ+WT36
zWIntPnkZ1n7WYNLTP+8N8MZcxVRjccW2KL94nXzpFoCU3K6t6xcbwf17va4
zFMCkH71X+lW2+NpUP0Np2AhdKrOtoIlDmBDHLVLjETwqTvD/rjZCXyHvL3H
n4nQong8HrGOwBFf7+UDFSTijDsCcVsA82Y29MklCg6On6vZKiGWW375QpIv
huBfd6YsLReBP6/P7UCeBDHt2bmKmyKEprS+7CmQ4KY0Ys6t2yLsZGqjA4sk
CG42C3O/LwJjkt1sf0WCZKet5TNbRVi9e3H9L/ckaK40kP/1ToTYuSPZsucS
KF/731MtJGErHnI9LaXxUObwdYsviaM6mc7GnQb/xBut6ZckDmr4A0e/oFGy
MMf2uyAS5FcfJEofGk++1+6KCSMRYl9Z/+0KGh7CLAekkRhwKVsu2k2jN6Ql
WcuS+PZ3q9cPKmmsPOzf2fmABNc99efH1TTu3K72VTeSkLw/cqy9hkYOUcyt
aCbhPf8V09Gg57UHslJ7SDyKSvz38Q497zA8FPeShOPX6+/GdtKQroxYIx8g
cYiIClncTcOwYhXff5hEx4GthTf7aST2PUj21pF4FaIy3TBIo8fuH52uYyQ6
r0qh+UufP6jU12mCxLm8KRsXvKVRnUoVWnAoRL5WjfB1NFxKc7lcQwoDre+u
Oel1Va95hM6IguE3SX2sPj7R/6P0DwsKdXHF2bn6ei4z1BXnCAopJUf7kvT9
njy/v2G+jELZoqOaIv383PbXUhc/CuKbyadUFTQSpm3PmhVAIePMBq+DpTSC
Y4PXTK6kgH0nFode0PMLhJ2NWygstWVatCoa8U1NQ2EKCgr3RPH9vTSWvXXi
Z9yl8M838pSpnjQi0wIN/lNLIZM6mazU7y/DOOm1RT0FImVD4Sf9fu8IG+vO
qCksHA5VvRHQcF+bGH+rmwKv28uqy5yGVUV947CBGEVO2qpHgxI83ROfstVf
jFoNwaPOS7BrjO1Z9FgMl2XDijC+BH+uG0//1CnBRoMFxQVmYhgnxwZcbtfP
tfNHvqOYQr+R1yJFvwtSxy82G3mT2LnNa9PSl1Jk/dDk07ZDhAAzdZBZlysu
sElSxwtCdIvvRI8NzsbM+MtZjb0COBs9v9be7wbnAPXPGk8BDhk+DfF55Yby
E8EBWg8Bhg1++1Twxg02bavy3zMC1E3ULo0ec4ND4WiMtYsAkSNnn4wbM2AI
h/QQRwGudsk5QoaB+6+nVo8bCuB7vXdVTBKDXR1BU3OuECgu+0P3eD8D7qKo
B10XCJiXtuTOS2XQbNX5jDpHoOdS7Yu/MxnYOI9JKlUEMgvO7s9WMRgZzfvw
Kp3AoyPyghu3GLSuOL5AtZbA/MObls66x2Dq7OcH3wYTyD+4RquoY1AceUC6
MoBAgnKJZ+BDBqLMhjjTRQRs9gkbnmoYePdX9p0UE0hLst8l62WgGnT7bZwg
0J9gaVnUx+Diln0zwmcRqIoxCIsdYhDk26ycb0FAGP1xsmWEwT0dr7zQWH9n
It8WeX1gEHcj1NPMkMBouHZZ3jiDfflyw5TPzvj/f2TAmbxCDY4547/k9x5I

     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 2.5},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{-10, 15}, {2.6489891122422478`, 11.976737576411505`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Posterior P(\[Mu]|x) for one datum from Xn = -27", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{"plot", "[", 
    RowBox[{"-", "27"}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Mu]", ",", 
     RowBox[{"-", "30"}], ",", "5"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
uiF41bpIKfM/q2qLxw==
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{-30, 5}, {0., 11.972838681407259`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Posterior P(\[Mu]|x) for all 7 data", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"plot", "[", 
     RowBox[{"-", "27"}], "]"}], 
    RowBox[{"plot", "[", "3.6", "]"}], 
    RowBox[{"plot", "[", "8.2", "]"}], 
    RowBox[{"plot", "[", "9.8", "]"}], 
    RowBox[{"plot", "[", "9.6", "]"}], 
    RowBox[{"plot", "[", "9.95", "]"}], 
    RowBox[{"plot", "[", "10.05", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Mu]", ",", 
     RowBox[{"-", "10"}], ",", "20"}], "}"}]}], "]"}]], "Input", \
"PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
0A==
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{-10, 20}, {0., 1.3983346274678214`*^6}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{"%67", ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"HoldForm", "[", "\[Mu]", "]"}], ",", 
      RowBox[{"HoldForm", "[", "P", "]"}]}], "}"}]}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "None"}], ",", 
   RowBox[{"LabelStyle", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"GrayLevel", "[", "0", "]"}], "}"}]}]}], "]"}]], "Input", \
"PluginEmbeddedContent",
 NumberMarks->False],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
0A==
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox[
     TagBox["\[Mu]", HoldForm], TraditionalForm], 
    FormBox[
     TagBox["P", HoldForm], TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  LabelStyle->{
    GrayLevel[0]},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotLabel->None,
  PlotRange->{{-10, 20}, {0., 1.3983346274678214`*^6}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["check a small bump around \[Mu]=-27", "Subchapter", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Plot", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"plot", "[", 
     RowBox[{"-", "27"}], "]"}], 
    RowBox[{"plot", "[", "3.6", "]"}], 
    RowBox[{"plot", "[", "8.2", "]"}], 
    RowBox[{"plot", "[", "9.8", "]"}], 
    RowBox[{"plot", "[", "9.6", "]"}], 
    RowBox[{"plot", "[", "9.95", "]"}], 
    RowBox[{"plot", "[", "10.05", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Mu]", ",", 
     RowBox[{"-", "30"}], ",", 
     RowBox[{"-", "20"}]}], "}"}]}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{-30., 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotRange->{{-30, -20}, {0., 97.37780269497291}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Show", "[", 
  RowBox[{"%64", ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"HoldForm", "[", "\[Mu]", "]"}], ",", 
      RowBox[{"HoldForm", "[", "P", "]"}]}], "}"}]}], ",", 
   RowBox[{"PlotLabel", "\[Rule]", "None"}], ",", 
   RowBox[{"LabelStyle", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"GrayLevel", "[", "0", "]"}], "}"}]}]}], "]"}]], "Input", \
"PluginEmbeddedContent",
 NumberMarks->False],

Cell[BoxData[
 GraphicsBox[{{}, {}, 
   {RGBColor[0.368417, 0.506779, 0.709798], AbsoluteThickness[1.6], Opacity[
    1.], LineBox[CompressedData["
1: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
     "]]}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox[
     TagBox["\[Mu]", HoldForm], TraditionalForm], 
    FormBox[
     TagBox["P", HoldForm], TraditionalForm]},
  AxesOrigin->{-30., 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  LabelStyle->{
    GrayLevel[0]},
  Method->{
   "DefaultBoundaryStyle" -> Automatic, "DefaultMeshStyle" -> 
    AbsolutePointSize[6], "ScalingFunctions" -> None},
  PlotLabel->None,
  PlotRange->{{-30, -20}, {0., 97.37780269497291}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{795.0333333333333, 2917.},
Visible->True,
AuthoredSize->{795, 2917},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
PrintingCopies->1,
PrintingPageRange->{1, Automatic},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"10.1 for Mac OS X x86 (32-bit, 64-bit Kernel) (March 23, \
2015)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 56, 0, 40, "Chapter"],
Cell[CellGroupData[{
Cell[1567, 39, 52, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[1644, 43, 227, 6, 13, "Input"],
Cell[1874, 51, 208, 5, 13, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[2131, 62, 58, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[2214, 66, 101, 2, 13, "Input"],
Cell[2318, 70, 71, 0, 13, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[2438, 76, 67, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[2530, 80, 450, 15, 37, "Input"],
Cell[2983, 97, 393, 13, 65, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[3437, 117, 101, 0, 40, "Chapter"],
Cell[3541, 119, 502, 16, 37, "Input"],
Cell[CellGroupData[{
Cell[4068, 139, 2097, 63, 224, "Input"],
Cell[6168, 204, 1991, 61, 162, "Output"]
}, Open  ]],
Cell[8174, 268, 766, 24, 37, "Input"],
Cell[CellGroupData[{
Cell[8965, 296, 101, 0, 34, "Subchapter"],
Cell[9069, 298, 86, 1, 13, "Input"],
Cell[9158, 301, 1777, 56, 181, "Input"],
Cell[CellGroupData[{
Cell[10960, 361, 387, 13, 34, "Input"],
Cell[11350, 376, 71, 0, 13, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11458, 381, 473, 15, 37, "Input"],
Cell[11934, 398, 510, 16, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12481, 419, 222, 6, 32, "Input"],
Cell[12706, 427, 397, 13, 38, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[13164, 447, 48, 0, 40, "Chapter"],
Cell[CellGroupData[{
Cell[13237, 451, 57, 0, 34, "Subchapter"],
Cell[13297, 453, 110, 2, 13, "Input"],
Cell[13410, 457, 202, 5, 13, "Input"],
Cell[13615, 464, 51, 0, 13, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13703, 469, 95, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[13823, 473, 226, 7, 13, "Input"],
Cell[14052, 482, 3401, 67, 230, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[17502, 555, 95, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[17622, 559, 245, 8, 13, "Input"],
Cell[17870, 569, 3523, 69, 227, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21442, 644, 82, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[21549, 648, 505, 15, 13, "Input"],
Cell[22057, 665, 13027, 225, 227, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35121, 895, 465, 13, 13, "Input"],
Cell[35589, 910, 13193, 232, 238, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[48831, 1148, 82, 0, 34, "Subchapter"],
Cell[CellGroupData[{
Cell[48938, 1152, 524, 15, 13, "Input"],
Cell[49465, 1169, 3253, 64, 220, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52755, 1238, 465, 13, 13, "Input"],
Cell[53223, 1253, 3419, 71, 231, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature JuT4qoJx7bC10DgUe8cA5rR6 *)
