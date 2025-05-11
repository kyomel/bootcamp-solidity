// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Price} from "../src/Price.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PriceTest is Test {
    Price public price;

    function setUp() public {
        vm.createSelectFork("https://arb-mainnet.g.alchemy.com/v2/EOWMbAtPNt2irib4HiD8vMNTDgAhCAyJ", 335092648);
        price = new Price();
    }

    function test_getPrice() public {
        uint256 price = price.getPrice();
        console.log("price", price);
    }
}