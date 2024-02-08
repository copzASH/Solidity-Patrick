// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/*
//this will import all contracts from SimpleStorage  
import "./SimpleStorage.sol";
*/

//but if we want to only import specific contract from do this
import {SimpleStorage} from "./SimpleStorage.sol";

/*
//we can also import multiple contracts
import {SimpleStorage,SimpleStorage1} from "./SimpleStorage.sol";
*/
contract StorageFactory{

    //creates a variable of contract we imported 
    SimpleStorage public simpleStorage;

    //calls the copied contract, basically it creates a new SimpleStoragecontract and stores its address in simpleStorage
    //everytime the function is called a new instance is created and stored
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

}