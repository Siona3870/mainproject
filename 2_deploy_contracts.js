const IncidentReporting = artifacts.require("IncidentReporting");

module.exports = function (deployer) {
  deployer.deploy(IncidentReporting);
};
