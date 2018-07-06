module App exposing (main)

import Html exposing (program)
import Navigation
import State exposing (init, updateWithStorage)
import Types exposing (..)
import View exposing (view)


main : Program (Maybe (List Post)) Model Msg
main =
    Navigation.programWithFlags LocationChanged
        { init = init
        , view = view
        , update = updateWithStorage
        , subscriptions = \_ -> Sub.none
        }
