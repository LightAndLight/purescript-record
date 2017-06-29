module Data.Record where

import Data.Symbol (class IsSymbol, SProxy)

-- | Left-biased record merge
foreign import merge
  :: forall l r result
   . Union l r result
  => Record l
  -> Record r
  -> Record result

-- | Record restriction
foreign import restrict
  :: forall label a tail result
   . IsSymbol label
  => RowCons label a tail result
  => SProxy label
  -> Record result
  -> Record tail

-- | Record extension
foreign import extend
  :: forall label a tail result
   . IsSymbol label
  => RowCons label a tail result
  => SProxy label
  -> a
  -> Record tail
  -> Record result
