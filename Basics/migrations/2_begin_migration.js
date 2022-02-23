const Migrations = artifacts.require("Begin01.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
