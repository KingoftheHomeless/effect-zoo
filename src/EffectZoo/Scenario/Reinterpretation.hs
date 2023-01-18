module EffectZoo.Scenario.Reinterpretation where

import           Criterion
import qualified EffectZoo.Scenario.Reinterpretation.FreerSimple.Main
                                               as FreerSimple
import qualified EffectZoo.Scenario.Reinterpretation.Polysemy.Main
                                               as Polysemy

benchmarks :: [Benchmark]
benchmarks = do
  (name, program) <-
    [ ("freer-simple"  , FreerSimple.listScenarios)
    , ("polysemy", Polysemy.listScenarios)
    ]
  pure $ bgroup name $ flip map [1, 10, 100] $ \n ->
    bench (show n) (nf program n)
