module REPL where

import AST
import Interpreter
import System.IO
import qualified Data.Map as Map


runtime :: Env
runtime = Map.empty


prompt :: String -> IO String
prompt text = do
    putStr text
    hFlush stdout
    getLine


runRepl :: Env -> IO ()
runRepl env = do
    input <- prompt "MiniHaskell> "
    process $ eval env (read input) where
        process :: (Env, Safe Expr) -> IO ()
        process (nenv, Right result) = putStrLn (show result) >> runRepl nenv
        process (nenv, Left error) = putStrLn (show error) >> runRepl env
    