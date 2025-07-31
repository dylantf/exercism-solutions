{-# LANGUAGE NamedFieldPuns #-}

module BST
  ( BST,
    bstLeft,
    bstRight,
    bstValue,
    empty,
    fromList,
    insert,
    singleton,
    toList,
  )
where

data BST a
  = Empty
  | Node {left :: BST a, value :: a, right :: BST a}
  deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft Node {left} = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight Node {right} = Just right

bstValue :: BST a -> Maybe a
bstValue Empty = Nothing
bstValue Node {value} = Just value

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) Empty

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x Node {left, value, right}
  | x <= value = Node {value, left = insert x left, right}
  | otherwise = Node {value, left, right = insert x right}

singleton :: a -> BST a
singleton x = Node {left = Empty, value = x, right = Empty}

toList :: BST a -> [a]
toList Empty = []
toList Node {left, value, right} = toList left ++ (value : toList right)
