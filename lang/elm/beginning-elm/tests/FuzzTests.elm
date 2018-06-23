module FuzzTests exposing (..)

import Array
import Expect exposing (Expectation)
import Fuzz exposing (..)
import MyList exposing (MyList(..))
import Random exposing (minInt, maxInt)
import Test exposing (..)


addOne : Int -> Int
addOne x =
    1 + x


addOneTests : Test
addOneTests =
    describe "addOne"
        [ fuzz frequencyFuzzer "adds 1 to any integer" <|
            \num ->
                addOne num |> Expect.equal (num + 1)
        ]


add : Int -> Int -> Int
add x y =
    x + y


addTests : Test
addTests =
    describe "add"
        [ fuzz (tuple ( int, int )) "adds two given integers" <|
            \( num1, num2 ) ->
                add num1 num2
                    |> Expect.equal (num1 + num2)
        ]


frequencyFuzzer : Fuzzer Int
frequencyFuzzer =
    frequency
        [ ( 70, constant 7 )
        , ( 12, intRange 8 9 )
        , ( 6, constant 6 )
        , ( 9, intRange 2 4 )
        , ( 1, constant 5 )
        , ( 1, constant 1 )
        , ( 1, constant 10 )
        ]


flip : Bool -> Bool
flip x =
    not x


flipTests : Test
flipTests =
    describe "flip"
        [ fuzz bool "negates the given boolean value" <|
            \value ->
                flip value |> Expect.equal (not value)
        ]


multiplyFloat : Float -> Int -> Float
multiplyFloat x y =
    x * (toFloat y)


multiplyFloatTests : Test
multiplyFloatTests =
    describe "multiplyFloat"
        [ fuzz2 percentage int "mutiplies given numbers" <|
            \x y ->
                multiplyFloat x y
                    |> Expect.equal (x * (toFloat y))
        ]


stringTests : Test
stringTests =
    describe "The String module"
        [ describe "String.reverse"
            [ test "has no offect on a palindrome" <|
                -- Unit Test - 1
                \_ ->
                    let
                        palindrome =
                            "hannah"
                    in
                        palindrome
                            |> String.reverse
                            |> Expect.equal palindrome
            , test "reverse a known string" <|
                -- Unit Test - 2
                \_ ->
                    "ABCDEFG"
                        |> String.reverse
                        |> Expect.equal "GFEDCBA"
            , fuzz string "restore the orginal string if you run it again" <|
                -- Fuzz Test
                \randomlyGeneratedString ->
                    randomlyGeneratedString
                        |> String.reverse
                        |> String.reverse
                        |> Expect.equal randomlyGeneratedString
            ]
        ]


listLenghtTests : Test
listLenghtTests =
    describe "List.length"
        [ fuzz (list int) "never returns a negative value" <|
            \intList ->
                intList
                    |> List.length
                    |> Expect.atLeast 0
        ]


arrayGetTests : Test
arrayGetTests =
    describe "Array.get"
        [ fuzz (array (intRange -20 20)) "returns Nothing for out of range index" <|
            \intArray ->
                let
                    length =
                        Array.length intArray
                in
                    intArray
                        |> Array.get length
                        |> Expect.equal Nothing
        ]


listReverseTests : Test
listReverseTests =
    describe "List.reverse"
        [ fuzz2 (list int) int "doesn't remove a member of a list" <|
            \intList num ->
                intList
                    |> List.reverse
                    |> List.member num
                    |> Expect.equal (List.member num intList)
        ]


myListSumTests : Test
myListSumTests =
    describe "MyList.sum"
        [ fuzz3 int int int "sums the values contained in MyList" <|
            \int1 int2 int3 ->
                Node int1 (Node int2 (Node int3 Empty))
                    |> MyList.sum
                    |> Expect.equal (int1 + int2 + int3)
        ]
