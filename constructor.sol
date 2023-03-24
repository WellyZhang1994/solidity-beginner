// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract constructorTemplate{
    address public owner;
    uint public x;
    
    //The constructor can only be called once when we deploy the contract
    constructor(uint _x){
        owner = msg.sender;
        x = _x;
    }
}