{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,130) ([0,8192,0,0,256,0,0,0,0,32768,0,0,0,0,8,0,32768,0,0,2048,0,0,0,0,0,59396,1028,8192,0,0,1024,0,0,0,0,2048,0,0,64,0,0,0,4096,0,0,128,128,0,0,256,0,8192,0,1792,256,0,56,128,0,0,4,0,512,0,112,16,32768,3,59392,1028,0,0,0,0,0,0,386,0,0,112,0,0,0,0,2,28672,0,0,0,0,0,0,0,0,16384,48,0,0,61440,7,0,16256,32768,96,0,0,3,0,16,32768,32771,0,7168,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,1024,0,0,3088,0,16384,0,3584,512,0,112,16,32768,3,2,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,896,128,0,28,14336,0,0,448,0,32768,1,0,3072,0,0,1,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","MainFunction","Block","Statements","Statement","Exp","Term","Factor","Type","'('","')'","'{'","'}'","':'","';'","'='","'+'","'-'","'*'","'/'","'%'","if","else","while","val","var","fun","main","print","int","long","float","double","boolean","char","string","id","num","real","%eof"]
        bit_start = st Prelude.* 43
        bit_end = (st Prelude.+ 1) Prelude.* 43
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..42]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (30) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (31) = happyShift action_5
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (43) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (14) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (15) = happyShift action_9
action_7 (6) = happyGoto action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_2

action_9 (16) = happyShift action_12
action_9 (25) = happyShift action_13
action_9 (27) = happyShift action_14
action_9 (28) = happyShift action_15
action_9 (29) = happyShift action_16
action_9 (32) = happyShift action_17
action_9 (40) = happyShift action_18
action_9 (7) = happyGoto action_10
action_9 (8) = happyGoto action_11
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (16) = happyShift action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (18) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_4

action_13 (13) = happyShift action_24
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (13) = happyShift action_23
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (40) = happyShift action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (40) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (13) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (19) = happyShift action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (13) = happyShift action_31
action_19 (40) = happyShift action_32
action_19 (41) = happyShift action_33
action_19 (42) = happyShift action_34
action_19 (9) = happyGoto action_39
action_19 (10) = happyGoto action_29
action_19 (11) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (13) = happyShift action_31
action_20 (40) = happyShift action_32
action_20 (41) = happyShift action_33
action_20 (42) = happyShift action_34
action_20 (9) = happyGoto action_38
action_20 (10) = happyGoto action_29
action_20 (11) = happyGoto action_30
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (17) = happyShift action_37
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_36
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (13) = happyShift action_31
action_23 (40) = happyShift action_32
action_23 (41) = happyShift action_33
action_23 (42) = happyShift action_34
action_23 (9) = happyGoto action_35
action_23 (10) = happyGoto action_29
action_23 (11) = happyGoto action_30
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_31
action_24 (40) = happyShift action_32
action_24 (41) = happyShift action_33
action_24 (42) = happyShift action_34
action_24 (9) = happyGoto action_28
action_24 (10) = happyGoto action_29
action_24 (11) = happyGoto action_30
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (25) = happyShift action_13
action_25 (27) = happyShift action_14
action_25 (28) = happyShift action_15
action_25 (29) = happyShift action_16
action_25 (32) = happyShift action_17
action_25 (40) = happyShift action_18
action_25 (7) = happyGoto action_27
action_25 (8) = happyGoto action_11
action_25 _ = happyReduce_6

action_26 _ = happyReduce_3

action_27 _ = happyReduce_5

action_28 (14) = happyShift action_57
action_28 (20) = happyShift action_40
action_28 (21) = happyShift action_41
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (22) = happyShift action_54
action_29 (23) = happyShift action_55
action_29 (24) = happyShift action_56
action_29 _ = happyReduce_14

action_30 _ = happyReduce_17

action_31 (13) = happyShift action_31
action_31 (40) = happyShift action_32
action_31 (41) = happyShift action_33
action_31 (42) = happyShift action_34
action_31 (9) = happyGoto action_53
action_31 (10) = happyGoto action_29
action_31 (11) = happyGoto action_30
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_23

action_33 _ = happyReduce_21

action_34 _ = happyReduce_22

action_35 (14) = happyShift action_52
action_35 (20) = happyShift action_40
action_35 (21) = happyShift action_41
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (33) = happyShift action_44
action_36 (34) = happyShift action_45
action_36 (35) = happyShift action_46
action_36 (36) = happyShift action_47
action_36 (37) = happyShift action_48
action_36 (38) = happyShift action_49
action_36 (39) = happyShift action_50
action_36 (12) = happyGoto action_51
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (33) = happyShift action_44
action_37 (34) = happyShift action_45
action_37 (35) = happyShift action_46
action_37 (36) = happyShift action_47
action_37 (37) = happyShift action_48
action_37 (38) = happyShift action_49
action_37 (39) = happyShift action_50
action_37 (12) = happyGoto action_43
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (14) = happyShift action_42
action_38 (20) = happyShift action_40
action_38 (21) = happyShift action_41
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (20) = happyShift action_40
action_39 (21) = happyShift action_41
action_39 _ = happyReduce_9

action_40 (13) = happyShift action_31
action_40 (40) = happyShift action_32
action_40 (41) = happyShift action_33
action_40 (42) = happyShift action_34
action_40 (10) = happyGoto action_67
action_40 (11) = happyGoto action_30
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (13) = happyShift action_31
action_41 (40) = happyShift action_32
action_41 (41) = happyShift action_33
action_41 (42) = happyShift action_34
action_41 (10) = happyGoto action_66
action_41 (11) = happyGoto action_30
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_10

action_43 (19) = happyShift action_65
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_25

action_45 _ = happyReduce_26

action_46 _ = happyReduce_27

action_47 _ = happyReduce_28

action_48 _ = happyReduce_29

action_49 _ = happyReduce_30

action_50 _ = happyReduce_31

action_51 (19) = happyShift action_64
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (15) = happyShift action_9
action_52 (6) = happyGoto action_63
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (14) = happyShift action_62
action_53 (20) = happyShift action_40
action_53 (21) = happyShift action_41
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (13) = happyShift action_31
action_54 (40) = happyShift action_32
action_54 (41) = happyShift action_33
action_54 (42) = happyShift action_34
action_54 (11) = happyGoto action_61
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (13) = happyShift action_31
action_55 (40) = happyShift action_32
action_55 (41) = happyShift action_33
action_55 (42) = happyShift action_34
action_55 (11) = happyGoto action_60
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_31
action_56 (40) = happyShift action_32
action_56 (41) = happyShift action_33
action_56 (42) = happyShift action_34
action_56 (11) = happyGoto action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (15) = happyShift action_9
action_57 (6) = happyGoto action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (26) = happyShift action_70
action_58 _ = happyReduce_13

action_59 _ = happyReduce_20

action_60 _ = happyReduce_19

action_61 _ = happyReduce_18

action_62 _ = happyReduce_24

action_63 _ = happyReduce_11

action_64 (13) = happyShift action_31
action_64 (40) = happyShift action_32
action_64 (41) = happyShift action_33
action_64 (42) = happyShift action_34
action_64 (9) = happyGoto action_69
action_64 (10) = happyGoto action_29
action_64 (11) = happyGoto action_30
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (13) = happyShift action_31
action_65 (40) = happyShift action_32
action_65 (41) = happyShift action_33
action_65 (42) = happyShift action_34
action_65 (9) = happyGoto action_68
action_65 (10) = happyGoto action_29
action_65 (11) = happyGoto action_30
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (22) = happyShift action_54
action_66 (23) = happyShift action_55
action_66 (24) = happyShift action_56
action_66 _ = happyReduce_16

action_67 (22) = happyShift action_54
action_67 (23) = happyShift action_55
action_67 (24) = happyShift action_56
action_67 _ = happyReduce_15

action_68 (20) = happyShift action_40
action_68 (21) = happyShift action_41
action_68 _ = happyReduce_7

action_69 (20) = happyShift action_40
action_69 (21) = happyShift action_41
action_69 _ = happyReduce_8

action_70 (15) = happyShift action_9
action_70 (6) = happyGoto action_71
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_12

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

happyReduce_5 = happySpecReduce_3  7 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 6 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (VarDecl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 6 8 happyReduction_8
happyReduction_8 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ValDecl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn8
		 (Assignment happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 4 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (PrintStmt happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5 8 happyReduction_11
happyReduction_11 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (WhileStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 7 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn6  happy_var_7) `HappyStk`
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

happyReduce_13 = happyReduce 5 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfStmt happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  9 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Add happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Div happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn11
		 (Num happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyTerminal (REAL happy_var_1))
	 =  HappyAbsSyn11
		 (Real happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn11
		 (Var happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  11 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (IntType
	)

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn12
		 (LongType
	)

happyReduce_27 = happySpecReduce_1  12 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn12
		 (FloatType
	)

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn12
		 (DoubleType
	)

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn12
		 (BooleanType
	)

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (CharType
	)

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn12
		 (StringType
	)

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPAREN -> cont 13;
	RPAREN -> cont 14;
	LBRACE -> cont 15;
	RBRACE -> cont 16;
	COLON -> cont 17;
	SEMICOLON -> cont 18;
	ASSIGN -> cont 19;
	PLUS -> cont 20;
	MINUS -> cont 21;
	MULT -> cont 22;
	DIV -> cont 23;
	MOD -> cont 24;
	IF -> cont 25;
	ELSE -> cont 26;
	WHILE -> cont 27;
	VAL -> cont 28;
	VAR -> cont 29;
	FUN -> cont 30;
	MAIN -> cont 31;
	PRINT -> cont 32;
	INT -> cont 33;
	LONG -> cont 34;
	FLOAT -> cont 35;
	DOUBLE -> cont 36;
	BOOLEAN -> cont 37;
	CHAR -> cont 38;
	STRING -> cont 39;
	ID happy_dollar_dollar -> cont 40;
	NUM happy_dollar_dollar -> cont 41;
	REAL happy_dollar_dollar -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
  | WhileStmt Exp Block
  | IfElseStmt Exp Block Block
  | IfStmt Exp Block
  deriving Show

data Exp
  = Num Int
  | Real Double
  | Var String
  | Add Exp Exp
  | Sub Exp Exp
  | Mult Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
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
