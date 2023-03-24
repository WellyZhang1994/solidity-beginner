// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract functionOutputs{

    //return mutiple outputs
    function returnMany() public pure returns (uint, bool){
        return (1, true);
    }
    //return named output
    function named() public pure returns (uint x, bool b){
        return (100, true);
    }
    //assigned
    function assigned() public pure returns (uint x, bool b){
        x = 10;
        b = false;
    }    

    function destructingAssignments() public pure {
        (uint x, bool b) = returnMany();
        //only return second value
        (, bool _b) = returnMany();
    }    
}
