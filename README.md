# Fake Product Identification Using Blockchain

A blockchain-based system to identify counterfeit products by scanning QR codes. Each product is registered on the blockchain with a unique identifier, and any reported counterfeit is permanently flagged — ensuring trust between manufacturers and consumers.

## Project Overview

The manufacturing and marketing of counterfeit products poses serious financial, health, and safety risks to end users. This project leverages blockchain technology to create an immutable product registry where authenticity can be verified instantly via QR codes.

### YouTube Video : https://youtu.be/8nVStd41gxE

## Features

- **Product Registration** — Register products with unique IDs, names, and prices on the blockchain
- **QR Code Verification** — Scan QR codes to verify product authenticity in real-time
- **Counterfeit Reporting** — Report fake products, permanently flagging them on-chain
- **Immutable Records** — Product data cannot be altered once recorded
- **Decentralized Trust** — No single authority controls the product database

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Blockchain | Ethereum |
| Smart Contract | Solidity ^0.8.0 |
| QR Generation | Python / JavaScript libraries |
| Integration | Web3.js |

## How It Works

1. **Manufacturer** registers each product with a unique `product_id`, name, and price
2. A **QR code** is generated containing the product ID and printed on packaging
3. **Consumers** scan the QR code to query the blockchain and verify authenticity
4. If a counterfeit is discovered, it is **reported and flagged** permanently
5. All queries return the current status (genuine or fake) from the blockchain

## Smart Contract API

```solidity
// Register a new product on the blockchain
function uploadProduct(bytes32 id, string memory name, uint price) public

// Report a product as counterfeit
function reportFakeProduct(bytes32 productId) public

// Check if a product is flagged as fake
function isFakeProduct(bytes32 productId) public view returns (bool)
```

## Base Research Paper

[ITM Web of Conferences — Blockchain for Product Authentication](https://www.itm-conferences.org/articles/itmconf/pdf/2022/04/itmconf_icacc2022_03015.pdf)

## Author

**Rajgopal Pandilwar**

### Credits


## License

Open-source project for educational use.
