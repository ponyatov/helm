module Main exposing (main)

import Browser
import Html exposing (button, div, input, text)
import Html.Attributes exposing (id, placeholder, required)
import Html.Events exposing (onClick)
import String exposing (fromInt)


add a b =
    a + b


init =
    { value = 0, name = "Kris" }


type Message
    = Add


update msg model =
    case msg of
        Add ->
            { model | value = model.value + 1 }


view model =
    div []
        [ text (fromInt model.value)
        , div [] []
        , input [ id "val", placeholder model.name, required True ] []
        , button [ onClick Add ] [ text "Add" ]
        ]


main =
    Browser.sandbox { init = init, view = view, update = update }



-- hello name =
--     "Hello" ++ name ++ " !"
