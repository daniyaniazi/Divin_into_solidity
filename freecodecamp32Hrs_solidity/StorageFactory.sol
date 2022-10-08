// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./basics.sol";
contract StorageFatory{
    SimpleStorage public simpleStorage;
    function createSimpleStorageContract () public {
        // how its know what simple storage contract look alike?
        simpleStorage = new SimpleStorage();

    }
}