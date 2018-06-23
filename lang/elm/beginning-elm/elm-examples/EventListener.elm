module EventListener exposing (..)

import Html exposing (..)
import Keyboard
import Mouse


type alias Model =
    Int


type Msg
    = KeyPressed Keyboard.KeyCode
    | MouseClicked Mouse.Position


init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ text (toString model) ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyPressed _ ->
            ( model + 1, Cmd.none )

        MouseClicked _ ->
            ( model - 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Keyboard.presses KeyPressed
        , Mouse.clicks MouseClicked
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
