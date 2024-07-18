module Main exposing (main)

import Browser
import Debug exposing (log)
import Html exposing (a, button, div, img, input, node, p, text)
import Html.Attributes exposing (href, id, placeholder, rel, required, src)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt)


init =
    { value = 0, name = "Kris" }


type Message
    = Add
    | TextChanged String


update msg model =
    let
        _ =
            log "model" model
    in
    case msg of
        Add ->
            let
                _ =
                    log "Add" msg
            in
            { model | value = model.value + 1 }

        TextChanged s ->
            let
                _ =
                    log "TextChanged" s
            in
            { model | name = s }


css path =
    node "link" [ rel "stylesheet", href path ] []


tutorial =
    div [] [ a [ href "https://www.youtube.com/watch?v=tsSG7aAp_z8&list=PL9l1zUfnZkZlzD2JAAnezqyPIoRnhJWzI&index=7" ] [ text "tutorial" ] ]


view model =
    div
        []
        [ css "/css.css"
        , text (fromInt model.value ++ ": ")
        , div [] [ text model.name ]
        , input [ id "val", placeholder model.name, required True, onInput TextChanged ] []
        , button [ onClick Add ] [ text "Add" ]
        , img [ id "biglogo", src "control.png" ] []
        , p [] []
        , tutorial
        ]


main =
    Browser.sandbox { init = init, view = view, update = update }
