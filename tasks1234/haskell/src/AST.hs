module AST where

import qualified Data.Map as Map


type Name = String

data Type = HInt
          | HBool
		  | HChar
		  | HList Type
		  | HPair Type Type
		  | HLambda Type Type
        deriving (Show, Ord, Eq, Read) 

data Pattern = NamePattern  Name
             | ListPattern  Pattern Pattern
             | PairPattern  (Pattern, Pattern)
        deriving (Show, Ord, Eq, Read)

data BinOp = Add | Sub | Mul | Div | 
			 And | Or | Eq | Gt | Ls |
			 Concat | Push
			 
        deriving (Show, Ord, Eq, Read)

data UnOp = Neg | Not 
        deriving (Show, Ord, Eq, Read)

data Expr = Ident          Name
          | App            Expr Expr
          | AppBinOp       BinOp Expr Expr
          | AppUnOp        UnOp Expr
          | Def            Name [Pattern] Expr 

          | IfThenElse     Expr Expr Expr
          | Where          Expr [Expr]

          | Lambda         [Pattern] Expr Env
		  | UserLambda	   [Pattern] Expr Env

          | IntLiteral     Int
          | CharLiteral    Char
          | StringLiteral  String
          | BoolLiteral    Bool
          | ListExpr       [Expr]
          | PairExpr       (Expr, Expr)

		  | None
		  | Undefined

          | TypeDef        Name [Type]
        deriving (Ord, Eq, Read)


data HaskellError = BaseError String
                  | NotInScope Name
                  | WrongNumberOfArguments
                  | TypeError String
                  | ParseError
        deriving (Show, Ord, Eq, Read)

type Safe = Either HaskellError
type Env = Map.Map Name (Safe Expr)
