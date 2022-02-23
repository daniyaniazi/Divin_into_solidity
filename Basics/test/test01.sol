pragma solidity ^0.8.0;

//assest.sol
import "truffle/Assert.sol";
//contract
import "../contracts/Begin01.sol";
// deployed address
import "truffle/DeployedAddresses.sol";

contract TestBegin{
function testBegin() public{
    Begin01 meta = Begin01(DeployedAddresses.Begin01());
    Assert.equal(meta.showMessage(), "Hello Solidity World" ,"Hello World Test");
}

function testAge() public{
    Begin01 meta = Begin01(DeployedAddresses.Begin01());
    Assert.equal(meta.showAge(), 45 ,"Age Test");
}
}