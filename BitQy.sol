pragma solidity ^0.4.7;

import 'Token.sol';

contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";
    bool public tradable;
    address public owner;

    /*
        Initiator
    */

    function BitQy() {
        owner = msg.sender;
        initialSupply = 10000000000;
        balances[owner] = totalSupply();
        tradable = false;
    }

    /*
        Mortal Functions
    */

    function isOwner() returns (bool) {
        return msg.sender == owner;
    }

    function kill() { 
        if (isOwner()) selfdestruct(owner);
    }

    /*
        Custom overrides & functions
    */

    // Reject Ether
    function() {}

    // Make token tradable by anyone
    function makeTradable() returns (bool success) {
        if (isOwner()) {
            tradable = true;
            return true;
        } else {
            return false;
        }
    }

    // Wrapper function to test tradability in above function
    function transfer(address _to, uint256 _value) returns (bool success) {
        if (isOwner() || tradable) {
            return Token.transfer(_to, _value);
        } else {
            return false;
        }
    }
}