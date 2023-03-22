// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract stateVariable{

    //The var1 is a state variable and it can be stored on the blockchain.
    //The state variabel is declared inside the contract but out side the function.
    uint public var1 = 123;

    function test() external pure returns(uint){
        // The var2 is a local variable and it can only live in the function runtime.
        uint var2 = 456;
        return var2;
    }
}