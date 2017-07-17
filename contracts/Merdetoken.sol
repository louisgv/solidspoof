pragma solidity ^0.4.11;

import "./Token.sol";

contract Merdetoken is Token {

	mapping (address => uint) balances;

	mapping (address => mapping (address => uint)) allowed;

	function transfer(address to, uint value)
		returns (bool success) {

		uint senderBalance = balances[msg.sender];
		uint receiverBalance = balances[to];

		// NOTE: Has enough capital?
		if (senderBalance >= value && value > 0) {
			senderBalance -= value;
			receiverBalance += value;

			Transfer(msg.sender, to, value);
			return true;
		} else {
			return false;
		}
	}

	function transferFrom(address from, address to, uint value)
	 	returns (bool success){

		uint senderBalance = balances[from];

		uint allowedBalance = allowed[from][msg.sender];

		uint receiverBalance = balances[to];

		// NOTE: Has enough capital?
		if (senderBalance >= value &&
				allowedBalance >= value &&
				value > 0) {
				receiverBalance += value;

				senderBalance -= value;
				allowedBalance -= value;

				Transfer(from, to, value);
				return true;
		} else {
			return false;
		}
	}

	function balanceOf(address owner)
	 	constant returns (uint balance){
		return balances[owner];
	}

	function approve(address spender, uint value)
	 	returns (bool success) {
		allowed[msg.sender][spender] = value;
		Approval(msg.sender, spender, value);
		return true;
	}

	function allowance(address owner, address spender)
	 	constant returns (uint remaining){
		return allowed[owner][spender];
	}
}
