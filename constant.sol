// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract constantVariable{

    //The constant variabale means it never be changed in the contract.
    //And also it's gas cost is lower than regular state variable.

    //gas:356
    address public constant MY_ADDRESS = 0x22f8778cc67f97D501d4Bd7D1Dab84d6Ed58e793;

    //gas:2511
    address public MY_ADDRESS_2 = 0x22f8778cc67f97D501d4Bd7D1Dab84d6Ed58e793;
}
