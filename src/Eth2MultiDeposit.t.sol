// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Eth2MultiDeposit.sol";

contract Eth2MultiDepositTest is DSTest {
    Eth2MultiDeposit deposit;

    function setUp() public {
        deposit = new Eth2MultiDeposit();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
