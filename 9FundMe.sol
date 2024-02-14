// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//contract to get the price of ETH in realtime n revert the txn if the funded amt is smaller than the required amt
//keeping track of who sends us what amt of funds
import{AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minimumUsd=5e18;  
    address[] public funders;
    /*mapping(address => uint256) public addressToAmountFunded;
        we can define the same mapping as done below
    */
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    //if we do like this we can name the type in mapping, here funder is mapped to amountFunded

    function fund() public payable{
        require(getConversionRate(msg.value) >= minimumUsd, "Not enough USD sent");
        funders.push(msg.sender); //whenever a txn is done, details are pushed into the funder araay of addesses
                                    // "msg.sender" is a global variable which stores the address of whoever calls this function
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        /*
            this is done to increase the fundedAmount if someone funds more than once
            "msg.value" fetches the current amt being funded and "addressToAmountFunded[msg.sender]" fetches the previously funded amount by the same account or address
            then the fetched values are added and the "addressToAmountFunded[msg.sender]" is updated
        */
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,)=priceFeed.latestRoundData();
        return uint256( price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}