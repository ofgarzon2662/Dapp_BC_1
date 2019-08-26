pragma solidity ^0.5.8;

contract Nequi {

    struct User {
        uint id;
        string name;
        uint dinero;
        
    }

    // Read/write Users. Define Owner.
    mapping(uint => User) public users;
    mapping(address=>User) public userlist;
    
    // Read/write candidate
    string public user;

    // Establece la cantidad de dinero inicial de cada usuario
    uint public money=1000;
    
    // Store users Count
    uint public usersCount;

    //var Web3 = require('web3');
    //var web3 = new Web3(Web3.givenProvider || 'ws://some.local-or-remote.node:8546');
    //string[] accounts=web3.eth.getAccounts();
    
    // Mapping from address to ID
    //function find_user_id(address _address) public view returns(uint){      
      //return userlist[_address].id;
    //}
    
    //Add a user to the network
    function addUser (string memory _name) private {
        usersCount ++;
        users[usersCount]=User(usersCount, _name, money);
    }

    // Constructor
    constructor () public {
        addUser("User 1");
        addUser("User 2");
        addUser("User 3");
        addUser("User 4");
        addUser("User 5");
        addUser("User 6");
        addUser("User 7");
        addUser("User 8");
        addUser("User 9");
        addUser("User 10");
    }

        
    // Send money from one user to another.
    
    
    function sendMoney(uint _id, uint _money) public {

        //Requires that user is sending less than the total money that posses
        //require(_money<=100);

        //Requiere que le esté enviando a un usuario válido y diferente a sí mismo
        //require(_id > 0 && _id <= usersCount);

        // Sube el dinero en la cuenta id especificado.
        users[_id].dinero=users[_id].dinero+_money;

    }
        
     
}

