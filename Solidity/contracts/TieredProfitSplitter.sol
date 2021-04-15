pragma solidity ^0.5.0;

contract TieredProfitSplitter {

    address payable employee_one; 
    address payable employee_two; 
    address payable employee_three;
    
    address payable human_resources = 0x26f07a83CE613BDfec1cc2C24150273263d01D8D;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint amount = msg.value / 3;
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        employee_one.transfer(msg.value - amount*3); // hr gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}

