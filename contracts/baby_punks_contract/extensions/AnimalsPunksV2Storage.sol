pragma solidity ^0.8.0;

abstract contract AnimalsPunksV2Storage {
    struct V2Metadata {
        string imageUrl;
        string species;
        uint256 tokenId;
    }

    uint256[] private _usedApList;

    // mapping(uint256 => string) public _species;
    mapping(uint256 => bool) public _usedAP;
    mapping(uint256 => uint256[]) public _usedTokenId;
    // mapping(uint256 => V2Metadata) public _v2Metadata;

    function initializedStorage() public {
        for (uint256 i = 1; i <= 9990; i ++) {
            // string memory kind = kinds[i];
            _usedAP[i] = false;
        }
    }

    // function getSpecies(uint256 v2TokenId) public view virtual returns (string memory) {
    //     require(v2TokenId <= 9999, "AnimalsPunksV2Storage: This token id not be minted.");
    //     return _species[v2TokenId];
    // }

    // function unUsedV2(uint256 v2TokenId) public view virtual returns (V2Metadata memory) {
    //     require(v2TokenId <= 9999, "AnimalsPunksV2Storage: This token id not be minted.");
    //     require(_usedAP[v2TokenId] == false, "AnimalsPunksV2Storage: This token is used.");
    //     return _v2Metadata[v2TokenId];
    // }

    function usedAp(uint256[] calldata v2TokenId, uint256 tokenId) public {
        // uint256 firstTokenId = kinds[0];
        // uint256 secoundTokenId = kinds[1];
        // string memory firstTokenKind = _species[firstTokenId];
        // string memory secoundTokenKind = _species[secoundTokenId];
        for (uint i = 0; i < 2; i ++) {
            uint256 v2Id = v2TokenId[i];
            require(_usedAP[v2Id] == false, "AnimalsPunksV2Storage: This V2 must be used");
            _usedAP[v2Id] = true;
            _usedApList.push(v2Id);
        }
        _usedTokenId[tokenId] = v2TokenId;
    }

    function getUsedApById(uint256 tokenId) public view virtual returns (uint256[] memory) {
        return _usedTokenId[tokenId];
    }

    function getAllUsedAp() public view virtual returns (uint256[] memory) {
        return _usedApList;
    }

    function removeUsedAp(uint256 tokenId) public {
        uint256[] memory v2TokenIds = _usedTokenId[tokenId];
        for (uint i; i < 2; i ++) {
            uint256 v2Id = v2TokenIds[i];
            _usedAP[v2Id] = false;
        }
    }
}