-- | 'Cofunctor' is a structure from category theory dual to 'Functor'
--
-- A 'Functor' is defined by the operation 'fmap':
--
-- > fmap :: (a -> b) -> (f a -> f b)
--
-- This means that its dual must be defined by the following operation:
--
-- > cofmap :: (b -> a) -> (f b -> f a)
--
-- Since beginning his investigations, the author of this package has discovered
-- that this pattern is /at least/ as commonly used as 'Functor'. In fact, many
-- ubiquitous Haskell types (e.g. @[]@, 'Maybe', @((->) a)@ turn out to have a
-- 'Cofunctor' instance.
module Data.Cofunctor
    ( Cofunctor (..)
    ) where

import Control.Monad (liftM)

-- | 'Cofunctor' is a structure from category theory dual to 'Functor'
class Cofunctor f where
    cofmap :: (b -> a) -> f b -> f a

instance Cofunctor [] where
    cofmap _ []       = []
    cofmap f (x : xs) = f x : cofmap f xs

instance Cofunctor Maybe where
    cofmap _ Nothing  = Nothing
    cofmap f (Just x) = Just (f x)

instance Cofunctor (Either e) where
    cofmap _ (Left e)  = Left e
    cofmap f (Right x) = Right (f x)

instance Cofunctor ((->) a) where
    cofmap = (.)

instance Cofunctor ((,) a) where
    cofmap f (e, x) = (e, f x)

instance Cofunctor IO where
    cofmap = liftM
