pragma solidity ^0.5.13;

contract SimpleMappingExample {
  mapping (uint => string) public myMapping;
  mapping (address => bool) public myAddressMapping;
  
  function setValue(uint _index, string memory _myValue) public {
    myMapping[_index] = _myValue;
  }

  function setMyAddressToTrue() public {
    myAddressMapping[msg.sender] = true;
  }

}