// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title TransferBug
 * @notice Example contract with a subtle bug in the transfer logic.
 */
contract TransferBug {
    mapping(address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        // ❌ Bug: missing assignment after subtraction/addition
        balanceOf[msg.sender] - amount;
        balanceOf[to] + amount;

        return true;
    }
}
