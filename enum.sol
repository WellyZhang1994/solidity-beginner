// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract enumVariable{

    //default value is 0 (means the first element)
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;
    struct Order {
        address buyer;
        Status status;
    }

    function get() external view returns (Status) {
        return status;
    }

    //The enum is same as the other language, we can assign a number to represent the enum value
    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    //The status value will be updated to 0 index (None)
    function reset() external {
        delete status;
    }
}
