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
happyExpList = Happy_Data_Array.listArray (0,226) ([0,0,4096,0,0,0,128,0,0,0,0,0,0,16384,0,0,0,0,0,128,0,0,0,8,0,0,32768,0,0,0,0,0,0,0,64,25856,1030,0,2,0,0,0,16384,409,1,0,0,0,32768,0,0,0,1024,0,0,0,0,0,4096,0,0,0,128,2048,0,0,0,64,0,0,0,128,0,0,4096,0,49,56,256,0,0,0,4,3136,3584,0,2,0,0,4096,0,0,0,8,6272,7168,16384,0,196,224,0,0,0,0,0,0,0,0,1,0,0,0,12288,0,0,0,126,0,0,0,0,0,0,12,0,0,32768,3,0,0,0,0,0,4096,0,49,56,128,34816,49153,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,0,0,2032,0,0,32768,63,2048,0,0,0,1024,0,0,0,32,0,0,0,0,0,0,0,0,0,0,64,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,2,0,0,0,0,0,0,64,0,0,0,1,768,896,2048,0,24,28,64,49152,57344,0,2,1536,1792,4096,0,48,56,128,34816,49153,1,4,3136,3584,8192,0,98,112,256,4096,32771,3,8,6272,7168,16384,0,196,224,512,8192,6,7,16,12544,14336,0,2,0,0,0,0,1,0,0,126,0,0,61440,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,448,0,0,0,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,16384,12,14,32,25088,28672,0,0,0,0,0,1,0,0,2048,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","MainFunction","Block","Statements","Statement","Exp","LogicalExp","ComparisonExp","NotExp","AddSubExp","MultDivExp","Unit","Type","'('","')'","'{'","'}'","':'","';'","'='","'+'","'-'","'*'","'/'","'%'","'<'","'>'","'<='","'>='","'=='","'!='","'&&'","'||'","'!'","if","else","while","true","false","val","var","fun","main","print","readln","int","long","float","double","boolean","char","string","id","num","real","%eof"]
        bit_start = st Prelude.* 59
        bit_end = (st Prelude.+ 1) Prelude.* 59
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..58]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (45) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (45) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (46) = happyShift action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (59) = happyAccept
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
action_9 (38) = happyShift action_13
action_9 (40) = happyShift action_14
action_9 (43) = happyShift action_15
action_9 (44) = happyShift action_16
action_9 (47) = happyShift action_17
action_9 (48) = happyShift action_18
action_9 (56) = happyShift action_19
action_9 (7) = happyGoto action_10
action_9 (8) = happyGoto action_11
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (20) = happyShift action_28
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (38) = happyShift action_13
action_11 (40) = happyShift action_14
action_11 (43) = happyShift action_15
action_11 (44) = happyShift action_16
action_11 (47) = happyShift action_17
action_11 (48) = happyShift action_18
action_11 (56) = happyShift action_19
action_11 (7) = happyGoto action_27
action_11 (8) = happyGoto action_11
action_11 _ = happyReduce_6

action_12 _ = happyReduce_4

action_13 (17) = happyShift action_26
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (17) = happyShift action_25
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (56) = happyShift action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (56) = happyShift action_23
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_22
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (17) = happyShift action_21
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (23) = happyShift action_20
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_36
action_20 (37) = happyShift action_37
action_20 (41) = happyShift action_38
action_20 (42) = happyShift action_39
action_20 (56) = happyShift action_40
action_20 (57) = happyShift action_41
action_20 (58) = happyShift action_42
action_20 (9) = happyGoto action_48
action_20 (10) = happyGoto action_30
action_20 (11) = happyGoto action_31
action_20 (12) = happyGoto action_32
action_20 (13) = happyGoto action_33
action_20 (14) = happyGoto action_34
action_20 (15) = happyGoto action_35
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (18) = happyShift action_47
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_36
action_22 (37) = happyShift action_37
action_22 (41) = happyShift action_38
action_22 (42) = happyShift action_39
action_22 (56) = happyShift action_40
action_22 (57) = happyShift action_41
action_22 (58) = happyShift action_42
action_22 (9) = happyGoto action_46
action_22 (10) = happyGoto action_30
action_22 (11) = happyGoto action_31
action_22 (12) = happyGoto action_32
action_22 (13) = happyGoto action_33
action_22 (14) = happyGoto action_34
action_22 (15) = happyGoto action_35
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (21) = happyShift action_45
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (21) = happyShift action_44
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (17) = happyShift action_36
action_25 (37) = happyShift action_37
action_25 (41) = happyShift action_38
action_25 (42) = happyShift action_39
action_25 (56) = happyShift action_40
action_25 (57) = happyShift action_41
action_25 (58) = happyShift action_42
action_25 (9) = happyGoto action_43
action_25 (10) = happyGoto action_30
action_25 (11) = happyGoto action_31
action_25 (12) = happyGoto action_32
action_25 (13) = happyGoto action_33
action_25 (14) = happyGoto action_34
action_25 (15) = happyGoto action_35
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_36
action_26 (37) = happyShift action_37
action_26 (41) = happyShift action_38
action_26 (42) = happyShift action_39
action_26 (56) = happyShift action_40
action_26 (57) = happyShift action_41
action_26 (58) = happyShift action_42
action_26 (9) = happyGoto action_29
action_26 (10) = happyGoto action_30
action_26 (11) = happyGoto action_31
action_26 (12) = happyGoto action_32
action_26 (13) = happyGoto action_33
action_26 (14) = happyGoto action_34
action_26 (15) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_5

action_28 _ = happyReduce_3

action_29 (18) = happyShift action_77
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (35) = happyShift action_75
action_30 (36) = happyShift action_76
action_30 _ = happyReduce_15

action_31 (29) = happyShift action_69
action_31 (30) = happyShift action_70
action_31 (31) = happyShift action_71
action_31 (32) = happyShift action_72
action_31 (33) = happyShift action_73
action_31 (34) = happyShift action_74
action_31 _ = happyReduce_16

action_32 _ = happyReduce_19

action_33 (24) = happyShift action_67
action_33 (25) = happyShift action_68
action_33 _ = happyReduce_26

action_34 (26) = happyShift action_64
action_34 (27) = happyShift action_65
action_34 (28) = happyShift action_66
action_34 _ = happyReduce_28

action_35 _ = happyReduce_31

action_36 (17) = happyShift action_36
action_36 (37) = happyShift action_37
action_36 (41) = happyShift action_38
action_36 (42) = happyShift action_39
action_36 (56) = happyShift action_40
action_36 (57) = happyShift action_41
action_36 (58) = happyShift action_42
action_36 (9) = happyGoto action_63
action_36 (10) = happyGoto action_30
action_36 (11) = happyGoto action_31
action_36 (12) = happyGoto action_32
action_36 (13) = happyGoto action_33
action_36 (14) = happyGoto action_34
action_36 (15) = happyGoto action_35
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (17) = happyShift action_36
action_37 (37) = happyShift action_37
action_37 (41) = happyShift action_38
action_37 (42) = happyShift action_39
action_37 (56) = happyShift action_40
action_37 (57) = happyShift action_41
action_37 (58) = happyShift action_42
action_37 (12) = happyGoto action_62
action_37 (13) = happyGoto action_33
action_37 (14) = happyGoto action_34
action_37 (15) = happyGoto action_35
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_38

action_39 _ = happyReduce_39

action_40 _ = happyReduce_37

action_41 _ = happyReduce_35

action_42 _ = happyReduce_36

action_43 (18) = happyShift action_61
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (49) = happyShift action_53
action_44 (50) = happyShift action_54
action_44 (51) = happyShift action_55
action_44 (52) = happyShift action_56
action_44 (53) = happyShift action_57
action_44 (54) = happyShift action_58
action_44 (55) = happyShift action_59
action_44 (16) = happyGoto action_60
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (49) = happyShift action_53
action_45 (50) = happyShift action_54
action_45 (51) = happyShift action_55
action_45 (52) = happyShift action_56
action_45 (53) = happyShift action_57
action_45 (54) = happyShift action_58
action_45 (55) = happyShift action_59
action_45 (16) = happyGoto action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (18) = happyShift action_51
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (22) = happyShift action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (22) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_9

action_50 _ = happyReduce_11

action_51 (22) = happyShift action_96
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (23) = happyShift action_95
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_41

action_54 _ = happyReduce_42

action_55 _ = happyReduce_43

action_56 _ = happyReduce_44

action_57 _ = happyReduce_45

action_58 _ = happyReduce_46

action_59 _ = happyReduce_47

action_60 (23) = happyShift action_94
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (19) = happyShift action_9
action_61 (6) = happyGoto action_93
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_27

action_63 (18) = happyShift action_92
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (17) = happyShift action_36
action_64 (41) = happyShift action_38
action_64 (42) = happyShift action_39
action_64 (56) = happyShift action_40
action_64 (57) = happyShift action_41
action_64 (58) = happyShift action_42
action_64 (15) = happyGoto action_91
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (17) = happyShift action_36
action_65 (41) = happyShift action_38
action_65 (42) = happyShift action_39
action_65 (56) = happyShift action_40
action_65 (57) = happyShift action_41
action_65 (58) = happyShift action_42
action_65 (15) = happyGoto action_90
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (17) = happyShift action_36
action_66 (41) = happyShift action_38
action_66 (42) = happyShift action_39
action_66 (56) = happyShift action_40
action_66 (57) = happyShift action_41
action_66 (58) = happyShift action_42
action_66 (15) = happyGoto action_89
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (17) = happyShift action_36
action_67 (41) = happyShift action_38
action_67 (42) = happyShift action_39
action_67 (56) = happyShift action_40
action_67 (57) = happyShift action_41
action_67 (58) = happyShift action_42
action_67 (14) = happyGoto action_88
action_67 (15) = happyGoto action_35
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (17) = happyShift action_36
action_68 (41) = happyShift action_38
action_68 (42) = happyShift action_39
action_68 (56) = happyShift action_40
action_68 (57) = happyShift action_41
action_68 (58) = happyShift action_42
action_68 (14) = happyGoto action_87
action_68 (15) = happyGoto action_35
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (17) = happyShift action_36
action_69 (37) = happyShift action_37
action_69 (41) = happyShift action_38
action_69 (42) = happyShift action_39
action_69 (56) = happyShift action_40
action_69 (57) = happyShift action_41
action_69 (58) = happyShift action_42
action_69 (12) = happyGoto action_86
action_69 (13) = happyGoto action_33
action_69 (14) = happyGoto action_34
action_69 (15) = happyGoto action_35
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (17) = happyShift action_36
action_70 (37) = happyShift action_37
action_70 (41) = happyShift action_38
action_70 (42) = happyShift action_39
action_70 (56) = happyShift action_40
action_70 (57) = happyShift action_41
action_70 (58) = happyShift action_42
action_70 (12) = happyGoto action_85
action_70 (13) = happyGoto action_33
action_70 (14) = happyGoto action_34
action_70 (15) = happyGoto action_35
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (17) = happyShift action_36
action_71 (37) = happyShift action_37
action_71 (41) = happyShift action_38
action_71 (42) = happyShift action_39
action_71 (56) = happyShift action_40
action_71 (57) = happyShift action_41
action_71 (58) = happyShift action_42
action_71 (12) = happyGoto action_84
action_71 (13) = happyGoto action_33
action_71 (14) = happyGoto action_34
action_71 (15) = happyGoto action_35
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (17) = happyShift action_36
action_72 (37) = happyShift action_37
action_72 (41) = happyShift action_38
action_72 (42) = happyShift action_39
action_72 (56) = happyShift action_40
action_72 (57) = happyShift action_41
action_72 (58) = happyShift action_42
action_72 (12) = happyGoto action_83
action_72 (13) = happyGoto action_33
action_72 (14) = happyGoto action_34
action_72 (15) = happyGoto action_35
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (17) = happyShift action_36
action_73 (37) = happyShift action_37
action_73 (41) = happyShift action_38
action_73 (42) = happyShift action_39
action_73 (56) = happyShift action_40
action_73 (57) = happyShift action_41
action_73 (58) = happyShift action_42
action_73 (12) = happyGoto action_82
action_73 (13) = happyGoto action_33
action_73 (14) = happyGoto action_34
action_73 (15) = happyGoto action_35
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (17) = happyShift action_36
action_74 (37) = happyShift action_37
action_74 (41) = happyShift action_38
action_74 (42) = happyShift action_39
action_74 (56) = happyShift action_40
action_74 (57) = happyShift action_41
action_74 (58) = happyShift action_42
action_74 (12) = happyGoto action_81
action_74 (13) = happyGoto action_33
action_74 (14) = happyGoto action_34
action_74 (15) = happyGoto action_35
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (17) = happyShift action_36
action_75 (37) = happyShift action_37
action_75 (41) = happyShift action_38
action_75 (42) = happyShift action_39
action_75 (56) = happyShift action_40
action_75 (57) = happyShift action_41
action_75 (58) = happyShift action_42
action_75 (11) = happyGoto action_80
action_75 (12) = happyGoto action_32
action_75 (13) = happyGoto action_33
action_75 (14) = happyGoto action_34
action_75 (15) = happyGoto action_35
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (17) = happyShift action_36
action_76 (37) = happyShift action_37
action_76 (41) = happyShift action_38
action_76 (42) = happyShift action_39
action_76 (56) = happyShift action_40
action_76 (57) = happyShift action_41
action_76 (58) = happyShift action_42
action_76 (11) = happyGoto action_79
action_76 (12) = happyGoto action_32
action_76 (13) = happyGoto action_33
action_76 (14) = happyGoto action_34
action_76 (15) = happyGoto action_35
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (19) = happyShift action_9
action_77 (6) = happyGoto action_78
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (39) = happyShift action_99
action_78 _ = happyReduce_14

action_79 (29) = happyShift action_69
action_79 (30) = happyShift action_70
action_79 (31) = happyShift action_71
action_79 (32) = happyShift action_72
action_79 (33) = happyShift action_73
action_79 (34) = happyShift action_74
action_79 _ = happyReduce_18

action_80 (29) = happyShift action_69
action_80 (30) = happyShift action_70
action_80 (31) = happyShift action_71
action_80 (32) = happyShift action_72
action_80 (33) = happyShift action_73
action_80 (34) = happyShift action_74
action_80 _ = happyReduce_17

action_81 _ = happyReduce_25

action_82 _ = happyReduce_24

action_83 _ = happyReduce_23

action_84 _ = happyReduce_22

action_85 _ = happyReduce_21

action_86 _ = happyReduce_20

action_87 (26) = happyShift action_64
action_87 (27) = happyShift action_65
action_87 (28) = happyShift action_66
action_87 _ = happyReduce_30

action_88 (26) = happyShift action_64
action_88 (27) = happyShift action_65
action_88 (28) = happyShift action_66
action_88 _ = happyReduce_29

action_89 _ = happyReduce_34

action_90 _ = happyReduce_33

action_91 _ = happyReduce_32

action_92 _ = happyReduce_40

action_93 _ = happyReduce_12

action_94 (17) = happyShift action_36
action_94 (37) = happyShift action_37
action_94 (41) = happyShift action_38
action_94 (42) = happyShift action_39
action_94 (56) = happyShift action_40
action_94 (57) = happyShift action_41
action_94 (58) = happyShift action_42
action_94 (9) = happyGoto action_98
action_94 (10) = happyGoto action_30
action_94 (11) = happyGoto action_31
action_94 (12) = happyGoto action_32
action_94 (13) = happyGoto action_33
action_94 (14) = happyGoto action_34
action_94 (15) = happyGoto action_35
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (17) = happyShift action_36
action_95 (37) = happyShift action_37
action_95 (41) = happyShift action_38
action_95 (42) = happyShift action_39
action_95 (56) = happyShift action_40
action_95 (57) = happyShift action_41
action_95 (58) = happyShift action_42
action_95 (9) = happyGoto action_97
action_95 (10) = happyGoto action_30
action_95 (11) = happyGoto action_31
action_95 (12) = happyGoto action_32
action_95 (13) = happyGoto action_33
action_95 (14) = happyGoto action_34
action_95 (15) = happyGoto action_35
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_10

action_97 (22) = happyShift action_102
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (22) = happyShift action_101
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (19) = happyShift action_9
action_99 (6) = happyGoto action_100
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_13

action_101 _ = happyReduce_8

action_102 _ = happyReduce_7

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

happyReduce_10 = happyReduce 5 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (PrintStmt happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 8 happyReduction_11
happyReduction_11 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ReadlnStmt
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (WhileStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 7 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn6  happy_var_7) `HappyStk`
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

happyReduce_14 = happyReduce 5 8 happyReduction_14
happyReduction_14 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  9 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Less happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  11 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (LessEqual happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (GreaterEqual happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  11 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (EqualTo happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (NotEqual happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  12 happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Not happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  13 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Add happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  14 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  14 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Div happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  14 happyReduction_34
happyReduction_34 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  15 happyReduction_35
happyReduction_35 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn15
		 (Num happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 (HappyTerminal (REAL happy_var_1))
	 =  HappyAbsSyn15
		 (Real happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn15
		 (Id happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn15
		 (TruthValue True
	)

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn15
		 (TruthValue False
	)

happyReduce_40 = happySpecReduce_3  15 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn16
		 (IntType
	)

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn16
		 (LongType
	)

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn16
		 (FloatType
	)

happyReduce_44 = happySpecReduce_1  16 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn16
		 (DoubleType
	)

happyReduce_45 = happySpecReduce_1  16 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn16
		 (BooleanType
	)

happyReduce_46 = happySpecReduce_1  16 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn16
		 (CharType
	)

happyReduce_47 = happySpecReduce_1  16 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn16
		 (StringType
	)

happyNewToken action sts stk [] =
	action 59 59 notHappyAtAll (HappyState action) sts stk []

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
	LESS -> cont 29;
	GREATER -> cont 30;
	LESSEQUAL -> cont 31;
	GREATEREQUAL -> cont 32;
	EQUALTO -> cont 33;
	NOTEQUAL -> cont 34;
	AND -> cont 35;
	OR -> cont 36;
	NOT -> cont 37;
	IF -> cont 38;
	ELSE -> cont 39;
	WHILE -> cont 40;
	TRUE -> cont 41;
	FALSE -> cont 42;
	VAL -> cont 43;
	VAR -> cont 44;
	FUN -> cont 45;
	MAIN -> cont 46;
	PRINT -> cont 47;
	READLN -> cont 48;
	INT -> cont 49;
	LONG -> cont 50;
	FLOAT -> cont 51;
	DOUBLE -> cont 52;
	BOOLEAN -> cont 53;
	CHAR -> cont 54;
	STRING -> cont 55;
	ID happy_dollar_dollar -> cont 56;
	NUM happy_dollar_dollar -> cont 57;
	REAL happy_dollar_dollar -> cont 58;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 59 tk tks = happyError' (tks, explist)
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
  | Add Exp Exp
  | Sub Exp Exp
  | Mult Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
  | Less Exp Exp
  | Greater Exp Exp
  | LessEqual Exp Exp
  | GreaterEqual Exp Exp
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
