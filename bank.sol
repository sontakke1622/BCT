// SPDX-License-Identifier:GPL-3.0
pragma solidity >=0.4.16<0.9.0;
contract Bank {
    address public owner =msg.sender;
    mapping(address => uint256) private userbalance;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyowner() {
        require(msg.sender == owner, "You are not the owner of this contract");
        _;
    }
    function deposit() public payable returns (bool) {
        require(msg.value > 10 wei,"Please Deposit at least 10 wei");
        userbalance[msg.sender] += msg.value;
        return true;
    }

    function withdraw(uint256 _amount) public payable returns (bool) {
        require(
            _amount <=userbalance[msg.sender],
            "You dont have sufficient funds!"
        );
        userbalance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        return true;
    }

    function getbalance() public view returns (uint256) {
        return userbalance[msg.sender];
    }

    function getcontractBalance() public view onlyowner returns (uint256) {
        return address(this).balance;
    }

    function withdrawfunds(uint256 _amount)
    public
    payable
    onlyowner
    returns (bool)
    {
        payable(owner).transfer(_amount);
        return true;
    }
}
