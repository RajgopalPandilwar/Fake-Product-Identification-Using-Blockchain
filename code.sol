// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Fake Product Identification System
/// @dev A blockchain-based registry to track product authenticity and flag counterfeits.
///      Original concept by Vatshayan — improved by Rajgopal Pandilwar.
contract FakeProductDetector {
    
    /// @dev Mapping from product ID to Product struct for O(1) lookups
    mapping(bytes32 => Product) public productList;

    /// @dev Product data structure
    struct Product {
        bytes32 product_id;      // Unique identifier (keccak256 hash of product metadata)
        string product_name;     // Human-readable product name
        uint product_price;      // Product price in wei/units
        bool isFake;             // True if counterfeit has been reported
    }

    /// @notice Register a new authentic product on the blockchain
    /// @param id Unique product identifier (bytes32)
    /// @param name Product display name
    /// @param price Product price
    /// @dev Reverts if a product with the same ID already exists
    function uploadProduct(bytes32 id, string memory name, uint price) public {
        // Prevent duplicate registrations
        require(productList[id].product_id == 0, "Product already exists");
        
        productList[id] = Product({
            product_id: id,
            product_name: name,
            product_price: price,
            isFake: false
        });
    }

    /// @notice Report a product as counterfeit/fake
    /// @param productId The ID of the product to flag
    /// @dev Reverts if the product does not exist on the registry
    function reportFakeProduct(bytes32 productId) public {
        // Ensure the product is registered before flagging
        require(productList[productId].product_id != 0, "Product not found");
        
        // Permanently mark as counterfeit (cannot be undone)
        productList[productId].isFake = true;
    }

    /// @notice Query whether a product is flagged as counterfeit
    /// @param productId The product ID to check
    /// @return bool True if the product is fake, false otherwise
    function isFakeProduct(bytes32 productId) public view returns (bool) {
        return productList[productId].isFake;
    }

    /// @notice Get full product details by ID
    /// @param productId The product ID to look up
    /// @return id Product identifier
    /// @return name Product name
    /// @return price Product price
    /// @return fake Counterfeit status
    function getProduct(bytes32 productId) public view returns (
        bytes32 id,
        string memory name,
        uint price,
        bool fake
    ) {
        Product memory p = productList[productId];
        return (p.product_id, p.product_name, p.product_price, p.isFake);
    }
}
