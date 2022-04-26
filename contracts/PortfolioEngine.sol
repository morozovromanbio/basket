// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "./IERC20.sol";

import "./IERC721.sol";

pragma solidity ^0.8.13;

contract PortfolioEngine {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    // mapping(address => uint256) private _balances;

    // mapping(address => mapping(address => uint256)) private _allowances;

    constructor() ERC721("BasketToken", "BT") {}

    event SetPortfolio(TokenInfo[] tokenInfo);
    
    enum TokenType{
        ERC20,
        ERC721,
        ERC1155
    }

    struct TokenInfo{
        address tokenAddress;
        TokenType tokenType;
        uint256 quantity;    
    }

    struct Portfolio{

    }

    TokenInfo[] assets;

    function addPortfolio(TokenInfo[] calldata tokenInfo, address to) external {
        for ( i = 0; i < tokenInfo.length; i++) {
            
            if (tokenInfo[i].TokenType == ERC20) {

                tokenInfo.tokenAddress.transferFrom(msg.sender, to, tokenInfo.quantity);

            } else
            if (tokenInfo[i].TokenType == ERC721) {

                tokenInfo.tokenAddress.transferFrom(msg.sender, to, tokenInfo.quantity);

            }

            assets.push(tokenInfo[i]);

            emit SetPortfolio(assets);
        }
    }

    function withdrawPortfolio(TokenInfo[] calldata tokenInfo) external {
        for ( i = 0; i < tokenInfo.length; i++) {
            tokenInfo.transferFrom();
        }
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
    
}