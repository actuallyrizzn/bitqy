pragma solidity ^0.4.7;

import 'ERC20.sol';

contract Token is ERC20 {
    uint256 public initialSupply;
    mapping(address => uint) balances;

    function transfer(address _to, uint256 _value) returns (bool success) {
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