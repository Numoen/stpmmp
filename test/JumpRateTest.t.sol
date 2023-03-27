// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import { Lendgine } from "../src/core/Lendgine.sol";
import { Pair } from "../src/core/Pair.sol";
import { TestHelper } from "./utils/TestHelper.sol";

contract JumpRateTest is TestHelper {
  function setUp() external {
    _setUp();
  }

  function test50Utilization() external {
    assertEq(lendgine.getBorrowRate(50 ether, 100 ether), 0.01875 ether);
    assertEq(lendgine.getSupplyRate(50 ether, 100 ether), 0.009375 ether);
  }

  function test80Utilization() external {
    assertEq(lendgine.getBorrowRate(80 ether, 100 ether), 0.03 ether);
    assertEq(lendgine.getSupplyRate(80 ether, 100 ether), 0.024 ether);
  }

  function test90Utilization() external {
    assertEq(lendgine.getBorrowRate(90 ether, 100 ether), 0.075 ether);
    assertEq(lendgine.getSupplyRate(90 ether, 100 ether), 0.0675 ether);
  }

  function test100Utilization() external {
    assertEq(lendgine.getBorrowRate(100 ether, 100 ether), 0.12 ether);
    assertEq(lendgine.getSupplyRate(100 ether, 100 ether), 0.12 ether);
  }
}
