pragma solidity ^0.4.17;

contract PayableContract {

    function PayableContract() {

    }

    function receieveFunds() payable {

    }

    function getter() constant returns(uint) {
        return this.balance;
    }
}

