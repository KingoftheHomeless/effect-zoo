module EffectZoo.Scenario.BigStack.Polysemy.Main where

import Polysemy
import Polysemy.Reader
import Polysemy.State
import Data.Function
import EffectZoo.Scenario.BigStack.Polysemy.Identity
import EffectZoo.Scenario.BigStack.Polysemy.Program

bigStack0 :: Int -> Int
bigStack0 s = program & execState s & runIdentity & runReader n & run

bigStack1 :: Int -> Int
bigStack1 s = program & identityToIdentity & execState s & runIdentity & runReader n & run

bigStack5 :: Int -> Int
bigStack5 s =
  program
    & identityToIdentity
    & identityToIdentity
    & execState s
    & identityToIdentity
    & identityToIdentity
    & runIdentity
    & runReader n
    & run

bigStack10 :: Int -> Int
bigStack10 s =
  program
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & execState s
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & runIdentity
    & runReader n
    & run

bigStack20 :: Int -> Int
bigStack20 s =
  program
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & execState s
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & identityToIdentity
    & runIdentity
    & runReader n
    & run

n :: Int
n = 500
