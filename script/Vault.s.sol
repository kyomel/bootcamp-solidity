// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Vault} from "../src/Vault.sol";
import {MockUSDC} from "../src/MockUSDC.sol";

contract VaultScript is Script {
    MockUSDC public usdc;
    Vault public vault;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        usdc = new MockUSDC();
        vault = new Vault(address(usdc));

        console.log("usdc deployed to", address(usdc));
        console.log("vault deployed to", address(vault));

        vm.stopBroadcast();
    }
}
