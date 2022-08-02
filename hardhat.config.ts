import "dotenv/config";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import "@nomicfoundation/hardhat-chai-matchers";
import "@typechain/hardhat";
import { HardhatUserConfig } from "hardhat/types";
import "@nomiclabs/hardhat-solhint";
import "solidity-coverage";
// import "hardhat-gas-reporter";
import "hardhat-tracer";

const config: HardhatUserConfig = {
    solidity: {
        compilers: [
            {
                version: "0.8.15",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200,
                    },
                },
            },
        ],
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY,
    },
};

export default config;
