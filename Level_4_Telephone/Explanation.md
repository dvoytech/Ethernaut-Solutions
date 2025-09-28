# Telephone
This level shows the difference between tx.origin and msg.sender. msg.sender is the immediate caller of the current function, while tx.origin is the EAO that started the whole transaction.

To sarisfy the condition in Telephone.sol and changing the owner, tx.origin must be different from msg.sender. That can be done easily by using middle contract to call the changeOwner in Telephone.sol

## File Overview
- src/Telephone.sol: target contract
- src/MiddleContract.sol: intermediary contract, calls changeOwner in Telephone.sol

- script/Lv4Solution.s.sol: deploys MiddleContract.sol and calls callChangeOwner