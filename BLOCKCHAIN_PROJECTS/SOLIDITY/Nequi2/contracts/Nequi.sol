pragma solidity ^0.5.8;

contract Nequi {

    struct User {
        uint id;
        string name;
        uint dinero;
	
        
    }




    // Read/write Users. Define Owner.
    mapping(uint => User) public reciber;
    mapping(address=>User) public owner;
    mapping(address=>bool) public isRegistered;

    	User[] public users;
        address[] public registered_users;
    
    // Read/write candidate
    string public user;

    // Establece la cantidad de dinero inicial de cada usuario
    uint public money=1000;
    
    // Store users Count
    uint public usersCount;

     

    //Convert uint to string

    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
    if (_i == 0) {
        return "0";
    }
    uint j = _i;
    uint len;
    while (j != 0) {
        len++;
        j /= 10;
    }
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (_i != 0) {
        bstr[k--] = byte(uint8(48 + _i % 10));
        _i /= 10;
    }
    return string(bstr);
}


//Confirms if an account is loogged into the network

function isInNetwork (address _address) public returns(bool){
	if(registered_users.length==0){
		isRegistered[_address]=false;
	}
	bool a = false;	
	for(uint i=0; i<registered_users.length && !isRegistered[_address]&&registered_users.length>0; i++){	
		if (registered_users[i]==_address){
			a=true;
			isRegistered[_address]=true; 
		}
	}
	//if(!isRegistered[_address]){
	//isRegistered[_address]=false;
	//}
return isRegistered[_address];
}
   
    //Add a user to the network
    function addUser (address _address) public {
        
        if (!isInNetwork (_address)){
	usersCount ++;
	owner[_address]=User(usersCount, uint2str(usersCount), money);
	users.push(owner[_address]);
	registered_users.push(_address);
	}
	isRegistered[_address]=true;
	
    }
	

    // Constructor
    //constructor () public {
	
      //  }

        
    // Send money from one user to another.
    
    
    function sendMoney(uint _id, uint _money) public {

        //Requires that user is sending less than the total money that posses
        //require(_money<=100);

        //Requiere que le esté enviando a un usuario válido y diferente a sí mismo
        //require(_id > 0 && _id <= usersCount);

        // Sube el dinero en la cuenta id especificado.



        bool a=false;
	bool b=false;
        for(uint i=1;i<=usersCount && (!a || !b);i++){
	//Sube el dinero del usuario identificado en los parámetros

	
        	if(i==_id && !a){
			a=true;
			users[i-1].dinero+=_money;}

//Baja el dinero del que envía. 
		if(registered_users[i-1]==msg.sender && !b){
			b=true;
			users[i-1].dinero=users[i-1].dinero-_money;}
        }

       
    }
        
     
}

