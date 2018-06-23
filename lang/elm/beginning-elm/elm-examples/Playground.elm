{-
   The Playground module is used to experiment with
   various concepts in the Elm programming language
-}


module Playground exposing (..)

import Html exposing (Html, text)
import List exposing (isEmpty)
import MyList exposing (..)
import Regex


escapeEarth : Float -> Float -> String -> String
escapeEarth velocity speed fuelStatus =
    let
        escapeVelocityInKmPerSec =
            11.186

        orbitalSpeedInKmPerSec =
            7.67

        whereToLand fuelStatus =
            if fuelStatus == "low" then
                "Land on droneship"
            else
                "Land on launchpad"
    in
        if velocity > escapeVelocityInKmPerSec then
            "Godspeed"
        else if speed == orbitalSpeedInKmPerSec then
            "Stay in orbit"
        else
            whereToLand fuelStatus


weekday : number -> String
weekday dayInNumber =
    case dayInNumber of
        0 ->
            "Sunday"

        1 ->
            "Monday"

        2 ->
            "Tuesday"

        3 ->
            "Wednesday"

        4 ->
            "Thursday"

        5 ->
            "Friday"

        6 ->
            "Saturday"

        _ ->
            "Unknown day"


hashtag : number -> String
hashtag dayInNumber =
    case weekday dayInNumber of
        "Sunday" ->
            "#SinDay"

        "Monday" ->
            "#MondayBlues"

        "Tuesday" ->
            "#TakeMeBackTuesday"

        "Wednesday" ->
            "#HumDay"

        "Thursday" ->
            "#ThrowbackThursday"

        "Friday" ->
            "#FlashbackFriday"

        "Saturday" ->
            "#Caturday"

        _ ->
            "#Whatever"


speed : Float -> Float -> Float
speed distance time =
    distance / time


time : number -> number -> number
time startTime endTime =
    endTime - startTime


multiply : number -> number -> number
multiply c d =
    c * d


divide : Float -> Float -> Float
divide e f =
    e / f


(+++) : appendable -> appendable -> appendable
(+++) first second =
    first ++ second


whereToPark : Float -> String
whereToPark speed =
    case speed of
        7.67 ->
            "Low Earth Orbit"

        3.8 ->
            "Medium Earth Orbit"

        3.07 ->
            "Geostationary Orbit"

        _ ->
            "Nowhere"


revelation =
    """
    It became very clear to me sitting out there today
    that every decision I've made in my entire life has
    been wrong. My life is the complete "opposite" of
    everything I want it to be. Every instinct I have,
    in every aspect of life, be it something to wear,
    something to eat - it's all been wrong.
    """


descending : comparable -> comparable -> Order
descending a b =
    case compare a b of
        LT ->
            GT

        GT ->
            LT

        EQ ->
            EQ


evilometer : String -> String -> Order
evilometer character1 character2 =
    case ( character1, character2 ) of
        ( "Joffrey", "Ramsay" ) ->
            LT

        ( "Joffrey", "Night King" ) ->
            LT

        ( "Ramsay", "Joffrey" ) ->
            GT

        ( "Ramsay", "Night King" ) ->
            LT

        ( "Night King", "Joffey" ) ->
            GT

        ( "Night King", "Ramsay" ) ->
            GT

        _ ->
            GT


validateEmail : String -> ( String, String )
validateEmail email =
    let
        emailPattern =
            Regex.regex "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

        isValid =
            Regex.contains emailPattern email
    in
        if isValid then
            ( "Valid email", "green" )
        else
            ( "Invalid email", "red" )


multiplyByFive : number -> number
multiplyByFive number =
    let
        multiplier =
            5
    in
        number * multiplier


multiplier =
    2


scores =
    [ 316, 320, 312, 370, 337, 318, 314 ]


doubleScores : List Int -> List Int
doubleScores scores =
    List.map (\x -> x * multiplier) scores


scoresLessThan320 : List Int -> List Int
scoresLessThan320 scores =
    List.filter isLessThan320 scores


isLessThan320 : Int -> Bool
isLessThan320 score =
    score < 320


addOne : number -> number
addOne x =
    x + 1


guardiansWithShortNames : List String -> Int
guardiansWithShortNames guardians =
    guardians
        |> List.map String.length
        |> List.filter (\x -> x < 6)
        |> List.length


add : Int -> Int -> Int
add x y =
    x + y


type Greeting a
    = Howdy
    | Hola
    | Namaste String
    | NumericalHi Int Int


sayHello : Greeting a -> String
sayHello greeting =
    case greeting of
        Howdy ->
            "How ya'll doin'?"

        Hola ->
            "Hola amigo!"

        Namaste message ->
            message

        NumericalHi value1 value2 ->
            value1 + value2 |> toString


signUp : String -> String -> Result String String
signUp email age =
    case String.toInt age of
        Err message ->
            Err message

        Ok age ->
            let
                emailPattern =
                    Regex.regex "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b"

                isValidEmail =
                    Regex.contains emailPattern email
            in
                if age < 13 then
                    Err "You need to be at least 13 years old to sign up."
                else if isValidEmail then
                    Ok "Your account has been created successfully!"
                else
                    Err "You entered an invalid email"


type alias Character =
    { name : String
    , age : Maybe Int
    }


sansa : Character
sansa =
    { name = "Sansa"
    , age = Just 19
    }


arya : Character
arya =
    { name = "Arya"
    , age = Nothing
    }


getAdultAge : Character -> Maybe Int
getAdultAge character =
    case character.age of
        Nothing ->
            Nothing

        Just age ->
            if age >= 18 then
                Just age
            else
                Nothing


list1 : MyList a
list1 =
    Empty


list2 : MyList number
list2 =
    Node 9 Empty


list3 : List a
list3 =
    []


resultMap5Example : Result String Int
resultMap5Example =
    Result.map5 addFiveNumbers
        (String.toInt "1")
        (String.toInt "2")
        (String.toInt "3")
        (String.toInt "4")
        (String.toInt "5")


addFiveNumbers : Int -> Int -> Int -> Int -> Int -> Int
addFiveNumbers a b c d e =
    a + b + c + d + e


welcomeMessage : { a | isLoggedIn : Bool, name : String } -> String
welcomeMessage { isLoggedIn, name } =
    case isLoggedIn of
        True ->
            "Welcome " ++ name ++ "!"

        False ->
            "Please log in."


type alias User =
    { name : String
    , email : String
    , age : Int
    , isLoggedIn : Bool
    }


main : Html msg
main =
    MyList.isEmpty list2
        |> toString
        |> text
