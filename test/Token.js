const { expect } = require("chai");
const { ethers } = require("hardhat");

const tokens = (n) => {
    return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe('Token', () => {
    let token,
        accounts,
        deployer

    beforeEach(async () => {
         //Fetch Token from Blockchain
        const Token = await ethers.getContractFactory('Token')
        token = await Token.deploy('Dapp University', 'DAPP', '1000000')
    
        accounts = await ethers.getSigners()
        deployer = accounts[0]
    })

    describe('Deployment', () => {
        const name = 'Dapp University'
        const symbol = 'DAPP'
        const decimals = '18'
        const totalSupply ='1000000'

        it('has correct name', async () => {
            expect(await token.name()).to.equal(name)
        })
    
        it('has correct symbol', async () => {
            expect(await token.symbol()).to.equal(symbol)
        })
    
        it('has correct decimals', async () => {
            expect(await token.decimals()).to.equal(decimals)
        })
    
        it('has correct totalSupply', async () => {
            expect(await token.totalSupply()).to.equal(tokens(totalSupply))
        })

        it('assigns total Supply to deployer', async () => {
            expect(await token.balanceOf(deployer.address)).to.equal(tokens(totalSupply))
        })
    }) 
    
    

})