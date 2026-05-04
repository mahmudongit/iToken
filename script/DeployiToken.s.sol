// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {iToken} from "../src/iToken.sol";


contract DeployiToken is Script {

  uint256 public constant INITIAL_SUPPLY = 1000000 ether;
  function run() external returns (iToken) { 
    vm.startBroadcast();
    iToken ot = new iToken(INITIAL_SUPPLY);
    vm.stopBroadcast();
    return ot;
  }
}
