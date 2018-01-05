module Msgs exposing(..)

import Models exposing (Park)
import RemoteData exposing(WebData)

type Msg =
    OnFetchParks (WebData (List Park))
