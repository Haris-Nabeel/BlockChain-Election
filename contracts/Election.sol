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

    // voted event
    event votedEvent(uint indexed _candidateId);

    // Adding a Candidate
    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
    }

    // Voting
    function vote(uint _candidateId) public {
        // checking if voter has already voted
        require(!voters[msg.sender]);

        //checking that if voter is voting to valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount );

        // record that voter has voted
        voters[msg.sender] = true;
        
        // updating candidate vote count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }

    // Contructor
  constructor() public {
      addCandidate("Nawaz Sharif");
      addCandidate("Imran Khan");
  }
}