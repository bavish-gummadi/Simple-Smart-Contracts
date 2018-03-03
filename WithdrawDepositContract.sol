pragma solidity ^0.4.0;

contract WithdrawDepositContract {
	address client;
	bool _switch = false;
	event UpdateStatus(string _msg, uint _amount);
	event UserStatus(string _msg, address user, uint amount);
	
	function WithdrawDepositContract() payable public {
        client = msg.sender;
	}
	modifier ifClient () {
	    if(msg.sender != client) {
	        throw;
	    }
	    else {
	        _;
	    }
	}
	function depositFunds() payable public {
	    UserStatus("User has deposited some money", msg.sender, msg.value);
	}
	function withdrawFunds(uint amount) public ifClient {
	    if(client.send(amount)) {
	        _switch = true;
	        UpdateStatus("User has transfered some money", amount);

	    }
	    else {
	        _switch = false;
	    }
	}
	function getFunds() constant public ifClient returns(uint) {
		return this.balance;
	}
}