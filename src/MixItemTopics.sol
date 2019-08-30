pragma solidity ^0.5.11;

import "mix-item-store/MixItemStoreInterface.sol";
import "mix-item-store/MixItemStoreRegistry.sol";


/**
 * @title MixItemTopics
 * @author Jonathan Brown <jbrown@mix-blockchain.org>
 * @dev Enables uncreated items to be added to topics.
 */
contract MixItemTopics {

    /**
     * @dev Mapping of topic hash to topic.
     */
    mapping (bytes32 => string) hashTopic;

    /**
     * @dev Mapping of topic hash to array of itemIds.
     */
    mapping (bytes32 => bytes32[]) topicHashItemIds;

    /**
     * @dev Mapping of itemId to array of topic hashes.
     */
    mapping (bytes32 => bytes32[]) itemIdTopicHashes;

    /**
     * @dev An item has been added to a topic.
     * @param topicHash Hash of the topic.
     * @param itemId itemId of the item added.
     * @param i Index of the new item.
     */
    event AddItem(bytes32 indexed topicHash, bytes32 indexed itemId, uint i);

    /**
     * @dev Revert if a topic does not exist.
     * @param topicHash Hash of the topic.
     */
    modifier topicExists(bytes32 topicHash) {
        require (bytes(hashTopic[topicHash]).length > 0, "Topic does not exist.");
        _;
    }

    /**
     * @dev Add an item to a topic. The item must not exist yet.
     * @param topic Topic the item should be added to.
     * @param itemStore The ItemStore contract that will contain the item.
     * @param nonce The nonce that will be used to create the item.
     */
    function addItem(string calldata topic, MixItemStoreInterface itemStore, bytes32 nonce) external {
        // Get the itemId. Ensure it does not exist.
        bytes32 itemId = itemStore.getNewItemId(msg.sender, nonce);
        // Ensure the item does not have too many topics.
        require (itemIdTopicHashes[itemId].length < 20, "Item cannot be posted to more than 20 topics.");
        // Get hash for the topic.
        bytes32 topicHash = keccak256(abi.encodePacked(topic));
        // Store hash in state if it hasn't been already.
        if (bytes(hashTopic[topicHash]).length == 0) {
            hashTopic[topicHash] = topic;
        }
        // Store mappings.
        topicHashItemIds[topicHash].push(itemId);
        itemIdTopicHashes[itemId].push(topicHash);
        // Log the event.
        emit AddItem(topicHash, itemId, topicHashItemIds[topicHash].length -1);
    }

    /**
     * @dev Get the topic for a topic hash.
     * @param topicHash Hash of the topic to be retreived.
     * @return The topic.
     */
    function getTopic(bytes32 topicHash) external view topicExists(topicHash) returns (string memory) {
        return hashTopic[topicHash];
    }

    /**
     * @dev Get the number of items a topic has.
     * @param topicHash Hash of the topic.
     * @return The number of items.
     */
    function getTopicItemCount(bytes32 topicHash) external view returns (uint) {
        return topicHashItemIds[topicHash].length;
    }

    /**
     * @dev Get the all of a topic's itemIds.
     * @param topicHash Hash of the topic.
     * @return The itemIds.
     */
    function getAllTopicItems(bytes32 topicHash) external view returns (bytes32[] memory) {
        return topicHashItemIds[topicHash];
    }

    /**
     * @dev Get some of a topics itemIds.
     * @param topicHash Hash of the topic
     * @param offset Index of the first itemId to retreive.
     * @param limit Maximum number of itemIds to retrieve.
     * @return The itemIds.
     */
    function getTopicItems(bytes32 topicHash, uint offset, uint limit) external view returns (bytes32[] memory itemIds) {
        // Get topic itemIds.
        bytes32[] storage topicItemIds = topicHashItemIds[topicHash];
        // Check how many itemIds we can retrieve.
        uint _limit;
        if (topicItemIds.length < offset + limit) {
            _limit = topicItemIds.length - offset;
        }
        else {
            _limit = limit;
        }
        // Allocate memory array.
        itemIds = new bytes32[](_limit);
        // Populate memory array.
        for (uint i = 0; i < _limit; i++) {
            itemIds[i] = topicItemIds[offset + i];
        }
    }

    /**
     * @dev Get the number of topics an item has.
     * @param itemId itemId of the item.
     * @return The number of topics.
     */
    function getItemTopicCount(bytes32 itemId) external view returns (uint) {
        return itemIdTopicHashes[itemId].length;
    }

    /**
     * @dev Get the topics for an item.
     * @param itemId itemId of the item.
     * @return The topics.
     */
    function getItemTopicHashes(bytes32 itemId) external view returns (bytes32[] memory) {
        return itemIdTopicHashes[itemId];
    }

}
