port module PortExamples exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode exposing (Value, string, decodeValue)


type alias Model =
    { dataFromJS : String
    , dataToJS : ComplexData
    , errorMessage : Maybe String
    }


type alias ComplexData =
    { posts : List Post
    , comments : List Comment
    , profile : Profile
    }


type alias Post =
    { id : Int
    , title : String
    , author : Author
    }


type alias Author =
    { name : String
    , url : String
    }


type alias Comment =
    { id : Int
    , body : String
    , postId : Int
    }


type alias Profile =
    { name : String }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick SendDataToJS ]
            [ text "Send Data to JavaScript" ]
        , br [] []
        , br [] []
        , viewDataFromJSOrError model
        ]


viewDataFromJSOrError : Model -> Html Msg
viewDataFromJSOrError model =
    case model.errorMessage of
        Just message ->
            viewError message

        Nothing ->
            viewDataFromJS model.dataFromJS


viewError : String -> Html Msg
viewError errorMessage =
    let
        errorHeading =
            "Couldn't receive data from JavaScript"
    in
        div []
            [ h3 [] [ text errorHeading ]
            , text ("Error: " ++ errorMessage)
            ]


viewDataFromJS : String -> Html msg
viewDataFromJS data =
    div []
        [ h3 [] [ text "Received the following data from JavaScript" ]
        , text data
        ]


type Msg
    = SendDataToJS
    | ReceivedDataFromJS Value


port sendData : ComplexData -> Cmd msg


port receiveData : (Value -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveData ReceivedDataFromJS


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SendDataToJS ->
            ( model, sendData model.dataToJS )

        ReceivedDataFromJS value ->
            case decodeValue string value of
                Ok data ->
                    ( { model | dataFromJS = data }, Cmd.none )

                Err error ->
                    ( { model | errorMessage = Just error }, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { dataFromJS = ""
    , dataToJS = complexData
    , errorMessage = Nothing
    }


complexData : ComplexData
complexData =
    let
        post1 =
            Author "typicode" "https://github.com/typicode"
                |> Post 1 "json-server"

        post2 =
            Author "indexzero" "https://github.com/indexzero"
                |> Post 2 "http-server"
    in
        { posts = [ post1, post2 ]
        , comments = [ Comment 1 "some comment" 1 ]
        , profile = { name = "typicode" }
        }


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
