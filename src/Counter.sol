// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    uint256 public price;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setPrice(uint256 newPrice) public {
        require(msg.sender == owner, "Only owner can set price");

        price = newPrice;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
