import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

main =
  Html.beginnerProgram {view=view, model=model, update=update}

--model
type alias Model = 
    { 
        board: List (List Int)
    }

model : Model
model = 
    { 
        board= [
            [0, 0, 5, 0, 0, 6, 3, 0, 0],
            [0, 0, 0, 0, 0, 0, 4, 0, 0],
            [9, 8, 0, 7, 4, 0, 0, 0, 5],
            [1, 0, 0, 0, 7, 0, 9, 0, 0],
            [0, 0, 9, 5, 0, 1, 6, 0, 0],
            [0, 0, 8, 0, 2, 0, 0, 0, 7],
            [6, 0, 0, 0, 1, 8, 0, 9, 3],
            [0, 0, 1, 0, 0, 0, 0, 0, 0],
            [0, 0, 4, 2, 0, 0, 5, 0, 0]
        ]
    }

--update
type Msg = None

update : Msg -> Model -> Model
update msg model = model

--view
stylesheet = 
  let
    tag = 
      "link"

    attrs = 
      [ attribute "Rel" "stylesheet"
      , attribute "property" "stylesheet"
      , attribute "href" "main.css"
      ]

    children=[]
  in
    node tag attrs children

viewHeader : Html Msg
viewHeader = 
    div []
        [h1 [][text "Sudoku Solver"]]

row : List Int -> Html Msg
row arr = 
    div [class "row"] (List.map (\i -> placeHolder i) (arr))

placeHolder : Int -> Html Msg 
placeHolder i =
    let
        item = 
            if i == 0 then
                ""
            else 
                toString i
    in
        div
            [ class ("place-holder grid-color"), id item]
            [text item]

viewRow : List Int -> Html Msg
viewRow boardRow = row boardRow


view model = 
    div []
        [stylesheet, 
         viewHeader,
         div [ class "marker-board" ]
            (List.map
                (\row -> viewRow row)
                model.board
            )]