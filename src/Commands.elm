module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import Msgs exposing (Msg)
import Models exposing (Park)
import RemoteData

fetchParks : Cmd Msg
fetchParks =
    Http.get fetchParksUrl parksDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchParks

fetchParksUrl : String
fetchParksUrl =
    "http://my-nps-api.herokuapp.com/"

parksDecoder : Decode.Decoder (List Park)
parksDecoder =
    Decode.list parkDecoder

parkDecoder : Decode.Decoder Park
parkDecoder =
    decode Park
        |> required "id" Decode.int
        |> required "parkCode" Decode.string
        |> required "name" Decode.string
        |> required "image" Decode.string
        |> required "images" (Decode.list Decode.string)
        |> required "thumbnail" Decode.string
        |> required "thumbnails" (Decode.list Decode.string)
        |> required "description" Decode.string
        |> required "states" (Decode.list Decode.string)
        |> required "url" Decode.string
        |> optional "lat" (Decode.nullable Decode.string) Nothing
        |> optional "lng" (Decode.nullable Decode.string) Nothing
