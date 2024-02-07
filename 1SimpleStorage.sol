// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    //structure to store name of person and favourite no. of that person
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public Array, dynamic size array of structure;
    Person[] public listOfPeople;

    //mapping
    //maps strings to integers, in this case names with favourite numbers, so if a person name is given this returns their favourite no.
    mapping(string => uint256) public nameToFavoriteNumber;

    //gets a no. and assigns it to myFavoriteNumber
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    //gives the value that is assigned to myFavoriteNumber
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //adds values i.e. names and favourite no. in the dynamic array also asks for a name to get their favouriteno. if they are added in the blockchain
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}


contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}