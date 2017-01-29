pragma solidity ^0.4.8;

import 'Token.sol';

contract BitQy is Token {
    string public name = "BitQy";
    string public symbol = "BQY";

    bool public tradable = false;
    address public owner = 0x0;

    function BitQy() {
        owner = msg.sender;

        initialSupply = 10000000000;

        balances[owner] = totalSupply();
    }

    modifier onlyOwner {
        if (msg.sender == owner) {
            _;
        } else {
            throw;
        }
    }

    function() {
        throw; 
    }

    function kill() onlyOwner { 
        selfdestruct(owner);
    }

    function makeTradable() onlyOwner {
        tradable = true;
    }

    function transfer(address _to, uint256 _value) returns (bool success) {
        if ((msg.sender != owner) && !tradable) {
            throw;
        }

        success = Token.transfer(_to, _value);
        return;
    }

    function about() constant returns (string info) {
        info = "bitqy, the in-app token for bitqyck\nbitqy is an in-app token for the marketplace app bitqyck. The latest and most up to date legal disclosures can always be found on bitqy.org.\n\nAdditionally, bitqyck, Inc., a Texas corporation, Certifies:\n\n* that through its Directors and Founders, has duly authorized one billion shares of Common Stock as the only class of ownership shares in the Corporation, and further certifies,\n* that it has authorized the minting of ten billion digital tokens known as bitqy tokens or bitqy coins, created on the Ethereum Blockchain and, further certifies,\n* that the bitqy tokens are only created by the smart contract that these certifications are enumerated within and, futher certifies,\n* that the holder of this BitQy token, is also the holder of one-tenth of a share of bitqyck, Inc. Common Stock, and further certifies,\n* that the holder of this coin shall enjoy the rights and benefits as a shareholder of bitqyck, Inc. pursuant to the terms and conditions that the Directors and Founders attach to the holders and thereafter, pursuant to the terms and conditions that those holding a winning margin of BitQy deem proper or necessary and, further certifies,\n* that this BitQy token is freely transferable by the holder hereof in any manner, which said holder deems appropriate and reasonable.\n\nThe holder of this Bitqy token certifies that he or she has ownership and possession pursuant to a legal transaction or transfer from the prior holder.\n";
        return;
    }
}
