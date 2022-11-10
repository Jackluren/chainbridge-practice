//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

interface IBridge {
    function deposit(uint8 destinationDomainID, bytes32 resourceID, bytes calldata data) external payable;
}

contract LogicFRA {
    address public bridge;
    address public erc20Handler;
    bytes32 public resourceID;

    constructor(address _bridge, address _erc20Handler, bytes32 _resourceID) {
        bridge = _bridge;
        erc20Handler = _erc20Handler;
        resourceID = _resourceID;
    }

    function deposit(uint8 _domainID, uint _amount, address _recipient) external payable {
        bytes memory ra = abi.encode(_recipient, _amount);
        bytes memory data = abi.encode(_amount, ra.length, _recipient);

        IBridge(bridge).deposit(_domainID, resourceID, data);
    }
}
