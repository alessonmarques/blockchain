pragma solidity ^0.5.13;

contract StartStopUpdateExample {

  bool paused = false;
  address owner;

  constructor() public {
    owner = msg.sender;
  }

  function sendMoney() public payable {

  }

  function setPaused(bool _paused) public {
    require(msg.sender == owner, "Ur not the owner.");
    require(!paused, "Contract is paused.");
    paused = _paused;
  }

  function withdrawAllMoney(address payable _to) public {
    require(msg.sender == owner, "Ur not the owner.");
    require(paused, "Contract is not paused.");
    _to.transfer(address(this).balance);
  }

  function destroySmartContract(address payable _to) public {
    require(msg.sender == owner, "Ur not the owner.");
    require(paused, "Contract is not paused.");
    selfdestruct(_to);
  }

}