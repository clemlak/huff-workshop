// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Test} from "forge-std/Test.sol";

contract ComputeTest is Test {
    Compute public compute;

    function setUp() public {
        compute = Compute(HuffDeployer.deploy("Compute"));
    }

    function test_compute(uint256 a, uint256 b) public {
        uint256 c = compute.compute(a, b);
        unchecked {
            assertEq(c, a + b);
        }
    }
}

interface Compute {
    function compute(uint256, uint256) external view returns (uint256);
}
