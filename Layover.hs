module Layover where

import Types (Flight(..), Layover(..))

determineLayover :: Flight -> Flight -> String -> Layover
determineLayover flight1 flight2 name =
  Layover
  { city = destinationCity flight1
  , startTime = estimatedArrival flight1
  , endTime = estimatedDeparture flight2
  , flightAttendantName = name
  }

-- flightsToLayovers :: [Flight] -> [Layover]
-- flightsToLayovers flights =
--   foldl 
