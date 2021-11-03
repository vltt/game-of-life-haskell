module Input where

import System.IO

fH :: IO([[Int]])
fH = do
    inh <- openFile "input.txt" ReadMode
    mainloop inh

mainloop :: Handle -> IO [[Int]]
mainloop inh = 
    do ineof <- hIsEOF inh
       if ineof
           then return []
           else do inpStr <- hGetLine inh
                   moreInputs <- mainloop inh
                   return ((map readInt . words $ inpStr) : moreInputs)

readInt :: String -> Int
readInt = read