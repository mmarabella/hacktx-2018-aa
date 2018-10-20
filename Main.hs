{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Simple

main :: IO ()
main = do
    response <- httpLBS "http://hacktx-aa.herokuapp.com/user?email=test%40aa.com" 

    putStrLn $ "The status code was: " ++
               show (getResponseStatusCode response)

    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response