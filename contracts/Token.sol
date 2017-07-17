pragma solidity ^0.4.11;

contract Token {

	uint public totalSupply;

	function balanceOf(address owner) constant returns (uint balance);

	function transfer(address to, uint value) returns (bool success);

	function transferFrom(address from, address to, uint value) returns (bool success);

	function approve(address spender, uint value) returns (bool success);

	event Transfer(address indexed from, address indexed to, uint value);
	event Approval(address indexed owner, address indexed spender, uint value);
}
