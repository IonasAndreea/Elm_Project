module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
     div [class "repo"] [
          div [class "repo-name"] [text repo.name]
          ,div [class "repo-description"] [text <| Maybe.withDefault "No description available" repo.description]
          ,div [class "repo-url"] [a [href repo.url] [text repo.url]]
          ,div [class "repo-stars"] [(text << String.fromInt) repo.stars]
     ]
    --Debug.todo "Implement Model.Repo.view"


sortByStars : List Repo -> List Repo
sortByStars repos =
    List.sortBy (\repo -> repo.stars) repos 
    --Debug.todo "Implement Model.Repo.sortByStars"


{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
    De.map5 Repo
      (De.field "name" De.string)
      (De.maybe (De.field "description" De.string))
      (De.field "url" De.string)
      (De.field "pushedAt" De.string)
      (De.field "stars" De.int)
     --De.fail "Not implemented"
    --Debug.todo "Implement Model.Repo.decodeRepo"
