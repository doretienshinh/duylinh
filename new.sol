pragma solidity ^0.5.0;
//interface để cho máy hiểu cách giao tiếp với các hàm của contract token gửi vào
contract Staker{
  function transferFrom(address from, address to, uint tokens) public returns (bool success);// empty because we're not concerned with internal details
  function transfer(address to, uint tokens) public returns (bool success);
}

contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
//
// Borrowed from MiniMeToken
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
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


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract BankToken is ERC20Interface, Owned, SafeMath {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
    uint public price;
    //3 biến dùng để tính lãi
    uint public stakeTime;
    uint public interestRate;
    uint public interestInterval;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    //tạo đối tượng contract token gửi vào để sau này sử dụng hàm của contract đó
    Staker _s;
    //định nghĩa đối tượng gửi tiền vào 
    struct stakingInfo {
        uint256 amount;
        uint256 stakeDate;
        uint256 spawnDate;
        uint256 spareTime;
    }
    //map dùng để lưu trữ tổng số lượng một loại token mà người gửi gửi vào 
    mapping(address => mapping(address => uint)) _stake;
    //map dùng để lưu trữ tổng số lượng lãi của bằng BankToken của một loại token mà người gửi gửi vào
    mapping(address => mapping(address => uint)) _interest;
    //map dùng để lưu trữ thông tin người gửi
    mapping(address => mapping(address => stakingInfo[])) public UserMap;

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "Bank";
        name = "Bank Token";
        decimals = 1;
        _totalSupply = 0;
        balances[msg.sender] = _totalSupply;
        balances[address(this)] = 1000000000;
        emit Transfer(address(0), msg.sender, _totalSupply);
        price = 1;
        //thời gian gửi 120 giây hoặc sau 120 giây sẽ rút được gốc
        stakeTime = 120;
        //lãi suất 1%
        interestRate = 1;
        //nghĩa là 10 giây được lãi 1 lần
        interestInterval = 10;
    }

    function sendToken(address coinAddress, uint amount) private returns(bool response) {     
        _s = Staker(coinAddress);
        return _s.transferFrom(msg.sender, address(this), amount); // message/response to Service is intuitive
    }
    //hàm gửi tiền vào bank, coinAddress là đỉa chỉ contract của token muốn gửi
    //lưu ý cần approve số tiền muốn gửi cho bank bằng cách sử dụng địa chỉ của contract bank dán vào hàm approve của contract token muốn gửi
    //lưu ý 2 : số tiền gửi phải đủ lớn sao cho một chu kỳ lãi phải >1 do lãi trả về theo số nguyên, ví dụ lãi suất 1% thì cần gửi ít nhất 100 đồng
    function stake(address coinAddress,uint256 amount) public returns (bool) {
        sendToken(coinAddress, amount);
        _stake[msg.sender][coinAddress] += amount;
        stakingInfo memory stk;
        stk.spawnDate = now;
        stk.stakeDate  = now;
        stk.amount = amount;
        stk.spareTime = 0;
        UserMap[msg.sender][coinAddress].push(stk);
        return true;
    }
    //trả về tổng lượng token đã gửi, coinAddress là đỉa chỉ contract của token đã gửi
    function balanceOfStake(address coinAddress) public view returns (uint) {
        return _stake[msg.sender][coinAddress];
    }
    //trả về tổng lượng token đã gửi theo từng lần gửi, coinAddress là đỉa chỉ contract của token đã gửi, indexOfStake là lần gửi thứ mấy(bắt đầu từ lần 0)
    function balanceOfEachStake(address coinAddress, uint indexOfStake) public view returns (uint) {
        return UserMap[msg.sender][coinAddress][indexOfStake].amount;
    }
    //hàm đẻ lãi
    function interestSpawn(address coinAddress) private {
        for(uint256 i=0;i<UserMap[msg.sender][coinAddress].length;i++){
            uint interestCount = (now-UserMap[msg.sender][coinAddress][i].spawnDate+UserMap[msg.sender][coinAddress][i].spareTime)/interestInterval;
            UserMap[msg.sender][coinAddress][i].spareTime = (now-UserMap[msg.sender][coinAddress][i].spawnDate+UserMap[msg.sender][coinAddress][i].spareTime)%interestInterval;
            _interest[msg.sender][coinAddress] += UserMap[msg.sender][coinAddress][i].amount*interestCount*interestRate/100;
            UserMap[msg.sender][coinAddress][i].spawnDate = now;
        }    
    }
    //hàm cho phép xem lãi hiện có của một loại token đã gửi, coinAddress là đỉa chỉ contract của token đã gửi
    function interestBalance(address coinAddress) public returns(uint){
        interestSpawn(coinAddress);
        return _interest[msg.sender][coinAddress];
    }
    //hàm rút lãi của một loại token đã gửi, coinAddress là đỉa chỉ contract của token đã gửi
    function withDraw(address coinAddress, uint amount) public returns(bool){
        interestSpawn(coinAddress);
        balances[msg.sender] += amount;
        safeSub(_interest[msg.sender][coinAddress],amount);
        return true;
    }
    //hàm rút gốc của một loại token đã gửi theo lần gửi, coinAddress là đỉa chỉ contract của token đã gửi, indexOfStake là lần gửi thứ mấy
    function unstaking(address coinAddress, uint amount, uint indexOfStake) public returns(bool){
        interestSpawn(coinAddress);
        require(UserMap[msg.sender][coinAddress][indexOfStake].stakeDate + stakeTime<=now);
        UserMap[msg.sender][coinAddress][indexOfStake].amount = safeSub(UserMap[msg.sender][coinAddress][indexOfStake].amount, amount);
        _stake[msg.sender][coinAddress] = safeSub(_stake[msg.sender][coinAddress], amount);
        _s = Staker(coinAddress);
        _s.transfer(msg.sender, amount);
        return true;
    }

    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public view returns (uint) {
        return _totalSupply  - balances[address(0)];
    }
    

    // ------------------------------------------------------------------------
    // Get the token balance for account tokenOwner
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }


    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Token owner can approve for spender to transferFrom(...) tokens
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces 
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Transfer tokens from the from account to the to account
    // 
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the from account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }


    // ------------------------------------------------------------------------
    // Token owner can approve for spender to transferFrom(...) tokens
    // from the token owner's account. The spender contract function
    // receiveApproval(...) is then executed
    // ------------------------------------------------------------------------
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }


    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () external payable {
        revert();
    }


    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }

    
    function buy() public payable returns (bool success){
        require(msg.value>=price*10**6);
        uint tok = msg.value/10**6/price;
        balances[address(this)] = safeSub(balances[address(this)], tok*10**decimals);
        balances[msg.sender] = safeAdd(balances[msg.sender], tok*10**decimals);
        emit Transfer(address(this), msg.sender, tok);
        return true;
    }
    
    function sell(uint tokens) public returns (bool success){
        require(tokens<=balances[address(this)]/(10**decimals));
        require(address(this).balance>=price*10**6*tokens);
        address payable seller = msg.sender;
        seller.transfer(price*10**6*tokens);
        balances[address(this)] = safeAdd(balances[address(this)], tokens*10**decimals);
        balances[msg.sender] = safeSub(balances[address(msg.sender)], tokens*10**decimals);
        emit Transfer(msg.sender, address(this), tokens);
        return true;
    }

    function coinBalance() public view returns(uint){
        return address(this).balance;
    }
}