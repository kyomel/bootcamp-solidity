// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault is ERC20 {
    address public usdc;

    constructor(address _usdc) ERC20("Vault", "VAULT") {
        usdc = _usdc;
    }

    function deposit(uint256 amount) public {
        // shares = deposit amount / totalAsset * totalShares
        uint256 totalAsset = IERC20(usdc).balanceOf(address(this));
        uint256 totalShares = totalSupply();

        uint256 shares = 0;
        if (totalShares == 0) {
            shares = amount;
        } else {
            shares = amount * totalShares / totalAsset;
        }


        // minting shares to msg.sender
        _mint(msg.sender, shares);

        // transfer usdc from msg.sender to this vault
        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 shares) public {
        // shares = withdraw amount / totalAsset * totalShares
        uint256 totalAsset = IERC20(usdc).balanceOf(address(this));
        uint256 totalShares = totalSupply();

        uint256 amount = shares * totalAsset / totalShares;

        // burn shares from msg.sender
        _burn(msg.sender, shares);

        // transfer usdc from vault to msg.sender
        IERC20(usdc).transfer(msg.sender, amount);
    }

    function distributeYield(uint256 amount) public {
        // minting usdc to this vault
        IERC20(usdc).transferFrom(msg.sender, address(this), amount);
    }

}