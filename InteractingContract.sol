pragma solidity ^0.4.0;

contract CallerContract {
	//Can also use address of CalledContract if already deployed
	CalledContract toBeCalled = new CalledContract();
	
	function getNumber() constant returns(uint) {
	    return toBeCalled.getNumber();
	}
	function getWords() constant returns(bytes32) {
	    return toBeCalled.getWords();
	}
}
contract CalledContract {
	bytes32 words = "Hellow World";
	uint number = 42;
	function getWords() constant returns(bytes32) {
	    return words;
	}
	function getNumber() constant returns(uint) {
	    return number;
	}
}