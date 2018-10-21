{-# LANGUAGE DeriveAnyClass #-}

module Types where

import Data.Time.Clock (UTCTime(..))
import Data.Time.Calendar.Julian
import Data.Time.Calendar

data Layover = 
  Layover
  { city :: City
  , startTime :: UTCTime
  , endTime :: UTCTime
  , flightAttendantName :: String
  } deriving (Show, Eq)


data Flight = 
  Flight 
  { flightNumber :: FlightNumber
  , originCode :: CityCode
  , originCity :: City
  , destinationCode :: CityCode
  , destinationCity :: City
  , estimatedDeparture :: UTCTime
  , scheduledDeparture :: UTCTime
  , estimatedArrival :: UTCTime
  , scheduledArrival :: UTCTime
  } deriving (Show, Eq)

newtype FlightNumber = FlightNumber { flightNumberToInt :: Int } deriving (Show, Eq)
newtype CityCode = CityCode { codeToString :: String } deriving (Show, Eq)
newtype City = City { cityToString :: String } deriving (Show, Eq)

sampleDay :: Day
sampleDay = fromJulian 2018 02 04

sampleDay2 :: Day
sampleDay2 = fromJulian 2018 02 05

sampleUTCDeparture :: UTCTime
sampleUTCDeparture = 
  UTCTime
  { utctDay = sampleDay
  , utctDayTime = 0
  }

sampleUTCDeparture2 :: UTCTime
sampleUTCDeparture2 = 
  UTCTime
  { utctDay = sampleDay2
  , utctDayTime = 0
  }

sampleUTCArrival :: UTCTime
sampleUTCArrival = 
  UTCTime
  { utctDay = sampleDay
  , utctDayTime = 10000
  }

sampleUTCArrival2 :: UTCTime
sampleUTCArrival2 = 
  UTCTime
  { utctDay = sampleDay2
  , utctDayTime = 10000
  }

exampleFlight :: Flight
exampleFlight = 
  Flight
  { flightNumber = FlightNumber 1234
  , originCode = CityCode "atl111"
  , originCity = City "Atlanta"
  , destinationCode = CityCode "aus222"
  , destinationCity = City "Austin"
  , estimatedDeparture = sampleUTCDeparture
  , scheduledDeparture = sampleUTCDeparture
  , estimatedArrival = sampleUTCArrival
  , scheduledArrival = sampleUTCArrival
  }

exampleFlight2 :: Flight
exampleFlight2 = 
  Flight
  { flightNumber = FlightNumber 1234
  , originCode = CityCode "aus222"
  , originCity = City "Austin"
  , destinationCode = CityCode "dal111"
  , destinationCity = City "Dallas"
  , estimatedDeparture = sampleUTCDeparture2
  , scheduledDeparture = sampleUTCDeparture2
  , estimatedArrival = sampleUTCArrival2
  , scheduledArrival = sampleUTCArrival2
  }

data Person =
  Person
  { email :: String
  , aadvantageId :: String
  , id :: String
  , lastName :: String
  , gender :: String
  , firstName :: String
  } deriving (Show, Eq)
