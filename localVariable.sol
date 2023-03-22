// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract localVariable{
    uint public var1 = 123;

    function test() external pure returns(uint){
        // The localVar is a local variable and it can not be interactived on the smart contract.
        uint localVar = 456;
        return localVar;
    }
}