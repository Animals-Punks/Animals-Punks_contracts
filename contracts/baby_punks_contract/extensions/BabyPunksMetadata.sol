pragma solidity ^0.8.0;

abstract contract BabyPunksMetadata {
    struct Metadata {
        string imageUrl;
        string background;
        string species;
        string mouth;
    }

    mapping(uint256 => Metadata) private _metadatas;

    function setMetadatas(uint256[] calldata tokenIds, Metadata[] memory metadatas_) public {
        for (uint i = 0; i < 3; i ++) {
            uint256 tokenId = tokenIds[i];
            Metadata memory metadata_ = metadatas_[i];
            _metadatas[tokenId] = metadata_;
        }
    }

    function getMetadatas(uint256 tokenId) public view virtual returns (Metadata memory) {
        return _metadatas[tokenId];
    }
}