pragma solidity ^0.4.7;

import 'ERC20.sol';

contract Token is ERC20 {
    uint256 public initialSupply;
    mapping(address => uint) balances;

    /* Note: I have this transfer function marked as internal
    	to prevent it from being called publically since it's
    	not using the tradable modifier that I'm using in the
    	BitQy.transfer override.

    	I'm not sure if this is correct.

    	Also, should balances be here or in BitQy contract?
    */
    function transfer(address _to, uint256 _value) internal returns (bool success) {
        if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function balanceOf(address who) constant returns (uint256) {
        return balances[who];
    }

    function totalSupply() constant returns (uint256) {
        return initialSupply;
    }
}