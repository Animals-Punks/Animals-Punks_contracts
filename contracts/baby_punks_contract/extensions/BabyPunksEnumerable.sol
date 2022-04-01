pragma solidity ^0.5.0;

import "./IBabyPunksEnumerable.sol";

abstract contract BabyPunksEnumerable is IBabyPunksEnumerable {
    uint256[] private _allTokens;

    mapping(address => mapping(uint256 => uint256)) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;
    mapping(uint256 => uint256) private _allTokensIndex;

    function totalSupply() public view virtual override returns (uint256) {
        return _allTokens.length;
    }

    function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
        require(index < BabyPunksEnumerable.totalSupply(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

    function mintToken(uint256 tokenId) public {
        _allTokens.push(tokenId);
    }

    function burnToken(uint256 tokenId) public {
        require(tokenId < _allTokens.length, "index out of bound");

        for (uint i = tokenId; i < _allTokens.length - 1; i++) {
            _allTokens[i] = _allTokens[i + 1];
        }
        _allTokens.pop();
    }
}