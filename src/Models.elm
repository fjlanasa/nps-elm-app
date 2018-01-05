module Models exposing(..)
import RemoteData exposing(WebData)

type alias Model =
    { parks: WebData (List Park)
    }

initialModel : Model
initialModel =
    { parks = RemoteData.Loading
    }

type alias ParkCode =
    String

type alias Park =
    { id: Int
    , parkCode: ParkCode
    , name: String
    , image: String
    , images: List String
    , thumbnail: String
    , thumbnails: List String
    , description: String
    , states: List String
    , url: String
    , lat: Maybe String
    , lng: Maybe String
    }
