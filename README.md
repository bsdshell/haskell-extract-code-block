# haskell-extract-code-block
## Extract all code blocks from a file

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
