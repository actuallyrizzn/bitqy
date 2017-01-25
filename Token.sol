pragma solidity ^0.4.7;

import 'ERC20.sol';

contract Token is ERC20 {
    uint256 public initialSupply = 0;
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;

    function transfer(address _to, uint256 _value) returns (bool success) {
        if ((balances[msg.sender] >= _value) && ((balances[_to] + _value) > balances[_to])) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;

            Transfer(msg.sender, _to, _value);
            success = true;
        } else {
            success = false;
        }
        return;
    }

    function balanceOf(address who) constant returns (uint256 out) {
        out = balances[who];
        return;
    }

    function totalSupply() constant returns (uint256 out) {
        out = initialSupply;
        return;
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            success = true;
        } else { 
            success = false
        }

        return;
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
