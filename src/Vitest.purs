module Vitest
  ( bench
  , benchOnly
  , benchSkip
  , benchSkip_
  , benchTodo
  , describe
  , describeConcurrent
  , describeOnly
  , describeShuffle
  , describeSkip
  , describeTodo
  , expectToEqual
  , expectToMatchSnapshot
  , expectToNotEqual
  , test
  , testConcurrent
  , testFails
  , testOnly
  , testRunIf
  , testSkip
  , testSkipIf
  , testTodo
  )
  where

import Prelude

import Control.Promise (Promise, fromAff)
import Effect (Effect)
import Effect.Aff (Aff, Milliseconds(..))
import Effect.Class (liftEffect)

test :: String -> Aff Unit -> Effect Unit
test name action = test_ name (fromAff action)
foreign import test_ :: String -> Effect (Promise Unit) -> Effect Unit

testSkip :: String -> Aff Unit -> Effect Unit
testSkip name action = testSkip_ name (fromAff action)
foreign import testSkip_ :: String -> Effect (Promise Unit) -> Effect Unit

testSkipIf :: Boolean -> String -> Aff Unit -> Effect Unit
testSkipIf cond name action = testSkipIf_ cond name (fromAff action)
foreign import testSkipIf_ :: Boolean -> String -> Effect (Promise Unit) -> Effect Unit

testRunIf :: Boolean -> String -> Aff Unit -> Effect Unit
testRunIf cond name action = testRunIf_ cond name (fromAff action)
foreign import testRunIf_ :: Boolean -> String -> Effect (Promise Unit) -> Effect Unit

testOnly :: String -> Aff Unit -> Effect Unit
testOnly name action = testOnly_ name (fromAff action)
foreign import testOnly_ :: String -> Effect (Promise Unit) -> Effect Unit

testConcurrent :: String -> Aff Unit -> Effect Unit
testConcurrent name action = testConcurrent_ name (fromAff action)
foreign import testConcurrent_ :: String -> Effect (Promise Unit) -> Effect Unit

foreign import testTodo :: String -> Effect Unit

testFails :: String -> Aff Unit -> Effect Unit
testFails name action = testFails_ name (fromAff action)
foreign import testFails_ :: String -> Effect (Promise Unit) -> Effect Unit

bench :: String -> Milliseconds -> Aff Unit -> Effect Unit
bench name (Milliseconds time_ms) action = bench_ name time_ms (fromAff action)
foreign import bench_ :: String -> Number -> Effect (Promise Unit) -> Effect Unit

benchSkip :: String -> Milliseconds -> Aff Unit -> Effect Unit
benchSkip name (Milliseconds time_ms) action = benchSkip_ name time_ms (fromAff action)
foreign import benchSkip_ :: String -> Number -> Effect (Promise Unit) -> Effect Unit

benchOnly :: String -> Milliseconds -> Aff Unit -> Effect Unit
benchOnly name (Milliseconds time_ms) action = benchOnly_ name time_ms (fromAff action)
foreign import benchOnly_ :: String -> Number -> Effect (Promise Unit) -> Effect Unit

foreign import benchTodo :: String -> Effect Unit

foreign import describe :: String -> Effect Unit -> Effect Unit
foreign import describeSkip :: String -> Effect Unit -> Effect Unit
foreign import describeOnly :: String -> Effect Unit -> Effect Unit
foreign import describeConcurrent :: String -> Effect Unit -> Effect Unit
foreign import describeShuffle :: String -> Effect Unit -> Effect Unit

foreign import describeTodo :: String -> Effect Unit

expectToEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToEqual a b = liftEffect $ expectToEqual_ a b
foreign import expectToEqual_ :: forall a. a -> a -> Effect Unit

expectToNotEqual :: forall a. Eq a => a -> a -> Aff Unit
expectToNotEqual a b = liftEffect $ expectToNotEqual_ a b
foreign import expectToNotEqual_ :: forall a. a -> a -> Effect Unit

expectToMatchSnapshot :: forall a. a -> Aff Unit
expectToMatchSnapshot a = liftEffect $ expectToMatchSnapshot_ a
foreign import expectToMatchSnapshot_ :: forall a. a -> Effect Unit
