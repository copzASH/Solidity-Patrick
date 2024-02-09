// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorage() public{
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //this function assigns values to myFavouriteNumber using the store function of SimpleStorage
    //it calls a specific instance of SimpleStorage contract by passing _simpleStorageContract(it can be understood as the address of the specific contract instance in which we want to update the value
    //_newSimpleStorageNumber is the number to be stored in that specific instance
    function sfStore(uint256 __simpleStorageContract, uint256 _newSimpleStorageNumber) public{
        //Address
        //ABI - Application Binary Innterface
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[__simpleStorageContract];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    //this function is used to view the updated value of the instance selected
    /*if for understanding, a contract = class
    we access function of a class by classNmae.functionName();
    same is done here, retrieve funtion of specific instance mySimpleStorage is called here 
    */
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}