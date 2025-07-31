module BankAccount
  ( BankAccount,
    closeAccount,
    getBalance,
    incrementBalance,
    openAccount,
  )
where

import Control.Concurrent.STM

type BankAccount = TVar (Maybe Integer)

openAccount :: IO BankAccount
openAccount = newTVarIO $ Just 0

closeAccount :: BankAccount -> IO ()
closeAccount account = do
  atomically $ writeTVar account Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance = readTVarIO

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = do
  balance <- getBalance account
  _ <- case balance of
    Just b -> atomically $ writeTVar account (Just (b + amount))
    Nothing -> atomically $ writeTVar account Nothing
  getBalance account