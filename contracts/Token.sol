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
    mapping (address => mapping (address => uint )) public allowance;
    
    // send tokens 
    event Transfer(
        address indexed from, 
        address indexed to, 
        uint value
        );

    event Approval(
        address indexed owner,
        address indexed spender,
        uint value
    );

    constructor(
        string memory _name, 
        string memory _symbol, 
        uint _totalSupply
        ) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10**decimals);
        balanceOf[msg.sender] = totalSupply; //update the balance of the person deploying the SC, to the entire total supplyof the tokens that we specified above(_totalSupply).
        //Basically going to take all the tokens and going to sign them to the deployer
    }

    function transfer(address _to, uint _value) 
        public 
        returns (bool success) 
    {
        // require that sender has enough tokens to spend
        require (balanceOf[msg.sender] >= _value);
        require(_to != address(0));

        //deduct tokens from spender
       balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        //credit tokens to spender
        balanceOf[_to] = balanceOf[_to] + _value;

        //Emit Event
        emit Transfer(msg.sender, _to, _value);
        return true;

    }

    function approve (address _spender, uint _value) 
    public 
    returns(bool success)
    {
        require(_spender != address(0));

        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

}
