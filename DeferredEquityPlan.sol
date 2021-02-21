pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
    uint fakenow=now;
    
    address human_resources;
    address payable employee; // bob
    bool active=true; // this employee is active at the start of the contract
    
    // @TODO: Set the total shares and annual distribution
    uint total_shares=1000;
    uint annual_distribution=250;
    
    uint start_time=fakenow;
    
    // @TODO: Set the 'unlock_time' to be 365 days from now
    uint unlock_time=fakenow+365;
    
    uint public distributed_shares=0; // starts at 0 
    
    constructor(address payable _employee) public {
        human_resources=msg.sender;
        employee=_employee;
    }
    
    function fastforward() public {
        fakenow+=100 days;
    }
    
    function get_distributed_shares() public view returns(uint) {
        return distributed_shares;
    }
    
    function distribute() public {
        require(msg.sender==human_resources || msg.sender==employee,"You are not authorized to execute this contract.");
        require(active==true,"Contract not active.");
        
        require(unlock_time<=fakenow,"unlock time is in range.");
        require(distributed_shares<total_shares,"distributed shares is less than total shares");
        
        unlock_time+=365;
        
        distributed_shares=((fakenow-start_time)/365)*annual_distribution;
        
        if (distributed_shares>1000) {
            distributed_shares=1000;
        }
    }
    
    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender==human_resources || msg.sender==employee,"You are not authorized to deactivate this contract.");
        active=false;
    }
    
    function() external payable {
        revert("Do not send Ether to this contract");
    }   
}