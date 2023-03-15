
const main = async () => {

  
    // Deploy contract
    const Distributor = await ethers.getContractFactory("Distribute");
    const distributor = await Distributor.deploy()
    
    await distributor.deployed();
  
    // Output result
    console.log(`deployed to ${distributor.address}`);
  }
  
  // Init
  // ========================================================
  // We recommend this pattern to be able to use async/await everywhere
  // and properly handle errors.
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });