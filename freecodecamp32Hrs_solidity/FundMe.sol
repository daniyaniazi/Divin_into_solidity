// Get funds from users
// Withdraw funds
// Set a minimum value in USD

// SPDX-License-Identifier: MIT
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
pragma solidity  ^0.8.8;

contract FundMe{
    address public  owner;
    constructor(){
        // gets called when deployed
        owner = msg.sender;
    }
    using PriceConverter for uint256;
    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;
    uint256 public minimumUSD = 50 * 1e18;
    function fund() public payable{
        // require -> if condition match or else revert
        // revert -> undo any action that happen befire and send the remaining gas back
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough funds"); // 1e18 == 1 * 10 ** 18 = 1000000000000000000 wei = 1 eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=msg.value + addressToAmountFunded[msg.sender];
    }

    
    function withdraw() public onlyOwner{
            for(uint256 funderIndex=0;funderIndex<funders.length; funderIndex=funderIndex+1){
                address funder=funders[funderIndex];
                addressToAmountFunded[funder]=0;
                funders=new address[](0);

                // Transfering Eth
                //1. transfer
                payable(msg.sender).transfer(address(this).balance);
                //2. send
                bool sendSuccess =  payable(msg.sender).send(address(this).balance);
                require(sendSuccess,"Send Failed"); //revert

                //3. call
                //lower level command
                (bool callSuccess , bytes memory dataReturned)=payable(msg.sender).call{value:address(this).balance}("");
                require(callSuccess,"Call Failed"); 
             
            }
    }

    modifier onlyOwner {
        require (msg.sender==owner , "Sender is not an owner");
        _;
    }
}