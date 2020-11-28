pragma solidity ^0.5.0;
/**
ERC20 & TRC20 Token
Symbol          : nhancv
Name            : Eric Cao Token
Total supply    : 1000000000
Decimals        : 6
@ nhancv MIT license
 */

// ---------------------------------------------------------------------
// ERC-20 Token Standard Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ---------------------------------------------------------------------
contract ERC20Interface {
  /**
  Returns the name of the token - e.g. "MyToken"
   */
  string public name;
  /**
  Returns the symbol of the token. E.g. "HIX".
   */
  string public symbol;
  /**
  Returns the number of decimals the token uses - e. g. 8
   */
  uint8 public decimals;
  /**
  Returns the total token supply.
   */
  uint256 public totalSupply;
  /**
  Returns the account balance of another account with address _owner.
   */
  function balanceOf(address _owner) public view returns (uint256 balance);
  /**
  Transfers _value amount of tokens to address _to, and MUST fire the Transfer event. 
  The function SHOULD throw if the _from account balance does not have enough tokens to spend.
   */
  function transfer(address _to, uint256 _value) public returns (bool success);
  /**
  Transfers _value amount of tokens from address _from to address _to, and MUST fire the Transfer event.
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
  /**
  Allows _spender to withdraw from your account multiple times, up to the _value amount. 
  If this function is called again it overwrites the current allowance with _value.
   */
  function approve(address _spender, uint256 _value) public returns (bool success);
  /**
  Returns the amount which _spender is still allowed to withdraw from _owner.
   */
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
  /**
  MUST trigger when tokens are transferred, including zero value transfers.
   */
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  /**
  MUST trigger on any successful call to approve(address _spender, uint256 _value).
    */
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

/**
Owned contract
 */
contract Owned {
    address public owner;
    address public newOwner;
 

  event OwnershipTransferred(address indexed _from, address indexed _to);

  constructor () public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }
  

  function transferOwnership(address _newOwner) public onlyOwner {
    newOwner = _newOwner;
  }

  function acceptOwnership() public {
    require(msg.sender == newOwner);
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    newOwner = address(0);
  }
}

/**
Function to receive approval and execute function in one call.
 */
contract TokenRecipient { 
  function receiveApproval(address _from, uint256 _value, address _token, bytes memory _extraData) public; 
}

/**
Token implement
 */
contract Token is ERC20Interface, Owned {
    struct stakingInfo {
        uint256 amount;
        bool requested;
        uint256 releaseDate;
        uint256 drawDate;
    }
    
stakingInfo stk;
  mapping (address => uint256) _balances;
  mapping (address => mapping (address => uint256)) _allowed;
  mapping (address => uint256) private _stake; // tong tien minh stake
  mapping (address => stakingInfo[]) public UserMap; // mang chua cac user

  event Burn(address indexed from, uint256 value);
  
  function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balances[_owner];
  }
  
   function stake(uint256 amount) public returns (bool) {
        require(amount > 0);
        require(amount <= balanceOf(msg.sender));
        _transfer(msg.sender,address(this), amount);
        _stake[msg.sender] += amount;
        stk.drawDate = 0;
        stk.releaseDate  = now;
        stk.amount = amount;
        stk.requested = true;
        UserMap[msg.sender].push(stk);
        return true;
    }
    
    function checkAddressOfArray(address account) public view returns (bool){
        if(UserMap[msg.sender].length > 0) {
            return true;
        }
        return false;
    }
    // function userOfStake() public view returns (userStake[] memory) {
    //     return UserMap;
    // }
    
    function balanceOfStake() public view  returns (uint256) {
        return _stake[msg.sender];
    }
    
    function withDraw() public  returns (uint256) {
        uint256 timeStake;
        uint256 timeNew;
        uint256 sum = 0;
        uint256 sumNew = 0;
        uint256 total;
        for(uint256 i=0;i<UserMap[msg.sender].length;i++) {
            timeStake = (now - UserMap[msg.sender][i].releaseDate) ;
            if(timeStake >= 30){
                sum = UserMap[msg.sender][i].amount * 1 / 100 * timeStake;
            }
            UserMap[msg.sender][i].releaseDate = now;
            UserMap[msg.sender][i].drawDate = now;
        }
         
        _transfer(address(this),msg.sender,sum);
           if(_stake[msg.sender] <= 0 ) {
                sum = 0;                    
          }
          return sum;
    }
    
    function checkDateDraw() public returns (uint256) {
        return UserMap[msg.sender][UserMap[msg.sender].length].drawDate;
    }
  function unStaking(uint256 amount) public returns (bool) {
      require(amount <= _stake[msg.sender]);
      require(amount >= 0);
      _stake[msg.sender] -= amount;
      for(uint256 j=0;j< UserMap[msg.sender].length;j++)
      {
        for(uint256 i= UserMap[msg.sender].length-1; i>=0;i--){
             if(amount <= UserMap[msg.sender][i].amount) {
              UserMap[msg.sender][i].amount -= amount;
              _transfer(address(this),msg.sender,amount);
                return true;
              } else {
                amount -= UserMap[msg.sender][i].amount;
                UserMap[msg.sender][i].amount = 0;
              _stake[msg.sender] -= UserMap[msg.sender][i].amount;
              _transfer(address(this),msg.sender,amount);
                  UserMap[msg.sender][i].requested = false;
              }
        }
          
      }
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    _transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    _allowed[_from][msg.sender] -= _value;
    _transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success) {
    _allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
    return _allowed[_owner][_spender];
  }

  /**
  Owner can transfer out any accidentally sent ERC20 tokens
   */
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }

  /**
  Approves and then calls the receiving contract
   */
  function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
    TokenRecipient spender = TokenRecipient(_spender);
    approve(_spender, _value);
    spender.receiveApproval(msg.sender, _value, address(this), _extraData);
    return true;
  }

  /**
  Destroy tokens.
  Remove `_value` tokens from the system irreversibly
    */
  function burn(uint256 _value) public returns (bool success) {
    require(_balances[msg.sender] >= _value);
    _balances[msg.sender] -= _value;
    totalSupply -= _value;
    emit Burn(msg.sender, _value);
    return true;
  }

  /**
  Destroy tokens from other account.
  Remove `_value` tokens from the system irreversibly on behalf of `_from`.
    */
  function burnFrom(address _from, uint256 _value) public returns (bool success) {
    require(_balances[_from] >= _value);
    require(_value <= _allowed[_from][msg.sender]);
    _balances[_from] -= _value;
    _allowed[_from][msg.sender] -= _value;
    totalSupply -= _value;
    emit Burn(_from, _value);
    return true;
  }

  /**
  Internal transfer, only can be called by this contract
    */
  function _transfer(address _from, address _to, uint _value) internal {
    // Prevent transfer to 0x0 address. Use burn() instead
    require(_to != address(0x0));
    // Save this for an assertion in the future
    uint previousBalances = _balances[_from] + _balances[_to];
    // Subtract from the sender
    _balances[_from] -= _value;
    // Add the same to the recipient
    _balances[_to] += _value;
    emit Transfer(_from, _to, _value);
    // Asserts are used to use static analysis to find bugs in your code. They should never fail
    assert(_balances[_from] + _balances[_to] == previousBalances);
  }

}

contract CommonToken is Token {

  constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _initialSupply * 10 ** uint256(decimals);
    _balances[msg.sender] = totalSupply;
  }

  /**
  If ether is sent to this address, send it back.
   */
  function () external payable {
    revert();
  }

}

contract NCToken is CommonToken {

   constructor() CommonToken("acgroup", "AC", 1, 1000) public {}


}

