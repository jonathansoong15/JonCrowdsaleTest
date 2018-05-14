pragma solidity ^0.4.15;

import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import "zeppelin-solidity/contracts/token/MintableToken.sol";

import "./JonTestToken.sol";

contract JonTestCrowdsale is Crowdsale {
    function JonTestCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) 
        Crowdsale(_startTime, _endTime, _rate, _wallet)
    {

    }

    function createTokenContract() internal returns (MintableToken) {
        return new JonTestToken(1000);
    }
}