pragma solidity ^0.5.15;

import "ds-test/test.sol";

import "./DsSort.sol";

contract DsSortTest is DSTest {
    DsSort sort;

    function setUp() public {
        sort = new DsSort();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}