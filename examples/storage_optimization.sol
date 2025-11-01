// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title StorageOptimization
 * @notice Example contract for gas optimization analysis.
 */
contract StorageOptimization {
    uint[] public data;

    function store(uint value) public {
        data.push(value);
    }

    function sum() public view returns (uint) {
        uint total = 0;
        for (uint i = 0; i < data.length; i++) {
            total += data[i];
        }
        return total;
    }
}
