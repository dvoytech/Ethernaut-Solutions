// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Script.sol";
import "../src/CoinFlipGuesser.sol";

contract DeployGuesser is Script {
    function run(address coinFlipAddr) public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        CoinFlipGuesser guesser = new CoinFlipGuesser(coinFlipAddr);
        vm.stopBroadcast();
        
        console.log("Guesser deployed at: ", address(guesser));
    }
}