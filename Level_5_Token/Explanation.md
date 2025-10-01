# Token
This level focuses on arithmetic overflow and underflow. When you subtract `1` from unsigned integer of value `0`, you don't get `-1`, but the max value the uint can hold.

We know the initial amount of our tokens is `20`, so in order to underflow and get the max value, let's send `21`.

The condition `require(balances[msg.sender] - _value >= 0);` is always true, as uint values are always `>= 0`. The result being compared to `0` is also uint, because there is no implicit conversion allowed in solidity between signed and unsigned types, and both `balances[msg.sender]` and `_value` are unsigned.

## File overview
- `src/Token.sol`: target contract

- `script/Lv5Solution.s.sol`: broadcasts transfer transaction with value of 21

## Interesting things to note
- As of Solidity 0.8.0 and later versions, overflow and underflow of any value automatically results in transaction revert. This exploit therefore isn't possible to replicate in the current versions.

- Why do we need to send different address to the parameter `_to` in the transfer function? If we use the same address, the `_value` will get added again to our balance on this line: `balances[_to] += _value;`, which will result in overflow, getting to 20 tokens instead of max value again.

