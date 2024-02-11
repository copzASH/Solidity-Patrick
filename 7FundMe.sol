// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//contract to revert the transaction if the amount is smaller than the required 
contract FundMe{
    uint public minimumUsd =5;

    // 'payable" keyword is required to make a function recieve native blockchain token
    function fund() public payable{
        //we use "require" to force a transaction to do something, n get failed if it wasnt done
        //it reverts the transaction and send the gas fees back but transaction to any statement processessed before reverting is not sent back
        //to get the value sent with transaction we use "msg.value"
        require(msg.value >= minimumUsd, "Not enough USD sent");
    } 

}