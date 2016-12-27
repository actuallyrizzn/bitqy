pragma solidity ^0.4.7;

import 'Token.sol';

contract BitQy is Token {

    string public name = "BitQy";
    string public symbol = "BQY";
    bool public tradable;
    address public owner;

    function BitQy() {
        owner = msg.sender;
        initialSupply = 10000000000;
        balances[owner] = totalSupply();
        tradable = false;
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        } else {
            throw;
        }
    }

    modifier canTrade {
        if (msg.sender == owner || tradable) {
            _;
        } else {
            throw;
        }
    }

    // Reject Ether
    function() {}

    function kill() onlyBy(owner) { 
        selfdestruct(owner);
    }

    // Make token tradable by anyone
    function makeTradable() onlyOwner() returns (bool success) {
        tradable = true;
        return true;
    }

    // Wrapper function to test tradability in above function
    function transfer(address _to, uint256 _value) canTrade() returns (bool success) {
        return Token.transfer(_to, _value);
    }
}