pragma solidity ^0.5.13;

contract ExceptionExample {

  mapping (address => uint) public balanceReceived;

  function sendMoney() public payable {
    assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
    balanceReceived[msg.sender] += uint64(msg.value);
  }

  function withdrawMoney(address payable _to, uint _amount) public {
    require(_amount <= balanceReceived[msg.sender], "You don't have enought ether.");
    assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
    balanceReceived[msg.sender] -= _amount;
    _to.transfer(_amount);
  }

}