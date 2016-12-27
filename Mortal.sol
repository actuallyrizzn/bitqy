/**
 * Reviewed:
 * Current version is 0.4.7 (20th of December). Please update.
 */
pragma solidity ^0.4.4;

/**
 * Reviewed:
 * Good.
 */
contract Mortal {

    address public owner;

    /**
     * Reviewed:
     * This code should be removed because it is not used by any code...
     * owner variable is set in BitQy.sol contract
     */
    function mortal() {
        owner = msg.sender;
    }

    /**
     * Reviewed:
     * Can use function modifier, for example isOwner
     * 
     */
    function kill() { 
        if (msg.sender == owner)
            selfdestruct(owner);
    }
}
