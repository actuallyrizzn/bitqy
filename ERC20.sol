pragma solidity ^0.4.7;

/**
 * Reviewed: this is not a cannonical ERC20 contract.
 * Consider using standard "interface" declared here -
 *  https://github.com/ethereum/EIPs/issues/20
 * 
 * Please add approve(), allowance(), tranferFrom() members
 */
contract ERC20 {
    function totalSupply() constant returns (uint256 totalSupply);
    function transfer(address to, uint256 value) returns (bool success);
    function balanceOf(address who) constant returns (uint256);

    event Transfer(address indexed from, address indexed to, uint value);
}
