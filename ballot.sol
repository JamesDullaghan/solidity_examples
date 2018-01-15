pragma solidity ^0.4.17;


contract CallerContract {
    // New contract
    // CalledContract toBeCalled = new CalledContract();

    // Call an existing contract
    // CalledContract(blockchainAddress)
    CalledContract toBeCalled = CalledContract(0x9e932949dkwkd)

    function getNumber() public constant returns(uint) {
        return toBeCalled.getNumber();
    }

    function getWords() public constant returns(bytes32) {
        return toBeCalled.getWords();
    }
}


contract CalledContract {
    uint number = 42;

    // contract to contract must be byte32
    bytes32 words = "Hello, World";

    function getNumber() public constant returns(uint) {
        return number;
    }

    function getWords() public constant returns(bytes32) {
        return words;
    }
}
