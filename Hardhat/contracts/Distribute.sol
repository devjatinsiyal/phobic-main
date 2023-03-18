// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Token.sol";

contract Distribute {
    MyToken P_token;
    uint decimals = 10 ** 18;
    uint256[64] public aadhar;

    string public claims;

    mapping(address => uint) TokensToSend;

    event TokenDeployed(address indexed tokenContract);
    event TokenClaimed(address indexed Participant, uint amount, uint timestamp);
    event ParticipantsAdded(address indexed AddedBy, uint timestamp);

    modifier onlyOrganizer() {
        // require(IERC20(idToken).balanceOf(msg.sender) > 0, "Not a DAO member");
        _;
    }

    constructor() {
         P_token = new MyToken();
         emit TokenDeployed(address(P_token));
       
    }

    function addParticipantsToSendTokens(
        address[] memory _participants,
        uint[] memory _amounts
    ) external onlyOrganizer {
        uint Plength = _participants.length;
        require(Plength == _amounts.length, "Unequal Arrays");

        for (uint i; i < Plength; i++) {
            TokensToSend[_participants[i]] += _amounts[i];
        }

        emit ParticipantsAdded(msg.sender, block.timestamp);
    }

    function claimTokens() external {
        uint claimableTokens = TokensToSend[msg.sender];
        require(claimableTokens > 0, "No tokens to claim");

        P_token.mint(msg.sender, claimableTokens * decimals);
        emit TokenClaimed(msg.sender, claimableTokens, block.timestamp);
    }
}
