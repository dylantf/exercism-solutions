module BankAccount
  ( BankAccount,
    closeAccount,
    getBalance,
    incrementBalance,
    openAccount,
  )
where

import Control.Concurrent.STM

type Balance = Maybe Integer

newtype BankAccount = BankAccount (TVar Balance)

openAccount :: IO BankAccount
openAccount = BankAccount <$> newTVarIO (Just 0)

closeAccount :: BankAccount -> IO ()
closeAccount account = updateBalance account Nothing

getBalance :: BankAccount -> IO (Maybe Integer)
getBalance (BankAccount account) = readTVarIO account

updateBalance :: BankAccount -> Maybe Integer -> IO ()
updateBalance (BankAccount account) balance = atomically $ writeTVar account balance

incrementBalance :: BankAccount -> Integer -> IO (Maybe Integer)
incrementBalance account amount = do
  currentBalance <- getBalance account
  _ <- case currentBalance of
    Just b -> updateBalance account (Just (b + amount))
    Nothing -> updateBalance account Nothing
  getBalance account