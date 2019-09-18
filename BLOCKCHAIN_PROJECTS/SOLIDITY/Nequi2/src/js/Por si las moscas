App = {
  web3Provider: null,
  contracts: {},
  account: '0x0',

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    if (typeof web3 !== 'undefined') {
      // If a web3 instance is already provided by Meta Mask.
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      // Specify default instance if no web3 instance provided
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },

  initContract: function() {
    $.getJSON("Nequi.json", function(nequi) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.Nequi = TruffleContract(nequi);
      // Connect provider to interact with contract
      App.contracts.Nequi.setProvider(App.web3Provider);

      return App.render();
    });
  },

  render: function() {
    var nequiInstance;
    var loader = $("#loader");
    var content = $("#content");

    loader.show();
    content.hide();

App.contracts.Nequi.deployed().then(function(instance) {
	nequiInstance = instance;
	return nequiInstance.usersCount();}).then(function(userscount){
      		var usersResults = $("#usersResults");
      		usersResults.empty();
		for (var i = 0; i < userscount; i++) {
        		nequiInstance.users(i).then(function(user) {
          		var id = user[0];
          		var name = user[1];
          		var money = user[2];

          		// Render candidate Result
          		var userTemplate = "<tr><th>" + id + "</th><td>" + name + "</td><td>" + money + "</td></tr>";
          		usersResults.append(userTemplate);});
      }

      loader.hide();
      content.show();
    }).catch(function(error) {
      console.warn(error);
    });

web3.eth.getCoinbase(function(err, account) {
	if (err === null) {
		App.account = account;
		App.contracts.Nequi.deployed().then(function(instanc) {
			instance=instanc;
			instance.isRegistered(account);}).then(function (isregistered){
				if(isregistered){
				$("#accountAddress").html("Your account is: " + account+" and you are registered.");
				}
				else{
					$("#accountAddress").html("Your account is: " + account+" and you are NOT registered.");
					//addUsers(account);
				}
				
			});
 	}	
	});	

},


// Load contract data

//Load account data




//Send money from one user to another. 


enviarDinero: function() {
    var ID=$('#usuario').val();
    var money = $('#money').val();
    App.contracts.Nequi.deployed().then(function(instance) {
      return instance.sendMoney(ID,money, { from: App.account });
    }).then(function(result) {
      // Wait for votes to update
      $("#content").hide();
      $("#loader").show();
    }).catch(function(err) {
      console.error(err);
    });
  },

// Create User if not existing.
addUsers: function() {
	web3.eth.getCoinbase(function(err, account) {
	if (err === null) {
		App.account = account;
		App.contracts.Nequi.deployed().then(function(instanc) {
			instance=instanc;
			instance.isRegistered(account);}).then(function (isregistered){
				if(isregistered){
				$("#accountAddress").html("Your account is: " + account+" and you are registered.");
				}
				else{
					$("#accountAddress").html("Your account is: " + account+" and you are NOT registered.");
					return instance.addUser(account);
				}
				
			});
 	}	
	});	
	//App.contracts.Nequi.deployed().then(function(i) {
	//return i.addUser({ from: App.account });});	    
},

}





$(function() {
  $(window).load(function() {
    App.init();
  });
});

