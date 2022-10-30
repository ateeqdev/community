const { expect } = require("chai");
const { ethers } = require("hardhat");
const fs = require("fs");

var owner,
  users = [],
  userAddrs = [],
  player;

const deployContract = async function () {
  [owner, ...users] = await ethers.getSigners();
  const player_ = await ethers.getContractFactory("PlayerContract");

  player = await player_.deploy();
};

const populatePlayers = async function () {
  for (let i = 0; i < 5; i++) {
    let name = (Math.random() + 1).toString(36).substring(7); //Name
    let int_args = [];
    let bool_args = [];

    for (let index = 0; index < 3; index++)
      int_args[index] = Math.ceil(Math.random() + 1); //gameId, BuyinAmount, WithdrawAmount

    for (let index = 0; index < 5; index++)
      bool_args[index] = Math.ceil(Math.random() + 1) % 2 ? true : false; //withdrawalReq, verifyReqs, hasWithdrawn, isInGame, ishost

    await player.connect(users[i]).setPlayerInfo(name, int_args, bool_args);
  }
  console.log(await player.getOtherPlayerInfo(users[0].address));
};

describe("Access player struct via address", async function () {
  it("should deploy contract", deployContract);
  it("should populate players", populatePlayers);
});
