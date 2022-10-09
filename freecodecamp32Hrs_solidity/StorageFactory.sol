// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./basics.sol";
contract StorageFatory{
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract () public {
        // how its know what simple storage contract look alike?
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // function to access store in simple storage contract
    function sfStore(uint256 _simpleStorageIndex , uint256 _simpleStorageNumber) public{
        // To interact with contarct you need : 
        // 1. Address
        // 2. ABI - appkication Binary Interface

        SimpleStorage simpleStorage= SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        simpleStorage.store(_simpleStorageNumber);
    }

    // function to read
     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
         SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
         return simpleStorage.retrieve();
     }

}