// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import "../utils/Base64.sol";

contract Base64Mock {
    function encode(bytes memory value) external pure returns (string memory) {
        return Base64.encode(value);
    }
}
