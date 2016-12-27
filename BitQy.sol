pragma solidity ^0.4.7;

import "Token.sol";

contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";
    bool public tradable;
    address public owner;

    function isOwner() returns (bool) {
        return msg.sender == owner;
    }

    function kill() { 
        if (isOwner()) selfdestruct(owner);
    }

    function BitQy() {
        owner = msg.sender;
        initialSupply = 10000000000;
        balances[owner] = totalSupply();
        tradable = false;
    }

    function makeTradable() returns (bool success) {
        if (isOwner()) {
            tradable = true;
            return true;
        } else {
            return false;
        }
    }

    function transfer(address _to, uint256 _value) returns (bool success) {
        if (isOwner() || tradable) {
            return Token.transfer(_to, _value);
        } else {
            return false;
        }
    }
}