# Overview

## Smart contract 

### Solidity Version and Imports:
  The contract specifies that it requires Solidity version 0.8.0 and imports the AggregatorV3Interface from the Chainlink contracts library.

### Contract Structure:
  The contract is named "TokenSwap" and includes several state variables and mappings:

### ethToNusdRate:
  A uint variable representing the conversion rate from ETH to a fictional token called nUSD.
  
### nusdToEthRate:
  A uint variable representing the conversion rate from nUSD to ETH.
  
### totalSupply:
  A uint variable representing the total supply of nUSD tokens.
  
### balances:
   A mapping that stores the balances of nUSD tokens for each address.
   
### AggregatorV3Interface: 
  The contract includes an internal instance of the AggregatorV3Interface from the Chainlink library. It is used to obtain the ETH/USD price feed.

### Events: 
  The contract defines two events:

### Deposit: 
  Triggered when a user makes a deposit, indicating the amount of ETH and nUSD tokens received.
### Redeem:
  Triggered when a user redeems nUSD tokens for ETH, indicating the amount of nUSD tokens redeemed and the corresponding ETH amount received.
### Constructor:
  The constructor sets the initial values for the contract, including the owner, conversion rates, total supply, and the address of the Chainlink ETH/USD price feed contract.
  
### Deposit Function:
   The deposit function allows users to deposit ETH and receive nUSD tokens based on the current ETH/USD exchange rate. The ETH amount is converted to nUSD based on the ethToNusdRate, and the user's balance and the total supply are updated accordingly. The function emits a Deposit event.

### Redeem Function:
  The redeem function allows users to redeem a specified amount of nUSD tokens for ETH. The nUSD amount is converted to ETH based on the nusdToEthRate, and the user's balance and the total supply are updated accordingly. The function emits a Redeem event.

### getETHUSDPrice Function:
  The getETHUSDPrice function retrieves the latest ETH/USD price from the Chainlink price feed contract.

### getBalance Function:
  The getBalance function returns the nUSD token balance of a given address.

### getTotalSupply Function: 
  The getTotalSupply function returns the total supply of nUSD tokens

## Frontend
I have used ReactJS for the frontend.There is two one text field and two buttons.

### Deposite
This button is used to depositing the ETH.

### Reedem 
This button is used to Reedem the nUSD from the balance

# Testnet

I have Sepolia testnet for this project.

# How to Run the project

Note : Make sure that you have NodeJS envinornment and Sepolia testnet. 

## 1. Get Test Sepolia eth

Here you can get test Sepolia eth : https://sepoliafaucet.com/
  
## 2.Run Project

Run the command "npm start" in project directory.

## Live project : https://tokenswappingethtonused.netlify.app/ 
