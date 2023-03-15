// Imports

// ========================================================

// Deployment Script
// ========================================================
const main = async () => {

  
    // Output result
    console.log(`${verifierName} deployed to ${erc20Verifier.address}`);
  }
  

  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });