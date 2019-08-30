pragma solidity ^0.5.11;

import "ds-test/test.sol";

import "./MixItemTopics.sol";

contract MixItemTopicsTest is DSTest {
    MixItemTopics topics;

    function setUp() public {
        topics = new MixItemTopics();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
