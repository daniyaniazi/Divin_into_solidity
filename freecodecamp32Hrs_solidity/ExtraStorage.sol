// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./basics.sol";

// Inheritance
contract ExtraStorage is SimpleStorage{
    // override
    // virtual override
    function store(uint256 _favoriteNumber) public override
        {
            favoriteNumber=_favoriteNumber+5;
        }

}