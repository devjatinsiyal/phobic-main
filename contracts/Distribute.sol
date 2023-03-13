// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "./Token.sol";

contract Distribute {
    address owner;
    address immutable Token;
    uint decimals = 10 **18;


    modifier onlyOwner() {
        require(msg.sender == owner, "onlyOwner");
        _;
    }

    constructor(address _token) {
        Token = _token;
        
    }

    function releaseTokens(address[] memory recipients) external {
       uint length= recipients.length;
        for(uint i; i< length;i++){
            IERC20(Token).transfer(recipients[i], 10 * decimals);
        }
    }
}
