pragma solidity ^0.4.7;

import 'Token.sol';

contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";

    bool public tradable = false;
    address public owner = 0x0;

    function BitQy() {
        owner = msg.sender;

        initialSupply = 10000000000;

        balances[owner] = totalSupply();
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        } else {
            throw;
        }
    }

    function() {
        throw; 
    }

    function kill() onlyOwner { 
        selfdestruct(owner);
    }

    function makeTradable() onlyOwner {
        tradable = true;
    }

    function transfer(address _to, uint256 _value) returns (bool success) {
        if ((msg.sender != owner) && !tradable) {
            throw;
        }

        success = Token.transfer(_to, _value);
        return;
    }
}
