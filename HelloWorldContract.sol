pragma solidity ^0.4.0;

contract HelloWorldContract {

    string word = "Hello World";
    address public issuer;

    function HelloWorldContract() private {
        // constructor
        issuer = msg.sender;
        // msg object has data
        // useful data is sender ()
    }

    modifier ifIssuer() {
        if (issuer != msg.sender) {
            revert();
        } else {
            _;
        }
    }

    function getWord() public constant returns(string) {
        // getter
        return word;
    }

    function setWord(string newWord) ifIssuer private returns(string) {
        // setter
        word = newWord;
        return "This is the creator!";
    }
}
