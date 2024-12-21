// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShowcasePresentationToken {
  // Token details
  string public name = "Showcase Presentation Token";
  string public symbol = "SPT";
  uint256 public totalSupply;

  // Mapping to store token balances
  mapping(address => uint256) public balanceOf;

  // Event to track token transfers
  event Transfer(address indexed from, address indexed to, uint256 value);

  constructor(uint256 _totalSupply) {
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = totalSupply;
  }

  // Transfer tokens from one account to another
  function transfer(address recipient, uint256 amount) public {
    require(balanceOf[msg.sender] >= amount, "Insufficient balance");
    balanceOf[msg.sender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(msg.sender, recipient, amount);
  }

  // Get the balance of an account
  function getBalance(address account) public view returns (uint256) {
    return balanceOf[account];
  }
}