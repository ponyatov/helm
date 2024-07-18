module Main exposing (main)

import Browser
import Debug exposing (log)
import Html exposing (button, div, img, input, node, text)
import Html.Attributes exposing (href, id, placeholder, rel, required, src)
import Html.Events exposing (onClick)
import String exposing (fromInt)


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


css path =
    node "link" [ rel "stylesheet", href path ] []


view model =
    div
        []
        [ css "/css.css"
        , text (fromInt model.value)
        , div [] []
        , input [ id "val", placeholder model.name, required True ] []
        , button [ onClick Add ] [ text "Add" ]
        , img [ id "biglogo", src "control.png" ] []
        ]


main =
    Browser.sandbox { init = init, view = view, update = update }
