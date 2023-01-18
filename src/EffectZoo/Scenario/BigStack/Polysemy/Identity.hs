{-# language GADTs, FlexibleContexts, TypeOperators, DataKinds #-}
module EffectZoo.Scenario.BigStack.Polysemy.Identity where

import Polysemy
import Polysemy.Meta

data IdentityMeta :: MetaEffect where
  Identity :: z a -> IdentityMeta '[z :% Identity] m a

type Identity = Meta IdentityMeta

identity :: Member Identity r => Sem (Identity ': r) a -> Sem r a
identity m = sendMeta (Identity m)

runIdentity :: Sem (Identity ': effs) a -> Sem effs a
runIdentity = interpretMeta $ \(Identity m) ->
  runMeta runIdentity m

identityToIdentity :: Member Identity effs => Sem (Identity ': effs) a -> Sem effs a
identityToIdentity = interpretMeta $ \(Identity m) ->
  runMeta identity m
