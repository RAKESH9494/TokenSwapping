const hre = require("hardhat");
async function main() {
    const Defi = await hre.ethers.getContractFactory('TokenSwap');
    const contract = await Defi.deploy();
     await contract.deployed();
     console.log("Address of Contract : ",contract.address);  
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
