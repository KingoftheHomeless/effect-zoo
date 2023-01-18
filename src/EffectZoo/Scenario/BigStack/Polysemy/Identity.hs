{-# language GADTs, FlexibleContexts, TypeOperators, DataKinds #-}
module EffectZoo.Scenario.BigStack.Polysemy.Identity where

import Polysemy

data Identity (m :: * -> *) a where
  Identity :: m a -> Identity m a
makeSem ''Identity

runIdentity :: Sem (Identity ': effs) a -> Sem effs a
runIdentity = interpretH $ \(Identity m) ->
  -- runH m -- v2
  runTSimple m -- v1

identityToIdentity :: Member Identity effs => Sem (Identity ': effs) a -> Sem effs a
identityToIdentity = interpretH $ \(Identity m) ->
  -- identity (runH m) -- v2
  identity (runTSimple m) -- v2
