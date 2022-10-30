// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.7.0) (token/ERC1155/ERC1155.sol)

pragma solidity ^0.8.0;

contract PlayerContract {
    struct Player {
        string name; // Allows players to more easily identify eachother
        uint gameId; // gameId generated from gameNumber
        uint buyinAmount; // How much a player has bought in with
        uint withdrawalAmount; // How much a player has requested a withdrawal for
        bool withdrawalReq; // Tracks if a player has submitted a request
        bool verifyReqs; // TO verify that all withdrawal requests look good at table
        bool hasWithdrawn; // To signify that a player has paidout to prevent triggering of any functions after they receieve back their funds
        bool isInGame; // Is in game bool
        bool isHost; // Is host
    }
    mapping(address => Player) public playerInfo;

    function getOtherPlayerInfo(address addr)
        public
        view
        returns (Player memory)
    {
        return playerInfo[addr];
    }

    function getPlayerInfo() external view returns (Player memory) {
        return playerInfo[msg.sender];
    }

    /**
     * @param name_ player name
     * @param gbw_ array of uint info
     * gameId at index 0
     * buyinAmount at index 1
     * withdrawalAmount at index 2
     * @param wvhii_ array of bool info
     * withdrawalReq at index 0
     * verifyReqs at index 1
     * hasWithdrawn at index 2
     * isInGame at index 3
     * isHost at index 4
     * */
    function setPlayerInfo(
        string memory name_,
        uint[3] memory gbw_,
        bool[5] memory wvhii_
    ) external {
        playerInfo[msg.sender] = Player(
            name_,
            gbw_[0],
            gbw_[1],
            gbw_[2],
            wvhii_[0],
            wvhii_[1],
            wvhii_[2],
            wvhii_[3],
            wvhii_[4]
        );
    }
}
