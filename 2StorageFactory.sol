// SPDX-License-Identifier: MIT

/*  
in this we deployed one contract from another contract
but we copied the whole contract then deployed it using another contract, no use of import
so if some change in the code we copied is done we have to make same changes here also  
*/
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray, dynamic size;
    Person[] public listOfPeople;

    //mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

contract StorageFactory{

    //creates a variable of contract we copied 
    SimpleStorage public simpleStorage;

    //calls the copied contract, basically it creates a new SimpleStoragecontract and stores its address in simpleStorage
    //everytime the function is called a new instance is created and stored
    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }

}