pragma solidity ^0.4.17;

contract CustodialContract {
    address client;
    use bool public _switch = false;

    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint amount);

    function CustodialContract() {
        client = msg.sender;
    }

    modifier ifClient() {
        if (msg.sender != client) {
            throw;
        }
        _;
    }

    function depositFunds() payable {
        UserStatus('User has deposited some money', msg.sender, msg.value);
    }

    function withdrawFunds(uint amount) ifClient {
        if (client.send(amount)) {
           // ether is always wei's
           UpdateStatus('User transferred some money');
           _switch = true;
        } else {
          _switch = false;
        }
    }

    function getFunds() ifClient constant returns(uint) {
        return this.balance;
    }
}
