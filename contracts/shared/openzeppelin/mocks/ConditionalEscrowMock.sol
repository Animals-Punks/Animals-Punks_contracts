// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import "../utils/escrow/ConditionalEscrow.sol";

// mock class using ConditionalEscrow
contract ConditionalEscrowMock is ConditionalEscrow {
    mapping(address => bool) private _allowed;

    function setAllowed(address payee, bool allowed) public {
        _allowed[payee] = allowed;
    }

    function withdrawalAllowed(address payee) public view override returns (bool) {
        return _allowed[payee];
    }
}
