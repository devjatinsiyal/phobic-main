// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IdToken.sol";

contract Distribute is ChainlinkClient {
    address owner;
    address immutable Token;
    address immutable idToken;
    uint decimals = 10 ** 18;
    uint countMember;
    uint256[64] public aadhar;

    address public oracle;
    string public claims;

    ICircuitValidator public validator;
    ICircuitValidator.CircuitQuery public query;

    struct Participant {
        address participant;
        uint amount;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "onlyOwner");
        _;
    }

      modifier onlyOrganizer() {
        uint256 tokens = IERC20(idToken).balanceOf(msg.sender);
        require(tokens > 0, "Not a DAO member");
        _;
    }

    constructor(
        address _oracle,
        address _token,
        address _idtoken,
        address _link,
        address _validator,
        uint256 _schema,
        uint256 _slotIndex,
        uint256 _operator,
        string memory _circuitId
    ) {
        if (_link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(_link);
        }

        oracle = _oracle;
        validator = ICircuitValidator(_validator);
        query.schema = _schema;
        query.slotIndex = _slotIndex;
        query.operator = _operator;
        query.value = aadhar;
        query.circuitId = _circuitId;
        Token = _token;
        IdToken = _idtoken;

        countMember = 0;
    }

    function addPaeticipantsToSendTokens(uint eventID) external onlyOrganizer {}

    function releaseTokens(address[] memory recipients) external onlyOwner {
        uint length = recipients.length;
        for (uint i; i < length; i++) {
            IERC20(Token).transfer(recipients[i], 10 * decimals);
        }
    }
}
