// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IncidentReporting {
    uint256 public incidentCount = 0;
    
    struct Incident {
        uint256 id;
        string lat;
        string lon;
        uint256 timestamp;
    }
    
    mapping(uint256 => Incident) public incidents;
    
    event IncidentReported(
        uint256 id,
        string lat,
        string lon,
        uint256 timestamp
    );
    
    function reportIncident(string memory _lat, string memory _lon) public {
        incidentCount++;
        incidents[incidentCount] = Incident(
            incidentCount,
            _lat,
            _lon,
            block.timestamp
        );
        
        emit IncidentReported(incidentCount, _lat, _lon, block.timestamp);
    }
    
    function getIncident(uint256 _id) public view returns (
        uint256,
        string memory,
        string memory,
        uint256
    ) {
        Incident memory incident = incidents[_id];
        return (incident.id, incident.lat, incident.lon, incident.timestamp);
    }
}
