module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Css exposing (hover, property)
import Html exposing (Html)
import Html.Styled exposing (code, div, pre)
import Svg.Styled exposing (..)
import Svg.Styled.Attributes exposing (..)
import Svg.Styled.Events exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    ()


init : Model
init =
    ()



-- UPDATE


type Msg
    = Msg


update : Msg -> Model -> Model
update _ () =
    ()



-- VIEW


feDropShadow : List (Attribute msg) -> List (Svg msg) -> Svg msg
feDropShadow =
    node "feDropShadow"


view : Model -> Html Msg
view _ =
    Html.Styled.toUnstyled <|
        div []
            [ -- SVG with background shadow by having the CSS reference the SVG filter ID on hover
              svg
                [ width "120"
                , height "120"
                , viewBox "0 0 120 120"
                , css [ hover [ property "filter" "url(#shadow)" ] ]
                ]
                [ Svg.Styled.filter [ id "shadow" ] [ feDropShadow [ stdDeviation "3", dx "0.2", dy "0.4" ] [] ]
                , rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] []
                ]
            , pre []
                [ code []
                    [ text
                        """
              -- SVG with hover background shadow using SVG filter referenced in CSS
              svg
                [ width "120"
                , height "120"
                , viewBox "0 0 120 120"
                , css [ hover [ property "filter" "url(#shadow)" ] ]
                ]
                [ Svg.Styled.filter [ id "shadow" ] [ feDropShadow [ stdDeviation "3", dx "0.2", dy "0.4" ] [] ]
                , rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] []
                ]            
            """
                    ]
                ]

            -- SVG with background with CSS drop-shadow (there's no filter property on css in the library)
            , svg
                [ width "120"
                , height "120"
                , viewBox "0 0 120 120"
                , css [ hover [ property "filter" "drop-shadow(3px 5px 2px rgb(0 0 0 / 0.4))" ] ]
                ]
                [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] []
                ]
            , pre []
                [ code []
                    [ text
                        """
              -- SVG with hover background using CSS drop-shadow 
              svg
                [ width "120"
                , height "120"
                , viewBox "0 0 120 120"
                , css [ hover [ property "filter" "drop-shadow(3px 5px 2px rgb(0 0 0 / 0.4))" ] ]
                ]
                [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] []
                ]            
            """
                    ]
                ]
            ]



{--
            -- SVG with background shadow. But we can't have this with hover.
              svg
                [ width "120"
                , height "120"
                , viewBox "0 0 120 120"
                , onMouseOver Noop
                , css [ hover [ backgroundColor (Css.rgb 255 0 0) ] ]
                ]
                [ Svg.Styled.filter [ id "shadow" ] [ feDropShadow [ stdDeviation "3", dx "0.2", dy "0.4" ] [] ]
                , g [ Svg.Styled.Attributes.filter "url(#shadow)" ] [ rect [ x "10", y "10", width "100", height "100", rx "15", ry "15" ] [] ]
                ]
-}
