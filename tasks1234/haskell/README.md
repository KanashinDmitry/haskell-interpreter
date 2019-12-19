# Haskell Interpreter


Description:
- AST implemented
- Initial parser/interpreter/REPL implemented
- Run via `make && make test`


Implemented features:
- Numbers, bools, characters, pairs
- Lists, strings
- Initial binary & unary operators
- Functions
    - Call-by-name evaluation strategy
    - Based on lambda calculus
    - Pointless style 
    - Partial application
- `if-then-else` expressions


TODO
- Parser
    - [2] ++ [3]
    - (((+) 2) 3)
- Interpreter
    - String output
    - User-lambdas
    - Pattern-matching
    - Type checking
    - Type inference