// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

// Array - dynamic or fixed size
contract array {

    //The array size can be changed when we don't give the number of array size.
    uint[] public dynamicArray = [1,2,3];
    uint[3] public fixedArray = [4,5,6];

    function manipulateArray() external {
        //add element into the array
        //[1,2,3,4]
        dynamicArray.push(4); 

        //get index 1 element from array
        uint x = dynamicArray[1]; 

        //update the index 2 element from 3 to 4321
        //[1,2,4321,4]
        dynamicArray[2] = 4321;

        //delete index 1 element in the array => the value will change to default value and it's size is the same
        //[1,0,4321,4]
        delete dynamicArray[1]; 

        //pop the latest element in the array
        //[1,0,4321]
        dynamicArray.pop();

        //check array's size
        dynamicArray.length;

        //create an array in memory
        //can just update value, can't use pop or push method to update the array
        uint[] memory memoryArray = new uint[](5);
    }

    //Return array will copy the array into the memory.
    //It is not a recommend way to return the array because it will take a lot of cost for running this function.
    function returnArray() external view returns (uint[] memory){
        return dynamicArray;
    }
}
