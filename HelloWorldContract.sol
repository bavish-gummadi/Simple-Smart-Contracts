pragma solidity ^0.4.0;

contract HelloWorldContract {
	string word = "Hello World";
    address issuer;
	function HelloWorldContract() public {
	    issuer = msg.sender;
	}
	modifier ifIssuer() {
	    if(issuer != msg.sender) {
	        throw;
	    }
	    else {
	        _;
	    }
	}
	
	function getWord() constant public returns(string) {
	    return word;
	}
	
	function setWord(string newWord) ifIssuer public returns(string) {
	    word = newWord;
	    return word;
	}
}