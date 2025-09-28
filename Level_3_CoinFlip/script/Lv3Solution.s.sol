// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";

interface ICoinFlipGuesser {
    function guess() external returns (bool result, uint256 wins);
}

contract Lv3Solution is Script {
    
    function run(address guesser) public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        (bool result, uint256 wins) = ICoinFlipGuesser(guesser).guess();
        vm.stopBroadcast();

        console.log("Guessed correctly: ", result);
        console.log("Consecutive wins: ", wins);
    }
}