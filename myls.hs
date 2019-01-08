import System.Directory
import System.Posix.Files
import Control.Monad
import System.FilePath

--getDir someDir = listDirectory someDir

--showDir dir = mapM_ putStrLn (getDirectoryContents dir)
--dirs list = [x | x <- list, (doesDirectoryExist x) == True]
--showRecursive someDir = 

-- mapM doesDirectoryExist contents

-- filesInCurDir <- getCurrentDirectory >>= getDirectoryContents
-- mapM doesDirectoryExist filesInCurDir

--travDir content = do
--	let status  = mapM doesDirectoryExist content
--	print status

--checkDir dir =

--checkStatus dir = mapM doesDirectoryExist dir  

trav top = do
    contents <- listDirectory top
    --print contents
    rec <- forM contents $ \inside -> do
        let pa = top </> inside
        --print pa
        status <- doesDirectoryExist pa
        if status == True then
            trav pa
        else return [pa]
    return (concat rec)



main = do
    --currentDir <- getCurrentDirectory
    --print currentDir
    --contents <- (getDir currentDir)
    top <- getCurrentDirectory
    --contents <- getCurrentDirectory >>= getDirectoryContents
    --print contents
    --travDir contents
    --status <- checkStatus contents
    --print status
    final <- trav top
    mapM_ putStrLn final
    --intermediate <- putTogether contents status
    --print "Hello"
