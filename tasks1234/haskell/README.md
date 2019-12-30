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
- `where` expressions
- Pattern matching

TODO
- Parser
    - [2] ++ [3] 
    - (+ 2) 3
    - (head [\x->x+1, \x->x+2]) 1
    - Pretty errors

- Interpreter
    - Type inference