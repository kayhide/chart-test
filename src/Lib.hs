module Lib where

import Graphics.Rendering.Chart.Easy
import Graphics.Rendering.Chart.Backend.Diagrams(toFile)
import Graphics.Rendering.Chart.Gtk

signal :: [Double] -> [(Double,Double)]
signal xs = [ (x,(sin (x*3.14159/45) + 1) / 2 * (sin (x*3.14159/5))) | x <- xs ]

someFunc :: IO ()
-- someFunc = toFile def "mychart.svg" $ do
someFunc = toWindow 400 400 $ do
    layout_title .= "Amplitude Modulation"
    setColors [opaque blue, opaque red]
    plot (line "am" [signal [0,(0.5)..400]])
    plot (points "am points" (signal [0,7..400]))
