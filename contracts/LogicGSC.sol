//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/interfaces/IERC20.sol";

interface IBridge {
    function deposit(uint8 destinationDomainID, bytes32 resourceID, bytes calldata data) external payable;
}

contract Logic {
    address public bridge;
    address public erc20Handler;
    bytes32 public resourceID;

    constructor(address _bridge, address _erc20Handler, bytes32 _resourceID) {
        bridge = _bridge;
        erc20Handler = _erc20Handler;
        resourceID = _resourceID;
    }

    function deposit(uint8 _domainID, address _recipient) external payable {
        bytes memory data = abi.encode(_recipient, msg.value, 20);
        IBridge(bridge).deposit(_domainID, resourceID, data);
    }

}