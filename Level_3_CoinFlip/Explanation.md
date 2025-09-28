# CoinFlip
This level demonstrates how difficult it is to create random numbers on blockchain. Since the computing logic is visible to everyone, it's not difficult to replicate the exact same calculation to "guess" the side of the coin.

## File Overview
- src/CoinFlip.sol: target contract
- src/CoinFlipGuesser.sol: helper contract, guessing the flip result

- script/CoinFlipGuesserDeploy.s.sol - script, deploying CoinFlipGuesser
- script/Level3Solution.s.sol - script, triggering CoinFlipGuesser

## Implementation logic
First, I'm going to create a separate contract, the CoinFlipGuesser. It's purpose is using the same logic to calculate the result of the coin flip and sending the result to CoinFlip.sol. It has to be done 10 times, which means running the Level3Solution.s.sol 10 times.

Why is it necessary to deploy seperate contract to trigger the CoinFlip.sol? Can't it be done within the solution script? For example by using blockhash(block.number - 1)?

Unless you get really lucky, no. blockhash function is executed locally, while the result gets broadcasted on-chain. By the time the transaction gets executed on-chain, there might be already a new block, making data from blockhash obsolete. One way to fix this is to ensure that all the logic gets executed withing the same block - by puting it all into one transaction. That's why we need to call a function in a separate contract.

