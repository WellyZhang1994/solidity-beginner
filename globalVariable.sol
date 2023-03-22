// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract globalVariable{
    uint public var1 = 123;

    function globalVar() external view returns(address, uint, uint) {
        //The global variable is dynamic influenced in the contract. 
        //
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNumber = block.number;
        return (sender, timestamp, blockNumber);
    }
}
