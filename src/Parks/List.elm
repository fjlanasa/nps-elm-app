module Parks.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, src)
import Msgs exposing(..)
import Models exposing (Park)
import RemoteData exposing (WebData)

view : WebData (List Park) -> Html Msg
view response =
  div []
      [ h1 [] [ text "Parks" ]
      , maybeList response
      ]

list : List Park -> Html Msg
list parks =
  div [] [ ul [] (List.map parkTile parks) ]

parkTile: Park -> Html Msg
parkTile park =
    li []
      [ div []
          [ a [ href park.url]
              [ h3 [] [ text park.name ]
              ]
          , img [ src park.thumbnail ] []
          ]
      ]

maybeList : WebData (List Park) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success parks ->
            list parks

        RemoteData.Failure error ->
            text (toString error)
