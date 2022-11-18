//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract WGSC is ERC20PresetMinterPauser {
    constructor() ERC20PresetMinterPauser("WGSC", "WGSC") {}

    function mint() payable external {
        _mint(msg.sender, msg.value);
    }
}

