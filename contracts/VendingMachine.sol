// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract VendingMachine {

    uint price= 1 ether;
    address public owner;
    mapping (address => uint) public machineItems;

    
    constructor() {
        owner = msg.sender;
        machineItems[address(this)] = 500;
    }
    function increaseItems(uint _items) public returns(bool){
        require(msg.sender==owner,"You are not Owner");
        machineItems[address(this)] += _items;
        
        return true;
       
    }
        
    function purchase(uint _amount) public payable {
        require(msg.value >= _amount * price, "You must pay at least 1 ETH per Item");
        require(machineItems[address(this)] >= _amount, "Not enough Items in stock to complete this purchase");
        
        machineItems[address(this)] -= _amount;
        machineItems[msg.sender] += _amount;
    }
    function balanceOfContract() public view returns (uint){
        require(msg.sender==owner,"You can't access this function");
        return address(this).balance;
    }
}
