pragma solidity ^0.5.16;

contract Election{

    // Candidate Attributes
    struct Candidate{

        uint id;
        string name;
        uint voteCount;
    } 

    // Store Candidates
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;

    // Adding a Candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
    }

    // Contructor
  constructor() public {
      addCandidate("Nawaz Sharif");
      addCandidate("Imran Khan");
  }
}