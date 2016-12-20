/**
 * Reviewed:
 * Current version is 0.4.7 (20th of December). Please update.
 */
pragma solidity ^0.4.4;

import 'Mortal.sol';
import 'ERC20.sol';
import 'SafeMath.sol';

            
/**
 * Reviewed: Mortal should be removed? See comments in Mortal.sol
 *
 * Security review metodology is here - http://ethereum.stackexchange.com/questions/8551/methodological-security-review-of-a-smart-contract
 */
contract Token is Mortal, ERC20, SafeMath {
    /**
     * Reviewed: Better to move 'balances' to ERC20 contract
     */
    mapping(address => uint) balances;

    bool public tradeable = false;

    /**
     * Reviewed: Better to move this method to ERC20
     *
     * Mixing safe math (that throws) with return true/false is not a good coding style.
     * Better always to have one return strategy (in this case no throws). See 
     * See this gist here - https://gist.github.com/AnthonyAkentiev/14791dee17996c852ecd510ff3cdc066
     * 
     * + Interger Overflow = OK, Checked
     */
    function transfer(address _to, uint _value) returns (bool success) {
        // BUG! in the original ERC20 contract transfer should be callable BY ANY token holder.
        // 1) anyway only the owner has initial shares 
        // 2) if someone bought shares -> then he should be able to move them to anyone else (or to his other accounts)

        // so please remove (msg.sender==owner) check
        // or leave it - if it's as intended
        // 
        // But see: 
        // "That this BitQy token is freely transferable by the holder hereof in any manner, 
        //  which said holder deems appropriate and reasonable".
        if ((msg.sender == owner) || (tradeable == true)) {
            balances[msg.sender] = safeSub(balances[msg.sender], _value);
            balances[_to] = safeAdd(balances[_to], _value);

            // calling an event
            Transfer(msg.sender, _to, _value);

            return true;
        } else {
            return false;
        }
    }

    /**
     * Reviewed: Better to move this method to ERC20
     */
    function balanceOf(address _owner) constant returns (uint balance) {
        return balances[_owner];
    }

}
