pragma solidity ^0.5.13;

contract LibrariesExample {
  
  mapping(address => uint) public tokenBalance;
  
  import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

  constructor () public {
    tokenBalance[msg.sender] = 1;
  }

  function sendToken(address _to, uint _amount) public returns(bool) {
    tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
    tokenBalance[_to] = tokenBalance[_to].add(_amount);
    return true;
  }

}