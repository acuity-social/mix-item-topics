pragma solidity ^0.5.11;

import "ds-test/test.sol";
import "mix-item-store/MixItemStoreRegistry.sol";
import "mix-item-store/MixItemStoreIpfsSha256.sol";

import "./MixItemTopics.sol";

contract MixItemTopicsTest is DSTest {

    MixItemStoreRegistry mixItemStoreRegistry;
    MixItemStoreIpfsSha256 mixItemStore;
    MixItemTopics mixItemTopics;

    function setUp() public {
        mixItemStoreRegistry = new MixItemStoreRegistry();
        mixItemStore = new MixItemStoreIpfsSha256(mixItemStoreRegistry);
        mixItemTopics = new MixItemTopics();
    }

    function testControlAddItemTooManyTopics() public {
        mixItemTopics.addItem("topic00", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic01", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic02", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic03", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic04", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic05", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic06", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic07", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic08", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic09", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic10", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic11", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic12", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic13", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic14", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic15", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic16", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic17", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic18", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic19", mixItemStore, bytes2(0x0001));
    }

    function testFailAddItemTooManyTopics() public {
        mixItemTopics.addItem("topic00", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic01", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic02", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic03", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic04", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic05", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic06", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic07", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic08", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic09", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic10", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic11", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic12", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic13", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic14", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic15", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic16", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic17", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic18", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic19", mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem("topic20", mixItemStore, bytes2(0x0001));
    }

}
