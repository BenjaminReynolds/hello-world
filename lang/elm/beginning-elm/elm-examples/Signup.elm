module Signup exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import SignupStyle exposing (..)


type alias User =
    { name : String
    , email : String
    , password : String
    , loggedIn : Bool
    }


initialModel : User
initialModel =
    { name = ""
    , email = ""
    , password = ""
    , loggedIn = False
    }


view : User -> Html Msg
view user =
    div []
        [ h1 [ headerStyle ] [ text "Sign up" ]
        , Html.form [ formStyle ]
            [ div []
                [ text "Name"
                , input
                    [ id "name"
                    , type_ "text"
                    , inputTextStyle
                    , onInput SaveName
                    ]
                    []
                ]
            , div []
                [ text "Email"
                , input
                    [ id "email"
                    , type_ "email"
                    , inputTextStyle
                    , onInput SaveEmail
                    ]
                    []
                ]
            , div []
                [ text "Password"
                , input
                    [ id "password"
                    , type_ "password"
                    , inputTextStyle
                    , onInput SavePassword
                    ]
                    []
                ]
            , div []
                [ button
                    [ type_ "submit"
                    , buttonStyle
                    , onClick Signup
                    ]
                    [ text "Create my account" ]
                ]
            ]
        ]


type Msg
    = SaveName String
    | SaveEmail String
    | SavePassword String
    | Signup


update : Msg -> User -> User
update message user =
    case message of
        SaveName name ->
            { user | name = name }

        SaveEmail email ->
            { user | email = email }

        SavePassword password ->
            { user | password = password }

        Signup ->
            { user | loggedIn = True }


main : Program Never User Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
