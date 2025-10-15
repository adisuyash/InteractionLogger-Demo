// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InteractionLogger {
    struct Interaction {
        address user;
        uint256 timestamp;
    }

    Interaction[] public interactions;

    // Function to log an interaction
    function logInteraction() public {
        // Create a new interaction with the sender's address and current timestamp
        interactions.push(Interaction(msg.sender, block.timestamp));
    }

    // Function to get the number of interactions
    function getInteractionCount() public view returns (uint256) {
        return interactions.length;
    }

    // Function to retrieve a specific interaction (by index)
    function getInteraction(uint256 index) public view returns (address, uint256) {
        require(index < interactions.length, "Index out of bounds");
        Interaction memory interaction = interactions[index];
        return (interaction.user, interaction.timestamp);
    }
}
