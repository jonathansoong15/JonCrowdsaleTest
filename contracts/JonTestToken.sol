pragma solidity ^0.4.15;

import "zeppelin-solidity/contracts/token/MintableToken.sol";
import "zeppelin-solidity/contracts/lifecycle/Pausable.sol";

contract JonTestToken is MintableToken, Pausable {
    string public constant name = "JonTestToken";
    string public constant symbol = "JTT";
    uint8 public constant decimals = 18;

    uint256 public cap;

    constructor(uint256 _cap) public {
        require(_cap > 0);
        cap = _cap;
    }

    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        require(totalSupply.add(_amount) <= cap);

        return super.mint(_to, _amount);
    }

    function transfer(address _to, uint256 _value) whenNotPaused returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) whenNotPaused returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}
