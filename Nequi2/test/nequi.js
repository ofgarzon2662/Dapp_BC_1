var Nequi = artifacts.require("./Nequi.sol");

contract("Nequi", function(accounts) {
  var nequiInstance;

  it("initializes with two Users", function() {
    return Nequi.deployed().then(function(instance) {
      return instance.usersCount();
    }).then(function(count) {
      assert.equal(count, 2);
    });
  });

  it("it initializes the Users with the correct values", function() {
    return Nequi.deployed().then(function(instance) {
      nequiInstance = instance;
      return nequiInstance.users(1);
    }).then(function(user) {
      assert.equal(user[0], 1, "contains the correct id");
      assert.equal(user[1], "User 1", "contains the correct name");
      assert.equal(user[2], 1000, "contains the correct money");
      return nequiInstance.users(2);
    }).then(function(user) {
      assert.equal(user[0], 2, "contains the correct id");
      assert.equal(user[1], "User 2", "contains the correct name");
      assert.equal(user[2], 1000, "contains the correct money");
    });
  });
});
