
const hre = require("hardhat");

async function main() {
  ;

  const VendingMachine = await hre.ethers.getContractFactory("VendingMachine");
  const vendingMachine = await VendingMachine.deploy();

  await vendingMachine.deployed();

  console.log(
    `Contract deployed to ${vendingMachine.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
