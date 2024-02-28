module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
     div [] 
     [ h1 [id "name"] [text details.name]
     , em [id "intro"] [text details.intro]
     , ul [] (details.contacts |> List.map contactView)
     , ul [] (details.socials |> List.map socialView)
     ]
       
contactView : DetailWithName -> Html msg
contactView detail =
 li [class "contact-detail"] [text(detail.name ++ ": " ++ detail.detail)]
       
socialView : DetailWithName -> Html msg
socialView detail = 
 li [class "social-link"] [a [href detail.detail] [text detail.detail]]
    --Debug.todo "Implement the Model.PersonalDetails.view function"
