# iToken (ITK) - ERC20 Token

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-0.8.20-blue)](https://soliditylang.org/)
[![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-4.9.0-blue)](https://openzeppelin.com/)
[![Foundry](https://img.shields.io/badge/Built%20with-Foundry-yellow)](https://getfoundry.sh/)

A secure, standards-compliant ERC20 token implementation built with OpenZeppelin contracts.

## Overview

iToken is a simple yet robust ERC20 token built on Ethereum. It adheres to the [EIP-20](https://eips.ethereum.org/EIPS/eip-20) token standard with additional safety features from OpenZeppelin's battle-tested library.

## Contract Details

- **Name**: iToken
- **Symbol**: ITK
- **Decimals**: 18
- **Total Supply**: 1,000,000 ITK
- **Contract Address (Sepolia)**: [0x8FEF0B2c5661d4D0AECA568a54f9Cd9DB5828b9E](https://sepolia.etherscan.io/address/0x8fef0b2c5661d4d0aeca568a54f9cd9db5828b9e)

## Features

- **Standards Compliance**: Fully compatible with ERC20 standard
- **Security**: Built on [OpenZeppelin](https://openzeppelin.com/contracts/) contracts for optimal security
- **Error Handling**: Implements [ERC-6093](https://eips.ethereum.org/EIPS/eip-6093) standardized error messages
- **Comprehensive Testing**: Thoroughly tested with Foundry

## Prerequisites

- [Foundry](https://getfoundry.sh/)
- [Solidity](https://docs.soliditylang.org/en/v0.8.20/) (0.8.20)

## Installation

```bash
# Clone the repository
git clone https://github.com/mahmudongit/itoken.git
cd itoken

# Install dependencies
forge install
```

## Usage

### Compile

```bash
forge build
```

### Test

```bash
forge test
```

For verbose output with test logs:

```bash
forge test -vvv
```

### Deploy

Deploy to a local Anvil node:

```bash
# Start local Ethereum node
anvil

# Deploy using the deployment script
forge script script/DeployiToken.s.sol --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

Deploy to Sepolia testnet:

```bash
# Set environment variables
export RPC_URL="your_rpc_url"
export PRIVATE_KEY="your_private_key_without_0x_prefix"
export ETHERSCAN_API_KEY="your_etherscan_api_key"

# Deploy with MakeFile
make deploy

# Verify with Etherscan
forge verify-contract 0x8fef0b2c5661d4d0aeca568a54f9cd9db5828b9e  src/iToken.sol:iToken   --chain-id 11155111   --compiler-version v0.8.20   --constructor-args $(cast abi-encode "constructor(uint256)" 1000000000000000000000000)   --etherscan-api-key $ETHERSCAN_API_KEY
```

## Adding to MetaMask

1. Open MetaMask and switch to Sepolia network
2. Click "Import tokens" at the bottom
3. Enter the token contract address: `0x8FEF0B2c5661d4D0AECA568a54f9Cd9DB5828b9E`
4. The token symbol (ITK) and decimals (18) should auto-fill
5. Click "Import"

## Project Structure

```
itoken/
├── src/
│   └── iToken.sol           # Main token contract
├── test/
│   └── iTokenTest.t.sol     # Comprehensive test suite
├── script/
│   └── DeployiToken.s.sol   # Deployment script
└── ...
```

## Contract Architecture

### Main Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract iToken is ERC20 {
    constructor(uint256 initialSupply) 
    ERC20("iToken", "ITK") {
        _mint(msg.sender, initialSupply);
    }
}
```

## Security Considerations

- The contract inherits from OpenZeppelin's audited ERC20 implementation
- All functions adhere to the checks-effects-interactions pattern
- Comprehensive test suite ensures the contract functions as expected

## License

This project is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Acknowledgments

- [OpenZeppelin](https://openzeppelin.com/) for their secure contract library
- [Foundry](https://getfoundry.sh/) for the development framework

---

Made by [Mahmud] | X: [@vanebuilds_] 
