pragma solidity ^0.5.13;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint (uint _myUint) public {
        myUint = _myUint;
    }

    string public myNickname;

    function setMyNickname (string memory _myNickname) public {
        myNickname = _myNickname;
    }

    bool public myBool;

    function setMyBool (bool _myBool) public {
        myBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint8() public {
        myUint8++;
    }

    function decrementUint8() public {
        myUint8--;
    }
}