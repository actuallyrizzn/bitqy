pragma solidity ^0.4.7;

import 'ERC20.sol';

/**
 * Reviewed:
 * Added comments (see below)
 */
contract Token is ERC20 {
    uint256 public initialSupply = 0;
    // Style: changed from uint to uint256
    mapping(address => uint256) balances;

    /**
     * Reviewed: good
     * Added comments (see below)
     * Fixed return style
     * Interger Overflow = OK, Checked

     * I changed the behaviour. 'transfer' from BitQy overrides current 'tranfer' method.
     */
    function transfer(address _to, uint256 _value) returns (bool success) {
        // instead of using SafeMath - we use explicit checking 
        if ((balances[msg.sender] >= _value) && ((balances[_to] + _value) > balances[_to])) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;

            Transfer(msg.sender, _to, _value);
            success = true;

            //return true;
        } else {
            success = false;

            //return false;
        }

        return;
    }

    /**
     * Reviewed: goood. Changed ret value style only
     */
    function balanceOf(address who) constant returns (uint256 out) {
        out = balances[who];
        return;

        // return balances[who];
    }

    /**
     * Reviewed: goood. Changed ret value style only
     */
    function totalSupply() constant returns (uint256 out) {
        out = initialSupply;
        return;

        // return initialSupply;
    }
}
