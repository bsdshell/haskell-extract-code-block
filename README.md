# haskell-extract-code-block
## Extract all code blocks from a file

# Definition of code block
## code block example 1
``` haskell
   ( UnGuardedRhs
   )
```

## code block example 2
``` haskell
   ( UnGuardedRhs
     (
	 )
   )
```
## code block example 3
``` haskell
   ( UnGuardedRhs
     (
	  []
	  xx
	 )
   )
```
# Input

``` haskell
[ "           line 1"
, "         ( UnGuardedRhs"
, "  )"
, "  xx"
, " ( UnGuardedRhs"
, "  ("
, "  ("
, "  )"
, "  )"
, " )"
, " xx"
, " ( UnGuardedRhs"
, " ( KK"
, "  )"
, " )"
]
```
# Output
``` haskell
[
    [ "\x9 ( UnGuardedRhs"
    , "\x9 ( KK"
    , "\x9  )"
    , "\x9 )"
    ]
,
    [ "\x9 ( UnGuardedRhs"
    , "\x9  ("
    , "\x9  ("
    , "\x9  )"
    , "\x9  )"
    , "\x9 )"
    ]
,
    [ "         ( UnGuardedRhs"
    , "\x9  )"
    ]
]
```

[code blocks](extract_code_block.png)
