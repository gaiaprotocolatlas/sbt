// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "../SBT.sol";

abstract contract SBTURIStorage is SBT {
    using Strings for uint256;

    mapping(uint256 => string) private _tokenURIs;

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        // If there is an individual URI, return it.
        // If not, using the baseURI.
        string memory _tokenURI = _tokenURIs[tokenId];
        if (bytes(_tokenURI).length > 0) return _tokenURI;
        return super.tokenURI(tokenId);
    }

    function setTokenURI(uint256 tokenId, string calldata _tokenURI) external virtual {
        _setTokenURI(tokenId, _tokenURI);
    }

    function _setTokenURI(uint256 tokenId, string calldata _tokenURI) internal virtual {
        if (bytes(_tokenURI).length == 0) return;

        _requireMinted(tokenId);
        _tokenURIs[tokenId] = _tokenURI;
    }

    function _removeTokenURI(uint256 tokenId) internal virtual {
        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, tokenId);

        if (to == address(0)) {
            _removeTokenURI(tokenId);
        }
    }
}
