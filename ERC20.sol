pragma solidity ^0.4.7;

contract ERC20 {
	function totalSupply() constant returns (uint256 totalSupply);
    function transfer(address to, uint value) returns (bool);
    function balanceOf(address who) constant returns (uint256);

    event Transfer(address indexed from, address indexed to, uint value);
}