pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint;
    string public myNickname;

    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }

    function setMyNickname (string memory _myNickname) public {
        myNickname = _myNickname;
    }
}