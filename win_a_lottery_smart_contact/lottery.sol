// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;
//version

contract lotter{
    //manager
    address public manager;
    // participants
    address  payable[] public participants;
    
    constructor(){
        manager= msg.sender ;
        // global variable  - manager will be the one who is deploying the contract and this contract address will ultimately become the managaer address
    } 
   
    // to transfer some ommount of ether in this contract 
    // one time use only
    receive() external payable {
        require(msg.value ==1 ether);
        // adding the participant address who is buying the loterry
        participants.push(payable(msg.sender));
    }
   function GetBalance() public view returns(uint){
    //   only manager can view the balance
        require(msg.sender == manager);
        return address(this).balance;
    }
    
    function random() public view returns(uint){
        // generate a complete random number
        // block is a global variable
        return uint(keccak256(abi.encode(block.difficulty , block.timestamp, participants.length)));
    }
    
    function selectWinner() public {
         address payable winner;
        //return winner address
         require(msg.sender == manager);
         require(participants.length >= 3);
         uint randomValue = random();
         uint index = randomValue % participants.length; //remainder is always less than the no of particapnt
         winner = participants[index];
         winner.transfer(GetBalance());
         //reset the participants
         participants = new address payable[](0);
         
    }
}S