# Interaction Logger Contract

This project is a simple **Solidity contract** deployed on the **Flow EVM Testnet**. The contract logs interactions with timestamps, storing the address and time of each call to the `logInteraction` function. It is designed to be simple and lightweight, with no input fields, constructors, or imports.

### Contract Address on Flow EVM Testnet

The deployed contract address on the **Flow EVM Testnet** is: 0x8baF0f422e8Cf6Be0c0C8C633cde7cFD497DE3D8


### Functions

- **`logInteraction()`**  
  Logs the address of the caller and the timestamp of the interaction. Each call is stored in an internal array. 
  - No input fields required.
  - Each address can interact as many times as they want.

- **`getInteractionCount()`**  
  Returns the number of interactions that have been logged.

- **`getInteraction(uint256 index)`**  
  Retrieves the address and timestamp of a specific interaction by its index in the array.

### How to Interact with the Contract

To interact with the contract:

1. **Connect to the Flow EVM Testnet** using a Web3 wallet like MetaMask or any Flow-compatible wallet.
2. Use a tool like **Remix IDE** or **Hardhat** to interact with the contract. Alternatively, you can call the contract functions using a JavaScript library like **ethers.js**.

### Example Usage

```javascript
const ethers = require('ethers');

// Define provider (e.g., for Flow EVM Testnet)
const provider = new ethers.JsonRpcProvider("https://<flow-evm-testnet-rpc>");

// Define contract address and ABI
const contractAddress = "0x8baF0f422e8Cf6Be0c0C8C633cde7cFD497DE3D8";
const abi = [
  "function logInteraction() public",
  "function getInteractionCount() public view returns (uint256)",
  "function getInteraction(uint256 index) public view returns (address, uint256)"
];

// Create contract instance
const contract = new ethers.Contract(contractAddress, abi, provider);

// Interact with the contract
async function logInteraction() {
  const signer = provider.getSigner();
  const contractWithSigner = contract.connect(signer);
  await contractWithSigner.logInteraction();
  console.log("Interaction logged!");
}

async function getInteractionCount() {
  const count = await contract.getInteractionCount();
  console.log("Number of interactions:", count.toString());
}

async function getInteraction(index) {
  const interaction = await contract.getInteraction(index);
  console.log(`Interaction ${index}: Address - ${interaction[0]}, Timestamp - ${interaction[1]}`);
}
```

### What this includes:

1. **Contract Address**: The address where your contract is deployed.
2. **Function Descriptions**: Explains the key functions of your contract.
3. **How to Interact**: Includes steps to interact with the contract, along with a simple example of how to use the contract via `ethers.js`.
4. **License & Acknowledgements**: Basic information about the license and technologies used.
