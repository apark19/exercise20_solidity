pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // ceo
    address payable employee_two; // cto
    address payable employee_three; // bob
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one=_one;
        employee_two=_two;
        employee_three=_three;
    }
    
    // Should always return 0! Use this to test your 'deposit' function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }    
    
    function deposit() public payable {
        uint points=msg.value/100;
        uint total=0;
        uint amount;
        
        amount=points*60;
        employee_one.transfer(amount);
        total+=amount;
        
        amount=points*25;
        employee_two.transfer(amount);
        total+=amount;
        
        amount=points*15;
        employee_three.transfer(amount);
        total+=amount;
        
        employee_one.transfer(msg.value-total);
    }
    
    function() external payable {
        deposit();    
    }
}