//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WGSC is ERC20, ERC20Burnable, Ownable {
    mapping(address => uint) deposit;
    event Deposit(address _from, address _to, uint _amount);

    constructor() ERC20("WGSC", "WGSC") {}

    function mint(address _to) external payable {
        // 0.01 GSC
        require(msg.value >= 1 * 10 ** 16, "ERROR: less then minimum amount that can be crossed");

        _mint(msg.sender, msg.value);
        deposit[msg.sender] += msg.value;

        emit Deposit(msg.sender, _to, msg.value);
    }
}

