module EffectZoo.Scenario.BigStack where

import           Criterion
import qualified EffectZoo.Scenario.BigStack.FreerSimple.Main
                                               as FreerSimple
import qualified EffectZoo.Scenario.BigStack.MTL.Main
                                               as MTL
import qualified EffectZoo.Scenario.BigStack.Polysemy.Main
                                               as Polysemy

benchmarks :: [Benchmark]
benchmarks = do
  (implementation, bigStacks) <-
    [
    --   ( "freer-simple"
    --   , [ (0 , FreerSimple.bigStack0)
    --     , (1 , FreerSimple.bigStack1)
    --     , (5 , FreerSimple.bigStack5)
    --     , (10, FreerSimple.bigStack10)
    --     , (20, FreerSimple.bigStack20)
    --     ]
    --   )
    -- , ( "mtl"
    --   , [ (0 , MTL.bigStack0)
    --     , (1 , MTL.bigStack1)
    --     , (5 , MTL.bigStack5)
    --     , (10, MTL.bigStack10)
    --     , (20, MTL.bigStack20)
    --     ]
    --   )
      ( "polysemy"
      , [ (0 , Polysemy.bigStack0)
        , (1 , Polysemy.bigStack1)
        , (5 , Polysemy.bigStack5)
        -- Yeah. Too slow.
        -- , (10, Polysemy.bigStack10)
        -- , (20, Polysemy.bigStack20)
        ]
      )
    ]

  pure $ bgroup implementation $ flip map bigStacks $ \(stackSize, go) ->
    bench (show stackSize) (nf go 0)
