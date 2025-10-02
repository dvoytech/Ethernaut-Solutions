# Delegation
This level focuses on 3 main topics:

## What is delegation?
Delegation is a feature of Solidity, ran by `.delegatecall`, that enables function from some other contract to be ran in the context of the current smart contract. In this example, function `pwn()` from Delegate contract is ran in the context of Delegation contract. If the function were to modify anything, it would be modified in the Delegation contract.

What is it used for? Mostly for "updating" code of smart contracts. Once anything is deployed on blockchain, it cannot be modified. `.delegatecall` can work around that by spliting codebase into more contracts and letting one main contract execute the code of others. When something needs to be changed, only one partial contract is modified and redeployed, not the whole codebase.

However, that also brings a security risk. If an attacker can influence what call is delegated, he can potentially run malicious code in someone else's contract, leading to change in variables or draining funds.

## What is a fallback?
Fallback function is a special function that runs whenever a contract is called in a way that doesn't match any of its functions. It's used to handle error calls in a safe way.

## What is msg.data?
`mgs.data` is a global variable that contains calldata (data about the function called on the contract). It comprises an encoded function selector (first 4 bytes of the function signature) and encoded arguments.

## Exploit
Because the fallback function of `Delegation.sol` lets us call any function (it just passes on any `msg.data` without checking), we can easily call `pwn()` function of the `Delegate.sol`, which changes the owner of contract. It's not necessary to manually compose `msg.data`, all that's needed is creating simple interface with `pwn()` function (has to be same as the one in Delegate contract) and calling it on `Delegation.sol`. Because the `pwn()` is executed as if it were in Delegation contract, owner is ours.

## File overview
- `src/Delegation.sol:` target contract

- `script/Lv6Solution:` calls `pwn()` function in Delegation contract
