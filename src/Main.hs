import Text.Regex
import Text.Regex.Base
import Text.Regex.Base.RegexLike
import Text.Regex.Posix
import AronModule
  
main = do
  ls <- readFileList "./g.x"
  fw "Input file"
  pre ls
  -- let lss = filter (\x -> fst (isUnGuardedRhs x)) ls
  -- let lst = filter (\x -> fst (isIdent x)) ls
  -- pre $ findIdentBlock ls
  let zb = allBlocks ls
  fl
  fw "Output file"
  pre zb

-- NOTE: It DOES NOT works so far.
{-|
-}
findIdentBlock::[String] -> [String]
findIdentBlock [] = [] 
findIdentBlock (x:cs) | fst (isUnGuardedRhs x) = findIdentBlock cs
                      | fst (isIdent x)        = x : allIdent cs
                      | isOtherType x    = findIdentBlock cs
                      | isLeftBracket x  = findIdentBlock cs
                      | otherwise        = []

allBlocks::[String] -> [[String]]
allBlocks cx = zb
  where
    blocks = blockUnGuardedRhs cx
    bb = reverse $ blocks ++ [[]]
    b1 = init bb
    b2 = tail bb
    zb = zipWith (\x2 x1 -> dropEnd (len x1) x2) b2 b1

{-|
   ["a", "ab", "abc"]

   ["a",   "ab"]
   ["ab", "abc"]


   ["", "a", "ab", "abc"]

   ["",  "a", "ab"]
   ["a", "ab", "abc"]

   ["a" - "", "ab" - "a", "abc" - "ab"]

   ["a", "b", "c"]

   [("ab" - "a"), ("abc" - "ab")]
   ["b", "c"]
-}
blockUnGuardedRhs::[String] -> [[String]]
blockUnGuardedRhs [] = []
blockUnGuardedRhs (x:cs) = if bo then let f = innerUnGuardedRhs cs
                                          n = fst f
                                          s = snd f
                                      in if n == 0 then s:blockUnGuardedRhs cs else (x:s):(blockUnGuardedRhs cs)
                                 else blockUnGuardedRhs cs
  where
    bo = fst (isUnGuardedRhs x)

{-|
   http://localhost/image/hparse.png
-}
blockIdent::[String] -> [[String]]
blockIdent [] = []
blockIdent (x:cs) = [[]]
  

innerIdent::[String] -> (Int, [String])
innerIdent [] = (0, [])
innerIdent (x:cs) | isLeftBracket x =  ((fst fc) + 1, x:(snd fc))
                  | isRightBracket x = ((fst fc) - 1, x:(snd fc))
                  | otherwise = fc
  where
    fc = innerIdent cs

{-|
blockUnGuardedRhsList::[String] -> [[String]]
blockUnGuardedRhsList [] = []
blockUnGuardedRhsList (x:cs) = if bo then 
  where
    bo = fst (isUnGuardedRhs x) 
-}  
innerUnGuardedRhs::[String] -> (Int, [String])
innerUnGuardedRhs [] = (0, [])
innerUnGuardedRhs (x:cs) | isLeftBracket x =  ((fst fc) + 1, x:(snd fc))
                         | isRightBracket x = ((fst fc) - 1, x:(snd fc))
                         | otherwise = fc
  where
    fc = innerUnGuardedRhs cs
    
allIdent::[String] -> [String]
allIdent (x:cs) = if  (not . isLeftBracket) x then x : allIdent cs else  x : findIdentBlock cs

-- ) anything => True
isRightBracket::String -> Bool
isRightBracket [] = False
isRightBracket s = head s' == ')'
  where
    s' = trim s
  
-- ( anything => True
isLeftBracket::String -> Bool
isLeftBracket [] = False
isLeftBracket s = head s' == '('
  where
    s' = trim s
  
-- ( MyType => True
isOtherType::String -> Bool
isOtherType s = bracket == '(' && isMat
  where
    s' = trim s
    bracket = head s'
    ts = (trim . tail) s
    isMat = matchTest (mkRegex "[A-Z][[:alnum:]]+") ts

-- ( Ident  => True
isIdent::String -> (Bool, Char)
isIdent s = if len s > 0 then (bo, '(') else (False, '(')
  where
    s' = trim s
    bo = (s' !! 0) == '(' && matchTest (mkRegex "Ident" )  (trim $ drop 1 s')


-- ( UnGuardedRhs  => True
isUnGuardedRhs::String -> (Bool, Char)
isUnGuardedRhs s = if len s > 0 then (bo, '(') else (False, '(')
  where
    s' = trim s
    bo = (s' !! 0) == '(' && matchTest (mkRegex "UnGuardedRhs" )  (trim $ drop 1 s')
