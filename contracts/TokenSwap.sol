// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TokenSwap {
    address private owner;
    uint private ethToNusdRate;
    uint private nusdToEthRate;
    uint private totalSupply;
    mapping(address => uint) private balances;

    AggregatorV3Interface internal priceFeed;

    event Deposit(address indexed user, uint ethAmount, uint nusdAmount);
    event Redeem(address indexed user, uint nusdAmount, uint ethAmount);

    constructor() {
        owner = msg.sender;
        ethToNusdRate = 2; // ETH to nUSD rate (50% of value)
        nusdToEthRate = 2; // nUSD to ETH rate (double the value)
        totalSupply = 0;
        priceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43); // Testnet Chainlink ETH/USD Price Feed
    }

    function deposit() external payable {
        uint ethAmount = msg.value;
        require(ethAmount > 0, "Invalid ETH amount.");
        uint ethPrice =  getETHUSDPrice();
        uint nusdAmount = (ethAmount*ethPrice)/ ethToNusdRate;
        balances[msg.sender] += nusdAmount;
        totalSupply += nusdAmount;
        emit Deposit(msg.sender, ethAmount, nusdAmount);
    }

    function redeem(uint nusdAmount) external {
        require(nusdAmount > 0, "Invalid nUSD amount.");
        uint ethPrice =  getETHUSDPrice(); 
        uint ethAmount = nusdAmount*ethPrice;
        uint256 nusdAmountRequired = ethAmount*2;
        require(balances[msg.sender] > nusdAmountRequired,"Insufficient nnUSD amount.");
        balances[msg.sender] -= nusdAmountRequired;
        totalSupply -= nusdAmountRequired;
        emit Redeem(msg.sender, nusdAmountRequired, ethAmount);
    }

    function getETHUSDPrice() public view returns (uint) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint(price)/1e8;
    }

    function getBalance(address account) public view returns (uint) {
        return balances[account];
    }

    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }
}
