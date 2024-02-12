// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//contract to get the price of ETH in realtime n revert the txn if the funded amt is smaller than the required amt

import{AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minimumUsd=5e18;  //since getConversionRate returns the value with 18 decimals so minimmumUsd must hv 18 decimals for comparison in fund fn

    //this fn reverts the transaction if the fun amt is smaller than the required, n sends the corresponding msg
    function fund() public payable{
        require(getConversionRate(msg.value) >= minimumUsd, "Not enough USD sent");
    }

    //this fn returns the value of ETH in terms of USD
    function getPrice() public view returns(uint256){
        //Address - 0x694AA1769357215DE4FAC081bf1f309aDC325306 , address we got from chainlink price feed for seepolia testnet
        //ABI
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)=priceFeed.latestRoundData();
        //we get a whole number so we need to convert it into decimal to get the exact price of Eth in usd
        //since price is int256 n this fn returns uint256 we need to typecast it into uint256
        return uint256( price * 1e10);
    }

    //this fn takes the amt which is beinf funded by someone to convert in into and check if its smaller than minimumUSD
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        //we divide by 1e18 i.e. 10^18 as both ethPrice has 18 decimal places so when multiplied it goes to 10^36 so we divide by 10^18 to make the decimals upto 18 places only
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}