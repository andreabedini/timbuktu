import qualified Data.ByteString.Char8 as B
import Network.Socket
import Network.Socket.ByteString (recv, sendAll)

-- | Send a message from one end of a socket pair to the other.
main :: IO ()
main = do
    (a, b) <- socketPair AF_UNIX Stream defaultProtocol
    sendAll a (B.pack "hello through a socket pair")
    recv b 1024 >>= B.putStrLn
    close a
    close b
