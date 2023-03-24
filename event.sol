// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract eventTemplate{
    event Log(string message, uint value);

    //up to 3 index in parameters for searching used
    event IndexLog(address indexed sender, uint value);

    function example() external {
        emit Log("foo", 1234);
        emit IndexLog(msg.sender, 1234);

    }

    event Message(address indexed _from, address indexed _to, string message);
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
