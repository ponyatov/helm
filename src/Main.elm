module Main exposing (main)

import Browser
import Debug exposing (log)
import Html exposing (button, div, img, input, text)
import Html.Attributes exposing (id, placeholder, required, src)
import Html.Events exposing (onClick)
import String exposing (fromInt)


add a b =
    a + b


init =
    { value = 0, name = "Kris" }


type Message
    = Add


update msg model =
    let
        _ =
            log "model" model
    in
    case msg of
        Add ->
            let
                _ =
                    log "update" msg
            in
            { model | value = model.value + 1 }


view model =
    div []
        [ text (fromInt model.value)
        , div [] []
        , input [ id "val", placeholder model.name, required True ] []
        , button [ onClick Add ] [ text "Add" ]
        , img [ src "control.png" ] []
        ]


main =
    Browser.sandbox { init = init, view = view, update = update }
