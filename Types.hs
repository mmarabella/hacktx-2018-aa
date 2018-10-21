module Types where

import Data.Time.Clock (UTCTime(..))
import Data.Time.Calendar.Julian
import Data.Time.Calendar

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
  }

newtype FlightNumber = FlightNumber { flightNumberToInt :: Int }
newtype CityCode = CityCode { codeToString :: String }
newtype City = City { cityToString :: String }

sampleDay :: Day
sampleDay = fromJulian 2018 02 04 

sampleUTCDeparture :: UTCTime
sampleUTCDeparture = 
  UTCTime
  { utctDay = sampleDay
  , utctDayTime = 0
  }

sampleUTCArrival :: UTCTime
sampleUTCArrival = 
  UTCTime
  { utctDay = sampleDay
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
  , estimatedDeparture = sampleUTCDeparture
  , scheduledDeparture = sampleUTCDeparture
  , estimatedArrival = sampleUTCArrival
  , scheduledArrival = sampleUTCArrival
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