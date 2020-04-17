pragma solidity ^0.5.15;

import "ds-test/test.sol";
import "./sort.sol";

contract DummySorter {
    using Sort for uint[];

    uint[] public values;

    function create(uint val) public {
        values.push(val);
    }

    function set(uint val, uint pos) public {
        values[pos] = val;
    }

    function fix() public {
        values.sort(0, int(values.length - 1));
    }
}

contract SortTest is DSTest {
    DummySorter sorter;

    function setUp() public {}

    function ray(uint wad) internal pure returns (uint) {
        return wad * 10 ** 9;
    }

    function test_sort_random_array() public {
        sorter = new DummySorter();

        sorter.create(ray(1.1 ether));
        sorter.create(ray(0.8 ether));
        sorter.create(ray(1.3 ether));
        sorter.create(ray(0.99 ether));

        sorter.fix();

        assertEq(sorter.values(0), ray(0.8 ether));
        assertEq(sorter.values(1), ray(0.99 ether));
        assertEq(sorter.values(2), ray(1.1 ether));
        assertEq(sorter.values(3), ray(1.3 ether));
    }
    function test_sort_already_sorted_array() public {
        sorter = new DummySorter();

        sorter.create(ray(0.8 ether));
        sorter.create(ray(0.99 ether));
        sorter.create(ray(1.1 ether));
        sorter.create(ray(1.3 ether));

        sorter.fix();

        assertEq(sorter.values(0), ray(0.8 ether));
        assertEq(sorter.values(1), ray(0.99 ether));
        assertEq(sorter.values(2), ray(1.1 ether));
        assertEq(sorter.values(3), ray(1.3 ether));
    }
}
