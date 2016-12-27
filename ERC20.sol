/**
 * Reviewed:
 * Current version is 0.4.7 (20th of December). Please update.
 */
pragma solidity ^0.4.4;


/**
 * Reviewed: Consider using standard "interface" declared here -
 *  https://github.com/ethereum/EIPs/issues/20
 *
 *  It should have these standard method: totalSupply(), transferFrom(), events, etc.
 *  It is always better to use standard contracts because clients (exchanges, wallets, etc) 
 *  know how to work with them.
 */
contract ERC20 {

    uint public totalSupply;

    function balanceOf(address who) constant returns (uint);
    function transfer(address to, uint value) returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);

}
