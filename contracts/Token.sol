// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name;
    string public symbol;
    uint public decimals = 18;
    uint public totalSupply;

    //Track balances 
mapping (address => uint) public balanceOf; //mapping lets you store information with key-value pairs
    
    // send tokens 

    constructor(string memory _name, string memory _symbol, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals);
        balanceOf[msg.sender] = totalSupply; //update the balance of the person deploying the SC, to the entire total supplyof the tokens that we specified above(_totalSupply).
        //Basically going to take alll the tokens and going to sign them to the deployer
    }



}

