// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    
    //creates an array of type contract we imported
    SimpleStorage[] public listOfSimpleStorageContracts;

    //in previos code new instances were created but as soon as the new instance was created the address to last one was lost
    //we create new instances and store them in array so the old addresses are not lost 
    function createSimpleStorage() public{
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
}