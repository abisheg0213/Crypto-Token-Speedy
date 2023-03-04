pragma solidity ^0.8.14;
contract speedy
{
    mapping (address => uint) accounts;
    address [] acc;
    function reg_account() public 
    {
        accounts[msg.sender]=0;
        acc.push(msg.sender);
    }
    function add_token(uint c) public valid_user(msg.sender)
    {
        accounts[msg.sender]+=c;
    }
    modifier valid_user(address s)
    {
        require(vaild_acc(s)==true);
        _;
    }
    function vaild_acc(address r) public view returns(bool)
    {
        uint y=0;
        bool avail;
        for(uint i=0;i<acc.length;i++)
        {
            // v=i;
            if(acc[i]==r)
            {
                avail=true;
                y=1;
            }
        }
        if (y==0)
        {
            avail=false;
        }
        return avail;
    }
    modifier minbalavail(address u,uint y)
    {
        require(accounts[u]>=y);
        _;
    }
    function transfer_coin(address rec,uint t) public valid_user(msg.sender) minbalavail(msg.sender,t) valid_user(rec)
    {
        accounts[msg.sender]-=t;
        accounts[rec]+=t;
    }
    function get_balance() public valid_user(msg.sender) returns(uint) 
    {
        return accounts[msg.sender];
    }
}
