pragma solidity ^0.8.0;

abstract contract BabyPunksMetadataStorage {
    struct Metadata {
        string imageUrl;
        string background;
        string species;
        string mouth;
    }
    uint256 private _extraTiger = 125;
    uint256 private _extraCat = 125;
    uint256 private _extraApe = 125;
    uint256 private _extraRabbit = 125;
    uint256 private _extraTurtle = 125;
    uint256 private _extraSeal = 125;
    uint256 private _extraPig = 125;
    uint256 private _extraDog = 125;

    mapping(uint256 => string) private _babyPunksSpecies;

    function getSpecies(uint256 tokenId) public view virtual returns (string memory) {
        return _babyPunksSpecies[tokenId];
    }

    function getAllExtra() public view virtual returns (uint256[8] memory) {
        return [_extraTiger, _extraCat, _extraApe, _extraRabbit, _extraTurtle, _extraSeal, _extraPig, _extraDog];
    }

    function usedExtra(string memory babyPunkSpecies, uint256 tokenId) public {
        _babyPunksSpecies[tokenId] = babyPunkSpecies;
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("tiger"))) {
            _extraTiger = _extraTiger - 1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("cat"))) {
            _extraCat = _extraCat -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("ape"))) {
            _extraApe = _extraApe -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("rabbit"))) {
            _extraRabbit = _extraRabbit -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("turtle"))) {
            _extraTurtle = _extraTurtle -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("seal"))) {
            _extraSeal = _extraSeal -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("pig"))) {
            _extraPig = _extraPig -1;
        }
        if (keccak256(abi.encodePacked(babyPunkSpecies)) == keccak256(abi.encodePacked("dog"))) {
            _extraDog = _extraDog -1;
        }
    }
}