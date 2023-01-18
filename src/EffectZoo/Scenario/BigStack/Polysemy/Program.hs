{-# LANGUAGE TypeApplications, FlexibleContexts #-}

module EffectZoo.Scenario.BigStack.Polysemy.Program where

import Data.Foldable
import Control.Monad
import Polysemy
import Polysemy.Reader
import EffectZoo.Scenario.BigStack.Polysemy.Identity
import Polysemy.State

program :: (Member (Reader Int) effs, Member Identity effs, Member (State Int) effs) => Sem effs ()
program = do
  n <- ask @Int
  foldl' (\b _ -> identity (local @Int (+1) b))
         (ask @Int >>= \n' -> replicateM_ n' (modify (+ n')))
         [0..n]
{-# NOINLINE program #-}
