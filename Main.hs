{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveAnyClass #-}

import           Data.Aeson
import qualified Data.ByteString.Char8 as S8
import qualified Data.Yaml             as Yaml
import           Network.HTTP.Simple

import Types (Person(..), Flight(..), exampleFlight, exampleFlight2)
import Layover (determineLayover)


main :: IO ()
main = do
    response <- httpJSON "http://hacktx-aa.herokuapp.com/user?email=test%40aa.com"

    putStrLn $ "The status code was: " ++
               show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    S8.putStrLn $ Yaml.encode (getResponseBody response :: Value)
    putStrLn ("DECODED")
    -- print $ exampleFlight
    -- print $ exampleFlight2
    print $ determineLayover exampleFlight exampleFlight2 "Madalyn"
    myPerson <- rushi
    case myPerson of
      Nothing -> putStrLn $ "Could not parse"
      Just person -> putStrLn $ firstName person

rushi :: IO (Maybe Person)
rushi = do
  response <- httpJSON "http://hacktx-aa.herokuapp.com/user?email=test%40aa.com"
  let result = fromJSON ((getResponseBody response) :: Value)
  case result of
    Error str -> pure Nothing
    Success a -> pure a

instance ToJSON Person where
    -- this generates a Value
    toJSON (Person email aadvantageId id lastName gender firstName) =
        object ["email" .= email 
        , "aadvantageId" .= aadvantageId 
        , "_id" .= id 
        , "lastName" .= lastName 
        , "gender" .= gender 
        , "firstName" .= firstName]

    -- this encodes directly to a bytestring Builder
    toEncoding (Person email aadvantageId id lastName gender firstName) =
        pairs ("email" .= email 
        <> "aadvantageId" .= aadvantageId 
        <> "_id" .= id 
        <> "lastName" .= lastName 
        <> "gender" .= gender 
        <> "firstName" .= firstName)

instance FromJSON Person where
    parseJSON = withObject "Person" $ \v -> Person
        <$> v .: "email"
        <*> v .: "aadvantageId"
        <*> v .: "_id"
        <*> v .: "lastName"
        <*> v .: "gender"
        <*> v .: "firstName"
