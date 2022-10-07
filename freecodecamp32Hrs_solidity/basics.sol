// SPDX-License-Identifier:MIT
    pragma solidity ^0.8.12;
    // means above and equal version 

contract SimpleStorage{

        //variables
        uint256 favoriteNumber;

        //structures -> custom datatype
        struct People{
            uint256 favoriteNumber;
            string name;
        }

        People public person = People({
            favoriteNumber:4,name:"Pattric"
        });

        // List that store sequence of data
        // dynamic array 
        // [3] static size
        People[] public peoples;

        function addPerson(string memory _name , uint256 _favoriteNumber) public{
            People memory newPerson = People({favoriteNumber:_favoriteNumber,name:_name});
            peoples.push(newPerson);

        }


        // Functions
        function store(uint256 _favoriteNumber) public {
            favoriteNumber=_favoriteNumber;
            // however if called inside a gas constly function it will consume gas
            retrieve();
        }

        // View & Pure -> disaalow any modification of blockchain
        // do not consume gas
        // View VS Pure -> View allow only read from blockchain , Pure disallow state reading from blockchain

        function retrieve() public view returns(uint256){
            return favoriteNumber;
        }
    }