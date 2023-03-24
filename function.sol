// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract functionTemplate{

    //exernal means we can only call this function outside
    //pure means this function is readonly
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x - y;
    }
  
}
