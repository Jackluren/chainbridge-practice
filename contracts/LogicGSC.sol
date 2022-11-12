//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.11;

import "@openzeppelin/contracts/interfaces/IERC20.sol";
import "./BytesLib.sol";

interface IBridge {
    function deposit(uint8 destinationDomainID, bytes32 resourceID, bytes calldata data) external payable;
}

contract LogicGSC {
    using BytesLib for bytes;

    // 桥地址
    address public bridge;
    // resourceID地址
    bytes32 public resourceID;

    constructor(address _bridge, bytes32 _resourceID) {
        bridge = _bridge;
        resourceID = _resourceID;
    }

    function deposit(uint8 _domainID, uint _amount, address _recipient) external payable {
        bytes memory data1 = abi.encode(_amount, 20);
        bytes memory recipientBytes = abi.encodePacked(_recipient);
        bytes memory data = data1.concat(recipientBytes);

        IBridge(bridge).deposit(_domainID, resourceID, data);
    }
}
