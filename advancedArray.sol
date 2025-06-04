// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

// Advanced Array Operations in Solidity
contract advancedArray {

    // State variables - different types of arrays
    uint[] public dynamicArray = [1, 2, 3, 4, 5];
    uint[5] public fixedArray = [10, 20, 30, 40, 50];
    string[] public stringArray = ["apple", "banana", "cherry"];
    address[] public addressArray;
    
    // Nested arrays (array of arrays)
    uint[][] public nestedArray;
    
    // Array initialization in constructor
    constructor() {
        // Initialize address array
        addressArray.push(msg.sender);
        addressArray.push(address(this));
        
        // Initialize nested array
        nestedArray.push([1, 2, 3]);
        nestedArray.push([4, 5, 6]);
    }
    
    // Advanced array operations
    function advancedOperations() external {
        // Create memory array with specific size
        uint[] memory memArray = new uint[](3);
        memArray[0] = 10;
        memArray[1] = 20;
        memArray[2] = 30;
        
        // Note: memory arrays cannot be resized (no push/pop)
        // This would cause an error: memArray.push(40);
        
        // Create a copy of a storage array to memory
        uint[] memory copyArray = dynamicArray;
        
        // Modify the copy (doesn't affect original)
        copyArray[0] = 999;
    }
    
    // Array slicing (copying portions of arrays)
    // Note: Only available for dynamic arrays in storage
    function arraySlicing(uint start, uint end) external view returns (uint[] memory) {
        require(start < end && end <= dynamicArray.length, "Invalid range");
        
        // Create a new memory array to hold the slice
        uint[] memory result = new uint[](end - start);
        
        // Copy elements from the original array
        for (uint i = start; i < end; i++) {
            result[i - start] = dynamicArray[i];
        }
        
        return result;
    }
    
    // Array concatenation
    function concatenateArrays(uint[] calldata arr) external view returns (uint[] memory) {
        // Create a new array with combined length
        uint[] memory result = new uint[](dynamicArray.length + arr.length);
        
        // Copy elements from first array
        for (uint i = 0; i < dynamicArray.length; i++) {
            result[i] = dynamicArray[i];
        }
        
        // Copy elements from second array
        for (uint i = 0; i < arr.length; i++) {
            result[dynamicArray.length + i] = arr[i];
        }
        
        return result;
    }
    
    // Finding elements in array
    function findElement(uint element) external view returns (int) {
        for (uint i = 0; i < dynamicArray.length; i++) {
            if (dynamicArray[i] == element) {
                return int(i); // Return index if found
            }
        }
        return -1; // Return -1 if not found
    }
    
    // Remove element at specific index (preserving order)
    function removeAtIndex(uint index) external {
        require(index < dynamicArray.length, "Index out of bounds");
        
        // Shift elements to the left
        for (uint i = index; i < dynamicArray.length - 1; i++) {
            dynamicArray[i] = dynamicArray[i + 1];
        }
        
        // Remove the last element
        dynamicArray.pop();
    }
    
    // Remove element at specific index (not preserving order but more gas efficient)
    function removeAtIndexEfficient(uint index) external {
        require(index < dynamicArray.length, "Index out of bounds");
        
        // Replace with the last element and pop
        dynamicArray[index] = dynamicArray[dynamicArray.length - 1];
        dynamicArray.pop();
    }
    
    // Sorting an array (bubble sort implementation)
    function sortArray() external {
        uint n = dynamicArray.length;
        
        for (uint i = 0; i < n - 1; i++) {
            for (uint j = 0; j < n - i - 1; j++) {
                if (dynamicArray[j] > dynamicArray[j + 1]) {
                    // Swap elements
                    uint temp = dynamicArray[j];
                    dynamicArray[j] = dynamicArray[j + 1];
                    dynamicArray[j + 1] = temp;
                }
            }
        }
    }
    
    // Working with nested arrays
    function addToNestedArray(uint[] calldata values) external {
        nestedArray.push(values);
    }
    
    function getNestedArrayLength() external view returns (uint) {
        return nestedArray.length;
    }
    
    function getInnerArrayLength(uint index) external view returns (uint) {
        require(index < nestedArray.length, "Index out of bounds");
        return nestedArray[index].length;
    }
    
    // Array as function parameters
    function sumArray(uint[] calldata arr) external pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }
    
    // Return multiple arrays
    function getArrays() external view returns (uint[] memory, string[] memory) {
        return (dynamicArray, stringArray);
    }
    
    // Get the entire array (not recommended for large arrays due to gas costs)
    function getDynamicArray() external view returns (uint[] memory) {
        return dynamicArray;
    }
    
    // Array utilities
    function arraySum() external view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i];
        }
        return sum;
    }
    
    function arrayMax() external view returns (uint) {
        require(dynamicArray.length > 0, "Array is empty");
        
        uint max = dynamicArray[0];
        for (uint i = 1; i < dynamicArray.length; i++) {
            if (dynamicArray[i] > max) {
                max = dynamicArray[i];
            }
        }
        return max;
    }
    
    function arrayMin() external view returns (uint) {
        require(dynamicArray.length > 0, "Array is empty");
        
        uint min = dynamicArray[0];
        for (uint i = 1; i < dynamicArray.length; i++) {
            if (dynamicArray[i] < min) {
                min = dynamicArray[i];
            }
        }
        return min;
    }
    
    // Memory vs Storage arrays explanation
    function memoryVsStorage() external {
        // Storage arrays
        // - Persist between function calls
        // - Can be resized with push and pop
        // - More expensive gas-wise
        // - State variables are always storage
        
        // Memory arrays
        // - Temporary, exist only during function execution
        // - Fixed size, cannot be resized
        // - Less expensive gas-wise
        // - Function parameters with calldata are read-only
        
        // Example: modifying storage array
        dynamicArray[0] = 999; // Changes persist
        
        // Example: creating and using memory array
        uint[] memory tempArray = new uint[](3);
        tempArray[0] = 1;
        tempArray[1] = 2;
        tempArray[2] = 3;
        // tempArray is discarded after function ends
    }
}