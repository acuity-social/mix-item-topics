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

    function testCreateTopic() public {
        bytes32 topicHash1 = mixItemTopics.createTopic("topic1");
        assertEq(topicHash1, mixItemTopics.createTopic("topic1"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash1)), bytes("topic1"));

        bytes32 topicHash2 = mixItemTopics.createTopic("topic2");
        assertEq(topicHash1, mixItemTopics.createTopic("topic1"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash1)), bytes("topic1"));
        assertEq(topicHash2, mixItemTopics.createTopic("topic2"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash2)), bytes("topic2"));

        bytes32 topicHash3 = mixItemTopics.createTopic("topic3");
        assertEq(topicHash1, mixItemTopics.createTopic("topic1"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash1)), bytes("topic1"));
        assertEq(topicHash2, mixItemTopics.createTopic("topic2"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash2)), bytes("topic2"));
        assertEq(topicHash3, mixItemTopics.createTopic("topic3"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash3)), bytes("topic3"));

        bytes32 topicHash4 = mixItemTopics.createTopic("topic4");
        assertEq(topicHash1, mixItemTopics.createTopic("topic1"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash1)), bytes("topic1"));
        assertEq(topicHash2, mixItemTopics.createTopic("topic2"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash2)), bytes("topic2"));
        assertEq(topicHash3, mixItemTopics.createTopic("topic3"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash3)), bytes("topic3"));
        assertEq(topicHash4, mixItemTopics.createTopic("topic4"));
        assertEq0(bytes(mixItemTopics.getTopic(topicHash4)), bytes("topic4"));
    }

    function testControlAddItemTopicDoesntExist() public {
        bytes32 topicHash = mixItemTopics.createTopic("topic0");
        mixItemTopics.addItem(topicHash, mixItemStore, bytes2(0x0000));
    }

    function testFailAddItemTopicDoesntExist() public {
        bytes32 topicHash = hex"1234";
        mixItemTopics.addItem(topicHash, mixItemStore, bytes2(0x0000));
    }

    function testControlAddItemAlreadyExists() public {
        bytes32 topicHash = mixItemTopics.createTopic("topic0");
        mixItemStore.create(bytes2(0x0002), hex"1234");
        mixItemTopics.addItem(topicHash, mixItemStore, bytes2(0x0001));
    }

    function testFailAddItemAlreadyExists() public {
        bytes32 topicHash = mixItemTopics.createTopic("topic0");
        mixItemStore.create(bytes2(0x0001), hex"1234");
        mixItemTopics.addItem(topicHash, mixItemStore, bytes2(0x0001));
    }


    function testControlAddItemTooManyTopics() public {
        mixItemTopics.addItem(mixItemTopics.createTopic("topic00"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic01"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic02"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic03"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic04"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic05"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic06"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic07"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic08"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic09"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic10"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic11"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic12"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic13"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic14"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic15"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic16"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic17"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic18"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic19"), mixItemStore, bytes2(0x0001));
    }

    function testFailAddItemTooManyTopics() public {
        mixItemTopics.addItem(mixItemTopics.createTopic("topic00"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic01"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic02"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic03"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic04"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic05"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic06"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic07"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic08"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic09"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic10"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic11"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic12"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic13"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic14"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic15"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic16"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic17"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic18"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic19"), mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(mixItemTopics.createTopic("topic20"), mixItemStore, bytes2(0x0001));
    }

    function testAddItem() public {
        bytes32 topicHash0 = mixItemTopics.createTopic("topic0");
        mixItemTopics.addItem(topicHash0, mixItemStore, bytes2(0x0000));
        bytes32 itemId0 = mixItemStore.create(bytes2(0x0000), hex"1234");
        assertEq(mixItemTopics.getTopicItemCount(topicHash0), 1);
        bytes32[] memory topicItems = mixItemTopics.getAllTopicItems(topicHash0);
        assertEq(topicItems.length, 1);
        assertEq(topicItems[0], itemId0);
        assertEq(mixItemTopics.getItemTopicCount(itemId0), 1);
        bytes32[] memory topicHashes = mixItemTopics.getItemTopicHashes(itemId0);
        assertEq(topicHashes.length, 1);
        assertEq(topicHashes[0], topicHash0);

        mixItemTopics.addItem(topicHash0, mixItemStore, bytes2(0x0001));
        mixItemTopics.addItem(topicHash0, mixItemStore, bytes2(0x0002));
        bytes32 itemId1 = mixItemStore.create(bytes2(0x0001), hex"1234");
        bytes32 itemId2 = mixItemStore.create(bytes2(0x0002), hex"1234");
        assertEq(mixItemTopics.getTopicItemCount(topicHash0), 3);
        topicItems = mixItemTopics.getAllTopicItems(topicHash0);
        assertEq(topicItems.length, 3);
        assertEq(topicItems[0], itemId0);
        assertEq(topicItems[1], itemId1);
        assertEq(topicItems[2], itemId2);
        assertEq(mixItemTopics.getItemTopicCount(itemId1), 1);
        assertEq(mixItemTopics.getItemTopicCount(itemId2), 1);
        topicHashes = mixItemTopics.getItemTopicHashes(itemId1);
        assertEq(topicHashes.length, 1);
        assertEq(topicHashes[0], topicHash0);
        topicHashes = mixItemTopics.getItemTopicHashes(itemId2);
        assertEq(topicHashes.length, 1);
        assertEq(topicHashes[0], topicHash0);

        bytes32 topicHash1 = mixItemTopics.createTopic("topic1");
        mixItemTopics.addItem(topicHash1, mixItemStore, bytes2(0x0003));
        mixItemTopics.addItem(topicHash1, mixItemStore, bytes2(0x0004));
        bytes32 itemId3 = mixItemStore.create(bytes2(0x0003), hex"1234");
        bytes32 itemId4 = mixItemStore.create(bytes2(0x0004), hex"1234");
        assertEq(mixItemTopics.getTopicItemCount(topicHash1), 2);
        topicItems = mixItemTopics.getAllTopicItems(topicHash1);
        assertEq(topicItems.length, 2);
        assertEq(topicItems[0], itemId3);
        assertEq(topicItems[1], itemId4);
        assertEq(mixItemTopics.getItemTopicCount(itemId3), 1);
        assertEq(mixItemTopics.getItemTopicCount(itemId4), 1);
        topicHashes = mixItemTopics.getItemTopicHashes(itemId3);
        assertEq(topicHashes.length, 1);
        assertEq(topicHashes[0], topicHash1);
        topicHashes = mixItemTopics.getItemTopicHashes(itemId4);
        assertEq(topicHashes.length, 1);
        assertEq(topicHashes[0], topicHash1);
    }

}
