pragma solidity ^0.5.13;

contract ExceptionExample {

  mapping (address => uint) public balanceReceived;

  address payable owner;

  // Constructor 
  // The constructor is called once on the contract deployment.
  constructor () public {
    owner = msg.sender;
  }
  
  // View function
  // Allow u to access the storeds variables but only on the view mode.
  // U can't write anything in row this function
  // Can call a pure function.
  function getOwner() public view returns(address) {
    return owner;
  }

  // Pure function
  // Disallow u to access any of the stored variables.
  // It can use the computer power but without interacting with any variables.
  // Cant call a view function.
  public convertWeiToEther(uint _amountWei) public pure returns(uint) {
    return _amountWei ether;
  }

  // In view or pure functions u cant call any writing functions
  // But in the writing functions u can call any of those others.
  function destroySmartContract() public {
    require(msg.sender == owner, "ur not the owner.");
    selfdestruct(owner);
  }

  function receiveMoney() public payable {
    assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
    balanceReceived[msg.sender] += msg.value;
  }

  function withdrawMoney(address payable _to, uint _amount) public {
    require(_amount <= balanceReceived[msg.sender], "You don't have enough ether.");
    assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
    balanceReceived[msg.sender] -= _amount;
    _to.transfer(_amount);
  }

  // Fallback function. 
  // It is called when u communicate with the contract without specifiyng any function;
  // Is getting payable just bcause we want to send money on this call.
  function () external payable {
    receiveMoney();
  }

}