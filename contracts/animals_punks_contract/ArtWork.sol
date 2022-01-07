pragma solidity ^0.5.0;

import "../token/KIP37/KIP37.sol";
import "../token/KIP37/KIP37Burnable.sol";
import "../token/KIP37/KIP37Pausable.sol";
import "../token/KIP37/KIP37Mintable.sol";

contract AnimalsPunksArtWork is KIP37, KIP37Burnable, KIP37Pausable, KIP37Mintable {
    constructor(string memory uri) public KIP37(uri) {}
}
