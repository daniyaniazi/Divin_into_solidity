pragma solidity ^0.8.0;

contract Begin01{
    function showMessage() public view returns (string memory){
        return "Hello Solidity World";
    }

      function showAge() public view returns (int){
        return 21;
    }
}