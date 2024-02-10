// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

//import 1SimpleStorage.sol from another directory
import {SimpleStorage} from "../1SimpleStorage.sol";

//inheritance
//this AddFiveStorage contract inherits all the functionalities of SimpleStorage
contract AddFiveStorage is SimpleStorage{

    /*
    to change the working of an already existing function in base class we override it 
    and to do that we use keyword "override" while adding new functionality
    but still we get error because the function we want to change should be virtual in the parent contract
    if the function is not virtual in parent contract we cant override it
    */
    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;
    }

}