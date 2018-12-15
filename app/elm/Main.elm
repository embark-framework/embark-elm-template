port module Main exposing (main)

import Browser exposing (sandbox)
import String exposing (isEmpty)
import Html exposing (..)
import Html.Attributes exposing (..)


-- APP
main : Program () Model Msg
main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- PORTS
port embarkReady : (String -> msg) -> Sub msg


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    embarkReady EmbarkReady


-- MODEL
type alias Model =
  { embarkStatus: String }

init : () -> (Model, Cmd Msg)
init _ =
  ( { embarkStatus = "Loading..." }, Cmd.none )


-- UPDATE
type Msg =
  EmbarkReady String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    EmbarkReady error ->
      ( { model | embarkStatus = if String.isEmpty error then "Ready." else error }
      , Cmd.none
      )


-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h3 [] [ text "Welcome to Embark!" ]
    , p []
      [ text "See the "
      , a
        [ target "_blank"
        , href "http://embark.readthedocs.io/en/latest/index.html"
        ]
        [ text "Embark's documentation" ]
      , text " to see what you can do with Embark!"
      ]
    , p []
      [ text "Embark status: "
      , text model.embarkStatus
      ]
    ]
