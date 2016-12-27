/**
 * Reviewed:
 * Current version is 0.4.7 (20th of December). Please update.
 */
pragma solidity ^0.4.4;

import "Token.sol";

/**
 * Reviewed:
 * Added comments (see below)
 */
contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";
    uint public decimals = 8;

    // Minting ten billion digital tokens or coins created on the Ethereum Blockchain 
    // totalSupply is OK - it fits in (2^256 - 1).
    uint public totalSupply = 10000000000;

    function BitQy() {
        owner = msg.sender;

        // All tokes are initially preminted and 
        // the owner of all tokens is this contract creator
        balances[owner] = totalSupply;
    }

    /**
     * Reviewed:
     * Can use function modifier, for example isOwner
     * 
     */
    function toggleTradeable() {
        if (msg.sender == owner) {
            // BUG! 'Toggle' means tradeable variable should flip its value
            // from 'true' to 'false' and from 'false' to 'true'
            // 
            // Old code:
            // tradeable = true

            // Style - you should move this method to contract where 'tradeable' variable 
            // is defined -> i.e. to 'token.sol'.
            tradeable = !tradeable;
        } else {
            throw;
        }
    }

}
