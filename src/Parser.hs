{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,290) ([0,0,0,8,0,0,0,128,0,0,0,0,0,0,0,0,1,0,0,0,0,0,16,0,0,0,512,0,0,0,16384,0,0,0,0,0,0,0,0,128,0,1637,4,2048,0,0,0,0,0,25856,1030,0,0,0,0,0,16,0,0,0,256,0,0,0,0,0,0,1024,0,0,0,16384,0,16,0,0,0,256,0,0,0,0,32516,0,0,0,1,34816,49153,7,512,0,0,0,8192,0,0,0,4096,0,6272,31744,0,1,34816,49153,7,16,32768,24,124,256,0,392,1984,4096,0,6272,31744,0,2,0,0,0,16,32768,24,124,4096,0,0,0,0,1,0,0,0,1,34816,49153,7,16,32768,24,124,0,0,0,0,0,0,0,0,0,2,0,0,0,0,24576,0,0,0,63488,1,0,0,0,0,0,0,384,0,0,0,57344,0,0,0,0,0,0,0,4096,0,6272,31744,0,1,34816,49153,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,63488,3,0,0,32768,63,8192,0,0,0,0,32,0,0,0,512,0,0,0,8192,0,0,0,0,2,0,0,0,32,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,1024,0,0,0,0,0,0,0,0,2,0,0,0,16,0,24,124,256,0,384,1984,4096,0,6144,31744,0,1,32768,49153,7,16,0,24,124,256,0,392,1984,4096,0,6272,31744,0,1,34816,49153,7,16,32768,24,124,256,0,392,1984,4096,0,6272,31744,0,1,34816,49153,7,16,32768,24,124,1024,0,0,0,0,0,512,0,0,0,504,0,0,0,8064,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3584,0,0,0,57344,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,6272,31744,0,1,34816,49153,7,0,0,0,0,8192,0,0,0,0,2,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","MainFunction","Block","Statements","Statement","Exp","LogicalExp","ComparisonExp","NotExp","AddSubExp","MultDivExp","Unit","Type","'('","')'","'{'","'}'","':'","';'","'='","'+'","'-'","'*'","'/'","'%'","'++'","'--'","'+='","'-='","'*='","'/='","'%='","'<'","'>'","'<='","'>='","'=='","'!='","'&&'","'||'","'!'","if","else","while","true","false","val","var","fun","main","print","readln","int","long","float","double","boolean","char","string","id","num","real","letter","sentence","%eof"]
        bit_start = st Prelude.* 68
        bit_end = (st Prelude.+ 1) Prelude.* 68
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..67]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (52) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (52) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (53) = happyShift action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (68) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (18) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (19) = happyShift action_9
action_7 (6) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_2

action_9 (20) = happyShift action_12
action_9 (45) = happyShift action_13
action_9 (47) = happyShift action_14
action_9 (50) = happyShift action_15
action_9 (51) = happyShift action_16
action_9 (54) = happyShift action_17
action_9 (55) = happyShift action_18
action_9 (63) = happyShift action_19
action_9 (7) = happyGoto action_10
action_9 (8) = happyGoto action_11
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (20) = happyShift action_35
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (45) = happyShift action_13
action_11 (47) = happyShift action_14
action_11 (50) = happyShift action_15
action_11 (51) = happyShift action_16
action_11 (54) = happyShift action_17
action_11 (55) = happyShift action_18
action_11 (63) = happyShift action_19
action_11 (7) = happyGoto action_34
action_11 (8) = happyGoto action_11
action_11 _ = happyReduce_6

action_12 _ = happyReduce_4

action_13 (17) = happyShift action_33
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_32
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (63) = happyShift action_31
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (63) = happyShift action_30
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (17) = happyShift action_28
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_20
action_19 (29) = happyShift action_21
action_19 (30) = happyShift action_22
action_19 (31) = happyShift action_23
action_19 (32) = happyShift action_24
action_19 (33) = happyShift action_25
action_19 (34) = happyShift action_26
action_19 (35) = happyShift action_27
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_43
action_20 (44) = happyShift action_44
action_20 (48) = happyShift action_45
action_20 (49) = happyShift action_46
action_20 (63) = happyShift action_47
action_20 (64) = happyShift action_48
action_20 (65) = happyShift action_49
action_20 (66) = happyShift action_50
action_20 (67) = happyShift action_51
action_20 (9) = happyGoto action_64
action_20 (10) = happyGoto action_37
action_20 (11) = happyGoto action_38
action_20 (12) = happyGoto action_39
action_20 (13) = happyGoto action_40
action_20 (14) = happyGoto action_41
action_20 (15) = happyGoto action_42
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (22) = happyShift action_63
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_62
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (17) = happyShift action_43
action_23 (44) = happyShift action_44
action_23 (48) = happyShift action_45
action_23 (49) = happyShift action_46
action_23 (63) = happyShift action_47
action_23 (64) = happyShift action_48
action_23 (65) = happyShift action_49
action_23 (66) = happyShift action_50
action_23 (67) = happyShift action_51
action_23 (9) = happyGoto action_61
action_23 (10) = happyGoto action_37
action_23 (11) = happyGoto action_38
action_23 (12) = happyGoto action_39
action_23 (13) = happyGoto action_40
action_23 (14) = happyGoto action_41
action_23 (15) = happyGoto action_42
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (17) = happyShift action_43
action_24 (44) = happyShift action_44
action_24 (48) = happyShift action_45
action_24 (49) = happyShift action_46
action_24 (63) = happyShift action_47
action_24 (64) = happyShift action_48
action_24 (65) = happyShift action_49
action_24 (66) = happyShift action_50
action_24 (67) = happyShift action_51
action_24 (9) = happyGoto action_60
action_24 (10) = happyGoto action_37
action_24 (11) = happyGoto action_38
action_24 (12) = happyGoto action_39
action_24 (13) = happyGoto action_40
action_24 (14) = happyGoto action_41
action_24 (15) = happyGoto action_42
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (17) = happyShift action_43
action_25 (44) = happyShift action_44
action_25 (48) = happyShift action_45
action_25 (49) = happyShift action_46
action_25 (63) = happyShift action_47
action_25 (64) = happyShift action_48
action_25 (65) = happyShift action_49
action_25 (66) = happyShift action_50
action_25 (67) = happyShift action_51
action_25 (9) = happyGoto action_59
action_25 (10) = happyGoto action_37
action_25 (11) = happyGoto action_38
action_25 (12) = happyGoto action_39
action_25 (13) = happyGoto action_40
action_25 (14) = happyGoto action_41
action_25 (15) = happyGoto action_42
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_43
action_26 (44) = happyShift action_44
action_26 (48) = happyShift action_45
action_26 (49) = happyShift action_46
action_26 (63) = happyShift action_47
action_26 (64) = happyShift action_48
action_26 (65) = happyShift action_49
action_26 (66) = happyShift action_50
action_26 (67) = happyShift action_51
action_26 (9) = happyGoto action_58
action_26 (10) = happyGoto action_37
action_26 (11) = happyGoto action_38
action_26 (12) = happyGoto action_39
action_26 (13) = happyGoto action_40
action_26 (14) = happyGoto action_41
action_26 (15) = happyGoto action_42
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (17) = happyShift action_43
action_27 (44) = happyShift action_44
action_27 (48) = happyShift action_45
action_27 (49) = happyShift action_46
action_27 (63) = happyShift action_47
action_27 (64) = happyShift action_48
action_27 (65) = happyShift action_49
action_27 (66) = happyShift action_50
action_27 (67) = happyShift action_51
action_27 (9) = happyGoto action_57
action_27 (10) = happyGoto action_37
action_27 (11) = happyGoto action_38
action_27 (12) = happyGoto action_39
action_27 (13) = happyGoto action_40
action_27 (14) = happyGoto action_41
action_27 (15) = happyGoto action_42
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (18) = happyShift action_56
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_43
action_29 (44) = happyShift action_44
action_29 (48) = happyShift action_45
action_29 (49) = happyShift action_46
action_29 (63) = happyShift action_47
action_29 (64) = happyShift action_48
action_29 (65) = happyShift action_49
action_29 (66) = happyShift action_50
action_29 (67) = happyShift action_51
action_29 (9) = happyGoto action_55
action_29 (10) = happyGoto action_37
action_29 (11) = happyGoto action_38
action_29 (12) = happyGoto action_39
action_29 (13) = happyGoto action_40
action_29 (14) = happyGoto action_41
action_29 (15) = happyGoto action_42
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (21) = happyShift action_54
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (21) = happyShift action_53
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (17) = happyShift action_43
action_32 (44) = happyShift action_44
action_32 (48) = happyShift action_45
action_32 (49) = happyShift action_46
action_32 (63) = happyShift action_47
action_32 (64) = happyShift action_48
action_32 (65) = happyShift action_49
action_32 (66) = happyShift action_50
action_32 (67) = happyShift action_51
action_32 (9) = happyGoto action_52
action_32 (10) = happyGoto action_37
action_32 (11) = happyGoto action_38
action_32 (12) = happyGoto action_39
action_32 (13) = happyGoto action_40
action_32 (14) = happyGoto action_41
action_32 (15) = happyGoto action_42
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (17) = happyShift action_43
action_33 (44) = happyShift action_44
action_33 (48) = happyShift action_45
action_33 (49) = happyShift action_46
action_33 (63) = happyShift action_47
action_33 (64) = happyShift action_48
action_33 (65) = happyShift action_49
action_33 (66) = happyShift action_50
action_33 (67) = happyShift action_51
action_33 (9) = happyGoto action_36
action_33 (10) = happyGoto action_37
action_33 (11) = happyGoto action_38
action_33 (12) = happyGoto action_39
action_33 (13) = happyGoto action_40
action_33 (14) = happyGoto action_41
action_33 (15) = happyGoto action_42
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_5

action_35 _ = happyReduce_3

action_36 (18) = happyShift action_98
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (42) = happyShift action_96
action_37 (43) = happyShift action_97
action_37 _ = happyReduce_22

action_38 (36) = happyShift action_90
action_38 (37) = happyShift action_91
action_38 (38) = happyShift action_92
action_38 (39) = happyShift action_93
action_38 (40) = happyShift action_94
action_38 (41) = happyShift action_95
action_38 _ = happyReduce_23

action_39 _ = happyReduce_26

action_40 (24) = happyShift action_88
action_40 (25) = happyShift action_89
action_40 _ = happyReduce_33

action_41 (26) = happyShift action_85
action_41 (27) = happyShift action_86
action_41 (28) = happyShift action_87
action_41 _ = happyReduce_35

action_42 _ = happyReduce_38

action_43 (17) = happyShift action_43
action_43 (44) = happyShift action_44
action_43 (48) = happyShift action_45
action_43 (49) = happyShift action_46
action_43 (63) = happyShift action_47
action_43 (64) = happyShift action_48
action_43 (65) = happyShift action_49
action_43 (66) = happyShift action_50
action_43 (67) = happyShift action_51
action_43 (9) = happyGoto action_84
action_43 (10) = happyGoto action_37
action_43 (11) = happyGoto action_38
action_43 (12) = happyGoto action_39
action_43 (13) = happyGoto action_40
action_43 (14) = happyGoto action_41
action_43 (15) = happyGoto action_42
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (17) = happyShift action_43
action_44 (44) = happyShift action_44
action_44 (48) = happyShift action_45
action_44 (49) = happyShift action_46
action_44 (63) = happyShift action_47
action_44 (64) = happyShift action_48
action_44 (65) = happyShift action_49
action_44 (66) = happyShift action_50
action_44 (67) = happyShift action_51
action_44 (12) = happyGoto action_83
action_44 (13) = happyGoto action_40
action_44 (14) = happyGoto action_41
action_44 (15) = happyGoto action_42
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_45

action_46 _ = happyReduce_46

action_47 _ = happyReduce_44

action_48 _ = happyReduce_42

action_49 _ = happyReduce_43

action_50 _ = happyReduce_47

action_51 _ = happyReduce_48

action_52 (18) = happyShift action_82
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (56) = happyShift action_74
action_53 (57) = happyShift action_75
action_53 (58) = happyShift action_76
action_53 (59) = happyShift action_77
action_53 (60) = happyShift action_78
action_53 (61) = happyShift action_79
action_53 (62) = happyShift action_80
action_53 (16) = happyGoto action_81
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (56) = happyShift action_74
action_54 (57) = happyShift action_75
action_54 (58) = happyShift action_76
action_54 (59) = happyShift action_77
action_54 (60) = happyShift action_78
action_54 (61) = happyShift action_79
action_54 (62) = happyShift action_80
action_54 (16) = happyGoto action_73
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (18) = happyShift action_72
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (22) = happyShift action_71
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (22) = happyShift action_70
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (22) = happyShift action_69
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (22) = happyShift action_68
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (22) = happyShift action_67
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (22) = happyShift action_66
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_11

action_63 _ = happyReduce_10

action_64 (22) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_9

action_66 _ = happyReduce_12

action_67 _ = happyReduce_13

action_68 _ = happyReduce_14

action_69 _ = happyReduce_15

action_70 _ = happyReduce_16

action_71 _ = happyReduce_18

action_72 (22) = happyShift action_117
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (23) = happyShift action_116
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_50

action_75 _ = happyReduce_51

action_76 _ = happyReduce_52

action_77 _ = happyReduce_53

action_78 _ = happyReduce_54

action_79 _ = happyReduce_55

action_80 _ = happyReduce_56

action_81 (23) = happyShift action_115
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (19) = happyShift action_9
action_82 (6) = happyGoto action_114
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_34

action_84 (18) = happyShift action_113
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (17) = happyShift action_43
action_85 (48) = happyShift action_45
action_85 (49) = happyShift action_46
action_85 (63) = happyShift action_47
action_85 (64) = happyShift action_48
action_85 (65) = happyShift action_49
action_85 (66) = happyShift action_50
action_85 (67) = happyShift action_51
action_85 (15) = happyGoto action_112
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (17) = happyShift action_43
action_86 (48) = happyShift action_45
action_86 (49) = happyShift action_46
action_86 (63) = happyShift action_47
action_86 (64) = happyShift action_48
action_86 (65) = happyShift action_49
action_86 (66) = happyShift action_50
action_86 (67) = happyShift action_51
action_86 (15) = happyGoto action_111
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (17) = happyShift action_43
action_87 (48) = happyShift action_45
action_87 (49) = happyShift action_46
action_87 (63) = happyShift action_47
action_87 (64) = happyShift action_48
action_87 (65) = happyShift action_49
action_87 (66) = happyShift action_50
action_87 (67) = happyShift action_51
action_87 (15) = happyGoto action_110
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (17) = happyShift action_43
action_88 (48) = happyShift action_45
action_88 (49) = happyShift action_46
action_88 (63) = happyShift action_47
action_88 (64) = happyShift action_48
action_88 (65) = happyShift action_49
action_88 (66) = happyShift action_50
action_88 (67) = happyShift action_51
action_88 (14) = happyGoto action_109
action_88 (15) = happyGoto action_42
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (17) = happyShift action_43
action_89 (48) = happyShift action_45
action_89 (49) = happyShift action_46
action_89 (63) = happyShift action_47
action_89 (64) = happyShift action_48
action_89 (65) = happyShift action_49
action_89 (66) = happyShift action_50
action_89 (67) = happyShift action_51
action_89 (14) = happyGoto action_108
action_89 (15) = happyGoto action_42
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (17) = happyShift action_43
action_90 (44) = happyShift action_44
action_90 (48) = happyShift action_45
action_90 (49) = happyShift action_46
action_90 (63) = happyShift action_47
action_90 (64) = happyShift action_48
action_90 (65) = happyShift action_49
action_90 (66) = happyShift action_50
action_90 (67) = happyShift action_51
action_90 (12) = happyGoto action_107
action_90 (13) = happyGoto action_40
action_90 (14) = happyGoto action_41
action_90 (15) = happyGoto action_42
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (17) = happyShift action_43
action_91 (44) = happyShift action_44
action_91 (48) = happyShift action_45
action_91 (49) = happyShift action_46
action_91 (63) = happyShift action_47
action_91 (64) = happyShift action_48
action_91 (65) = happyShift action_49
action_91 (66) = happyShift action_50
action_91 (67) = happyShift action_51
action_91 (12) = happyGoto action_106
action_91 (13) = happyGoto action_40
action_91 (14) = happyGoto action_41
action_91 (15) = happyGoto action_42
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (17) = happyShift action_43
action_92 (44) = happyShift action_44
action_92 (48) = happyShift action_45
action_92 (49) = happyShift action_46
action_92 (63) = happyShift action_47
action_92 (64) = happyShift action_48
action_92 (65) = happyShift action_49
action_92 (66) = happyShift action_50
action_92 (67) = happyShift action_51
action_92 (12) = happyGoto action_105
action_92 (13) = happyGoto action_40
action_92 (14) = happyGoto action_41
action_92 (15) = happyGoto action_42
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (17) = happyShift action_43
action_93 (44) = happyShift action_44
action_93 (48) = happyShift action_45
action_93 (49) = happyShift action_46
action_93 (63) = happyShift action_47
action_93 (64) = happyShift action_48
action_93 (65) = happyShift action_49
action_93 (66) = happyShift action_50
action_93 (67) = happyShift action_51
action_93 (12) = happyGoto action_104
action_93 (13) = happyGoto action_40
action_93 (14) = happyGoto action_41
action_93 (15) = happyGoto action_42
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (17) = happyShift action_43
action_94 (44) = happyShift action_44
action_94 (48) = happyShift action_45
action_94 (49) = happyShift action_46
action_94 (63) = happyShift action_47
action_94 (64) = happyShift action_48
action_94 (65) = happyShift action_49
action_94 (66) = happyShift action_50
action_94 (67) = happyShift action_51
action_94 (12) = happyGoto action_103
action_94 (13) = happyGoto action_40
action_94 (14) = happyGoto action_41
action_94 (15) = happyGoto action_42
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (17) = happyShift action_43
action_95 (44) = happyShift action_44
action_95 (48) = happyShift action_45
action_95 (49) = happyShift action_46
action_95 (63) = happyShift action_47
action_95 (64) = happyShift action_48
action_95 (65) = happyShift action_49
action_95 (66) = happyShift action_50
action_95 (67) = happyShift action_51
action_95 (12) = happyGoto action_102
action_95 (13) = happyGoto action_40
action_95 (14) = happyGoto action_41
action_95 (15) = happyGoto action_42
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (17) = happyShift action_43
action_96 (44) = happyShift action_44
action_96 (48) = happyShift action_45
action_96 (49) = happyShift action_46
action_96 (63) = happyShift action_47
action_96 (64) = happyShift action_48
action_96 (65) = happyShift action_49
action_96 (66) = happyShift action_50
action_96 (67) = happyShift action_51
action_96 (11) = happyGoto action_101
action_96 (12) = happyGoto action_39
action_96 (13) = happyGoto action_40
action_96 (14) = happyGoto action_41
action_96 (15) = happyGoto action_42
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (17) = happyShift action_43
action_97 (44) = happyShift action_44
action_97 (48) = happyShift action_45
action_97 (49) = happyShift action_46
action_97 (63) = happyShift action_47
action_97 (64) = happyShift action_48
action_97 (65) = happyShift action_49
action_97 (66) = happyShift action_50
action_97 (67) = happyShift action_51
action_97 (11) = happyGoto action_100
action_97 (12) = happyGoto action_39
action_97 (13) = happyGoto action_40
action_97 (14) = happyGoto action_41
action_97 (15) = happyGoto action_42
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (19) = happyShift action_9
action_98 (6) = happyGoto action_99
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (46) = happyShift action_120
action_99 _ = happyReduce_21

action_100 (36) = happyShift action_90
action_100 (37) = happyShift action_91
action_100 (38) = happyShift action_92
action_100 (39) = happyShift action_93
action_100 (40) = happyShift action_94
action_100 (41) = happyShift action_95
action_100 _ = happyReduce_25

action_101 (36) = happyShift action_90
action_101 (37) = happyShift action_91
action_101 (38) = happyShift action_92
action_101 (39) = happyShift action_93
action_101 (40) = happyShift action_94
action_101 (41) = happyShift action_95
action_101 _ = happyReduce_24

action_102 _ = happyReduce_32

action_103 _ = happyReduce_31

action_104 _ = happyReduce_30

action_105 _ = happyReduce_29

action_106 _ = happyReduce_28

action_107 _ = happyReduce_27

action_108 (26) = happyShift action_85
action_108 (27) = happyShift action_86
action_108 (28) = happyShift action_87
action_108 _ = happyReduce_37

action_109 (26) = happyShift action_85
action_109 (27) = happyShift action_86
action_109 (28) = happyShift action_87
action_109 _ = happyReduce_36

action_110 _ = happyReduce_41

action_111 _ = happyReduce_40

action_112 _ = happyReduce_39

action_113 _ = happyReduce_49

action_114 _ = happyReduce_19

action_115 (17) = happyShift action_43
action_115 (44) = happyShift action_44
action_115 (48) = happyShift action_45
action_115 (49) = happyShift action_46
action_115 (63) = happyShift action_47
action_115 (64) = happyShift action_48
action_115 (65) = happyShift action_49
action_115 (66) = happyShift action_50
action_115 (67) = happyShift action_51
action_115 (9) = happyGoto action_119
action_115 (10) = happyGoto action_37
action_115 (11) = happyGoto action_38
action_115 (12) = happyGoto action_39
action_115 (13) = happyGoto action_40
action_115 (14) = happyGoto action_41
action_115 (15) = happyGoto action_42
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (17) = happyShift action_43
action_116 (44) = happyShift action_44
action_116 (48) = happyShift action_45
action_116 (49) = happyShift action_46
action_116 (63) = happyShift action_47
action_116 (64) = happyShift action_48
action_116 (65) = happyShift action_49
action_116 (66) = happyShift action_50
action_116 (67) = happyShift action_51
action_116 (9) = happyGoto action_118
action_116 (10) = happyGoto action_37
action_116 (11) = happyGoto action_38
action_116 (12) = happyGoto action_39
action_116 (13) = happyGoto action_40
action_116 (14) = happyGoto action_41
action_116 (15) = happyGoto action_42
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_17

action_118 (22) = happyShift action_123
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (22) = happyShift action_122
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (19) = happyShift action_9
action_120 (6) = happyGoto action_121
action_120 _ = happyFail (happyExpListPerState 120)

action_121 _ = happyReduce_20

action_122 _ = happyReduce_8

action_123 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happyReduce 5 5 happyReduction_2
happyReduction_2 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_5
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  6 happyReduction_3
happyReduction_3 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Statements happy_var_2
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 _
	_
	 =  HappyAbsSyn6
		 (Statements []
	)

happyReduce_5 = happySpecReduce_2  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (VarDecl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ValDecl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 (Assignment happy_var_1 (Add (Id happy_var_1) (Num 1))
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  8 happyReduction_11
happyReduction_11 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 (Assignment happy_var_1 (Sub (Id happy_var_1) (Num 1))
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 8 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 (Add (Id happy_var_1) happy_var_3)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 (Sub (Id happy_var_1) happy_var_3)
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 8 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 (Mult (Id happy_var_1) happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 8 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 (Div (Id happy_var_1) happy_var_3)
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 8 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Assignment happy_var_1 (Mod (Id happy_var_1) happy_var_3)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 5 8 happyReduction_17
happyReduction_17 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (PrintStmt happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 8 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ReadlnStmt
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 8 happyReduction_19
happyReduction_19 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (WhileStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 7 8 happyReduction_20
happyReduction_20 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElseStmt happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 8 happyReduction_21
happyReduction_21 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Less happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Less happy_var_3 happy_var_1
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (LessEqual happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (LessEqual happy_var_3 happy_var_1
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  11 happyReduction_31
happyReduction_31 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (EqualTo happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (NotEqual happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  12 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  12 happyReduction_34
happyReduction_34 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Not happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  13 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Add happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  13 happyReduction_37
happyReduction_37 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  14 happyReduction_38
happyReduction_38 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  14 happyReduction_39
happyReduction_39 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  14 happyReduction_40
happyReduction_40 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Div happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  14 happyReduction_41
happyReduction_41 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn15
		 (Num happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 (HappyTerminal (REAL happy_var_1))
	 =  HappyAbsSyn15
		 (Real happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn15
		 (Id happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (TruthValue True
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (TruthValue False
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 (HappyTerminal (LETTER happy_var_1))
	 =  HappyAbsSyn15
		 (Letter happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  15 happyReduction_48
happyReduction_48 (HappyTerminal (SENTENCE happy_var_1))
	 =  HappyAbsSyn15
		 (Sentence happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  15 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  16 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn16
		 (IntType
	)

happyReduce_51 = happySpecReduce_1  16 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn16
		 (LongType
	)

happyReduce_52 = happySpecReduce_1  16 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn16
		 (FloatType
	)

happyReduce_53 = happySpecReduce_1  16 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn16
		 (DoubleType
	)

happyReduce_54 = happySpecReduce_1  16 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn16
		 (BooleanType
	)

happyReduce_55 = happySpecReduce_1  16 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn16
		 (CharType
	)

happyReduce_56 = happySpecReduce_1  16 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn16
		 (StringType
	)

happyNewToken action sts stk [] =
	action 68 68 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPAREN -> cont 17;
	RPAREN -> cont 18;
	LBRACE -> cont 19;
	RBRACE -> cont 20;
	COLON -> cont 21;
	SEMICOLON -> cont 22;
	ASSIGN -> cont 23;
	PLUS -> cont 24;
	MINUS -> cont 25;
	MULT -> cont 26;
	DIV -> cont 27;
	MOD -> cont 28;
	INCREMENT -> cont 29;
	DECREMENT -> cont 30;
	PLUSEQUAL -> cont 31;
	MINUSEQUAL -> cont 32;
	MULTEQUAL -> cont 33;
	DIVEQUAL -> cont 34;
	MODEQUAL -> cont 35;
	LESS -> cont 36;
	GREATER -> cont 37;
	LESSEQUAL -> cont 38;
	GREATEREQUAL -> cont 39;
	EQUALTO -> cont 40;
	NOTEQUAL -> cont 41;
	AND -> cont 42;
	OR -> cont 43;
	NOT -> cont 44;
	IF -> cont 45;
	ELSE -> cont 46;
	WHILE -> cont 47;
	TRUE -> cont 48;
	FALSE -> cont 49;
	VAL -> cont 50;
	VAR -> cont 51;
	FUN -> cont 52;
	MAIN -> cont 53;
	PRINT -> cont 54;
	READLN -> cont 55;
	INT -> cont 56;
	LONG -> cont 57;
	FLOAT -> cont 58;
	DOUBLE -> cont 59;
	BOOLEAN -> cont 60;
	CHAR -> cont 61;
	STRING -> cont 62;
	ID happy_dollar_dollar -> cont 63;
	NUM happy_dollar_dollar -> cont 64;
	REAL happy_dollar_dollar -> cont 65;
	LETTER happy_dollar_dollar -> cont 66;
	SENTENCE happy_dollar_dollar -> cont 67;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 68 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


data Program = Block
  deriving Show

data Block = Statements [Statement]
  deriving Show

data Statement
  = VarDecl String Type Exp
  | ValDecl String Type Exp
  | Assignment String Exp
  | PrintStmt Exp
  | ReadlnStmt
  | WhileStmt Exp Block
  | IfElseStmt Exp Block Block
  | IfStmt Exp Block
  deriving Show

data Exp
  = Num Int
  | Real Double
  | Id String
  | TruthValue Bool
  | Letter String -- string of length 1
  | Sentence String
  | Add Exp Exp
  | Sub Exp Exp
  | Mult Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
  | Less Exp Exp
  | LessEqual Exp Exp
  | EqualTo Exp Exp
  | NotEqual Exp Exp
  | And Exp Exp
  | Or Exp Exp
  | Not Exp
  deriving Show

data Type
  = IntType
  | LongType
  | FloatType
  | DoubleType
  | BooleanType
  | CharType
  | StringType
  deriving Show


parseError :: [Token] -> a
parseError toks = error ("parse error on tokens: " ++ show toks)
parseError _ = error "parse error: no tokens"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
