// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract hashFunction{
    function hash(string memory text, uint num, address addr) external pure returns(bytes32) {
        //the keccak256 function wull return bytes32
        return keccak256(abi.encodePacked(text,num,addr));
    }

    function encode(string memory text0, string memory text1) external pure returns(bytes memory) {
        return abi.encode(text0,text1);
    }

    //econdePacked will return the same hash if the value is changed from first parameter to second parameter
    function encodePacked(string memory text0, string memory text1) external pure returns(bytes memory) {
        return abi.encodePacked(text0,text1);
    }

    function coolision(string memory text0, uint x, string memory text1) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}
