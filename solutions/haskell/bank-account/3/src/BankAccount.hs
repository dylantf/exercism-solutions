module BankAccount (BankAccount, closeAccount, getBalance, incrementBalance, openAccount) where

import Control.Concurrent.STM

type BankAccount = TVar (Maybe Integer)

openAccount :: IO BankAccount
openAccount = newTVarIO (Just 0)

closeAccount :: BankAccount -> IO ()
closeAccount account = updateBalance account Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance = readTVarIO

updateBalance :: BankAccount -> Maybe Integer -> IO ()
updateBalance account balance = atomically $ writeTVar account balance

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = atomically $ do
  newBalance <- fmap (+ amount) <$> readTVar account
  writeTVar account newBalance
  return newBalance