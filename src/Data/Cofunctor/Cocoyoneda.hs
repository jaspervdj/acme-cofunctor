{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}

-- | 'Cocoyoneda' gives a cofree cofunctor for any type constructor.
module Data.Cofunctor.Cocoyoneda
    ( Cocoyoneda(..)
    , liftCocoyoneda
    , lowerCocoyoneda
    , hoistCocoyoneda
    ) where

import Data.Cofunctor (Cofunctor(..))

data Cocoyoneda f a where
    Cocoyoneda :: (a -> b) -> f a -> Cocoyoneda f b

instance Cofunctor (Cocoyoneda f) where
    cofmap f (Cocoyoneda g x) = Cocoyoneda (f . g) x

liftCocoyoneda :: f a -> Cocoyoneda f a
liftCocoyoneda = Cocoyoneda id

lowerCocoyoneda :: Cofunctor f => Cocoyoneda f a -> f a
lowerCocoyoneda (Cocoyoneda f x) = cofmap f x

hoistCocoyoneda :: (forall a. f a -> g a) -> Cocoyoneda f b -> Cocoyoneda g b
hoistCocoyoneda f (Cocoyoneda g x) = Cocoyoneda g (f x)
