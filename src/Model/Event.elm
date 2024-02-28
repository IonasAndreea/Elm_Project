module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortFunction : Event -> Event -> Order
sortFunction event1 event2 = Interval.compare event1.interval event2.interval

sortByInterval : List Event -> List Event
sortByInterval events =
     List.sortWith ( \x y -> Interval.compare x.interval y.interval) events
   -- Debug.todo "Implement Event.sortByInterval"


view : Event -> Html Never
view event =
     let
        isImportant = 
           case event.important of
             True -> [class "event", class "event-important"]
             _ -> [class "event"]

     in
     div isImportant
     [ p [class "event-category"] [categoryView event.category]
     , p [class "event-title"] [text event.title]
     , p [class "event-description"] [event.description]
     , p [class "event-url"] [text <| Maybe.withDefault "" event.url]
     , p [class "event-interval"] [Interval.view event.interval]
    ]  
   -- Debug.todo "Implement the Model.Event.view function"
