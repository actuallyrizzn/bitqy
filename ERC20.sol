pragma solidity ^0.4.9;

contract ERC20 {
    function totalSupply() constant returns (uint256 totalSupply);
    function transfer(address to, uint256 value) returns (bool success);
    function balanceOf(address who) constant returns (uint256);

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
    function approve(address _spender, uint256 _value) returns (bool success);
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
