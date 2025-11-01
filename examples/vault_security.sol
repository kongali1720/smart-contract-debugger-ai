// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Vault
 * @notice A simple vault contract vulnerable to reentrancy attacks.
 */
contract Vault {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Nothing to withdraw");

        // ⚠️ Vulnerable line — reentrancy possible
        payable(msg.sender).transfer(amount);

        balances[msg.sender] = 0;
    }
}
