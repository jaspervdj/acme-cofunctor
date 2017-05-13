acme-cofunctor
==============

A `Cofunctor` is a structure from category theory dual to `Functor`.

We all know that a `Functor` is defined by the operation 'fmap':

    fmap :: (a -> b) -> (f a -> f b)

This means that its dual must be defined by the following operation:

    cofmap :: (b -> a) -> (f b -> f a)

Since beginning his investigations, the author of this package has discovered
that this pattern is _at least_ as commonly used as `Functor`. In fact, many
ubiquitous Haskell types (e.g. `[]`, `Maybe`, `((->) a)` turn out to have a
`Cofunctor` instance.
