module EffectZoo.Scenario.CountDown where

import           Criterion
import qualified EffectZoo.Scenario.CountDown.FreerSimple.Main
                                               as FreerSimple
import qualified EffectZoo.Scenario.CountDown.MTL.LazyStateT
                                               as MTLLazyStateT
import qualified EffectZoo.Scenario.CountDown.MTL.StrictStateT
                                               as MTLStrictStateT
import qualified EffectZoo.Scenario.CountDown.Polysemy.Main
                                               as Polysemy
import qualified EffectZoo.Scenario.CountDown.Reference
                                               as Reference

benchmarks :: [Benchmark]
benchmarks = do
  (implementation, countDown) <-
    [ ("mtl (lazy)"    , nf MTLLazyStateT.countDown)
    , ("mtl (strict)"  , nf MTLStrictStateT.countDown)
    , ("freer-simple"  , nf FreerSimple.countDown)
    , ("polysemy"      , nf Polysemy.countDown)
    , ("Reference"     , nf Reference.countDown)
    ]

  pure $ bgroup implementation $ flip map [100, 1000] $ \n ->
    bench (show n) (countDown n)
