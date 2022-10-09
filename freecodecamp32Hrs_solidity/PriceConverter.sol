// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter{
    function getPrice() internal view returns(uint256){
        // ABI
        // Address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (
            /*uint80 roundID*/,
            int256 price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();

        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmmountInUSD = (ethPrice*ethAmmount) / 1e18;
        return ethAmmountInUSD;
    }

    function getVersion() internal view returns(uint256)
    {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }
}