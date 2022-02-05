pragma solidity ^0.8.0;

abstract contract AnimalsPunksV2Storage {
    mapping(uint256 => string) public _species;
    mapping(uint256 => bool) public _usedAP;
    mapping(uint256 => uint256[]) public _usedTokenId;

    function initializedStorage(uint256[] memory v2TokenIds, string[] memory kinds) public {
        for (uint256 i = 0; i <= 10000; i ++) {
            uint256 tokenId = v2TokenIds[i];
            string memory kind = kinds[i];
            _species[tokenId] = kind;
            _usedAP[i] = false;
        }
    }

    function getSpecies(uint256 v2TokenId) public view virtual returns (string memory) {
        require(v2TokenId <= 9999, "AnimalsPunksV2Storage: This token id not be minted.");
        return _species[v2TokenId];
    }

    function usedAp(uint256[] calldata v2TokenId, uint256 tokenId) public {
        uint256 firstTokenId = v2TokenId[0];
        uint256 secoundTokenId = v2TokenId[1];
        string memory firstTokenKind = _species[firstTokenId];
        string memory secoundTokenKind = _species[secoundTokenId];
        require(keccak256(abi.encodePacked(firstTokenKind)) == keccak256(abi.encodePacked(secoundTokenKind)), "AnimalsPunksV2Storage: V2 must be same species");
        for (uint i = 0; i < 2; i ++) {
            uint256 v2Id = v2TokenId[i];
            require(_usedAP[v2Id] == false, "AnimalsPunksV2Storage: This V2 must be used");
            _usedAP[v2Id] = true;
        }
        _usedTokenId[tokenId] = v2TokenId;
    }

    function removeUsedAp(uint256 tokenId) public {
        uint256[] memory v2TokenIds = _usedTokenId[tokenId];
        for (uint i; i < 2; i ++) {
            uint256 v2Id = v2TokenIds[i];
            _usedAP[v2Id] = false;
        }
    }
}