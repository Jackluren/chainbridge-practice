//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WFRA is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("WFRA", "WFRA") {}

    function deposit() external payable {
        _mint(msg.sender, msg.value);
    }

    function mint(address _to, uint _amount) external {
        _mint(_to, _amount);
    }
}
