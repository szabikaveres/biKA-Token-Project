async function main() {
         //Fetch contract to deploy
         const Token = await ethers.getContractFactory("Token") //gets the info from Token.json

        //Deploy contract
        const token = await Token.deploy('Dapp University', 'DAPPU', '1000000') // sending it away to BC
        await token.deployed() //fetch the copy of the token which has been deployed
        console.log(`Token Deployed to: ${token.address}`) //formatting -putting it inside of a string
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

