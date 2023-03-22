// SPDX-License-Identifier: T
pragma solidity ^0.8.7;

contract structExample{

    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;

    function carStructs() external {

        //Three way to init the struce
        //Once we use memory to declared the Car struct, it will be gone when the function is finished
        Car memory toyota = Car("car1", 1994, msg.sender);
        Car memory benz = Car( { model: "benzs", year: 1995, owner: msg.sender} );
        Car memory tesla;
        tesla.model = "tesla";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(benz);
        cars.push(tesla);
        cars.push(Car("bmw", 1995, msg.sender));

        //Data location must be "storage", "memory" or "calldata"
        //If we want to update the struct which already saved in the struct list, we need to use the storage location to modify it.
        Car storage _smallCar = cars[0];
        _smallCar.year = 2000;

    }
}
