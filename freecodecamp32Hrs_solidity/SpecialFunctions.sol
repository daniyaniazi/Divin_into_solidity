// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FallBackExample{
    uint256 public result;

    receive() external payable{
        // when ever we send ethereum ot make a transaction as long as no data is associated with a transaction this recieve function will trigger
        result += 1;  
    }

    // when data is send along with transaction
    fallback() external payable{
        result +=3;

    }
}