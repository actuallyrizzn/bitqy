pragma solidity ^0.4.7;

import 'Token.sol';

/**
 * Reviewed:
 * Added comments (see below)
 */
contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";

    bool public tradable = false;
    address public owner = 0x0;

    /**
     * Reviewed: good
     */
    function BitQy() {
        owner = msg.sender;

        // Minting ten billion digital tokens or coins created on the Ethereum Blockchain 
        // totalSupply is OK - it fits in (2^256 - 1).
        initialSupply = 10000000000;

        // All tokes are initially preminted and 
        // the owner of all tokens is this contract creator
        balances[owner] = totalSupply();

        // Commented this and made explicit initialization of this var. (see above)
        //tradable = false;
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        } else {
            throw;
        }
    }

    /**
     * Reviewed: fixed bug
     */
    function() {
        // Reject Ether sent directly to this contract

        // BUG. I've added 'throw' because we need to return ETH back to user if he accidentally sent it here
        // directly
        throw; 
    }

    /**
     * Reviewed: 
     * BUG - changed modifier name: onlyBy(owner) to onlyOwner
     */
    function kill() onlyOwner { 
        // will send all contract's current balance to owner
        // please see this - http://ethereum.stackexchange.com/questions/315/why-are-suicides-used-in-contract-programming
        selfdestruct(owner);
    }

    /**
     * Reviewed:
     * removed unneeded return value
     */
    // Make token tradable by anyone
    function makeTradable() onlyOwner {
        tradable = true;
        // return true;
    }

    /**
     * Reviewed: 
     * BUG - Changed signature because override was not allowed
     */
    // This is an override of 'transfer' method from Token contract
    function transfer(address _to, uint256 _value) returns (bool success) {
        if ((msg.sender != owner) && !tradable) {
            throw;
        }

        // BUG - fixed
        success = Token.transfer(_to, _value);
        return;

        // return Token.transfer(_to, _value);
    }
}
