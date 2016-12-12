pragma solidity ^0.4.4;

import 'Mortal.sol';
import 'ERC20.sol';
import 'SafeMath.sol';


contract Token is Mortal, ERC20, SafeMath {

    mapping(address => uint) balances;
    bool public tradeable = false;

    function transfer(address _to, uint _value) returns (bool success) {
        if (msg.sender == owner || tradeable == true) {
            balances[msg.sender] = safeSub(balances[msg.sender], _value);
            balances[_to] = safeAdd(balances[_to], _value);
            Transfer(msg.sender, _to, _value);
            return true;
        } else {
            return false;
        }
    }

    function balanceOf(address _owner) constant returns (uint balance) {
        return balances[_owner];
    }

}