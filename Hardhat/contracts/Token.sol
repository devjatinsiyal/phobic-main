// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

    address owner;
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender,"NOt the owner");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

        function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        revert("No transfer Allowed");
    }
}