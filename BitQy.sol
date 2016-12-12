pragma solidity ^0.4.4;

import "Token.sol";


contract BitQy is Token {

    string public name = "BitQy";
    string public symbol = "BQY";
    uint public decimals = 8;
    uint public totalSupply = 10000000000;

    function BitQy() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function toggleTradeable() {
        if (msg.sender == owner) {
            tradeable = true;
        } else {
            throw;
        }
    }

}