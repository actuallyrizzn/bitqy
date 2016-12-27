/**
 * Reviewed:
 * Current version is 0.4.7 (20th of December). Please update.
 */
pragma solidity ^0.4.4;

/**
 * Math operations with safety checks
 */

/**
 * Reviewed:
 * Good. Standard SafeMath contract.
 * Same as (for example) here - https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract SafeMath {

    function safeMul(uint a, uint b) internal returns (uint) {
        uint c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    function safeSub(uint a, uint b) internal returns (uint) {
        assert(b <= a);
        return a - b;
    }

    function safeAdd(uint a, uint b) internal returns (uint) {
        uint c = a + b;
        assert(c>=a && c>=b);
        return c;
    }

    function assert(bool assertion) internal {
        if (!assertion)
            throw;
    }

}
