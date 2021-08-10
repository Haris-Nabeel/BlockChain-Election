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

    // Storing accounts that have voted
    mapping(address => bool) public voters;

    // Store Candidates Count
    uint public candidatesCount;

    // Adding a Candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
    }

    // Voting
    function vote(uint _candidateId) public {

        // record that voter has voted
        voters[msg.sender] = true;
        
        // updating candidate vote count
        candidates[_candidateId].voteCount++;
    }

    // Contructor
  constructor() public {
      addCandidate("Nawaz Sharif");
      addCandidate("Imran Khan");
  }
}