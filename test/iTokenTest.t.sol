//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {DeployiToken} from "../script/DeployiToken.s.sol";
import {iToken} from "../src/iToken.sol";
import {IERC20Errors} from "@openzeppelin/contracts/interfaces/draft-IERC6093.sol";

contract iTokenTest is Test {
    iToken public itoken;
    DeployiToken public deployer;
    
    address owner = address(this);
    address mahmud = makeAddr("Mahmud");
    address vane = makeAddr("Vane");
    address zeroAddress = address(0);

    uint256 public constant INITIAL_SUPPLY = 1000000 ether;
    uint256 public constant STARTING_BALANCE = 100 ether;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    function setUp () public {
        deployer = new DeployiToken();
        itoken = deployer.run();

        vm.prank(msg.sender);
        assertTrue(itoken.transfer(mahmud, STARTING_BALANCE));
    }
     
    function testMahmudBalance() public view {
        assertEq(STARTING_BALANCE, itoken.balanceOf(mahmud));
    }

    function testAllowancesWorks() public {
       uint256 initialAllowance = STARTING_BALANCE;

        vm.prank(mahmud);
        itoken.approve(vane, STARTING_BALANCE);

        uint256 transferAmount = 50 ether;

        vm.prank(vane);
        assertTrue(itoken.transferFrom(mahmud, vane, transferAmount));

        assertEq(itoken.balanceOf(vane), transferAmount);
        assertEq(itoken.allowance(mahmud, vane), initialAllowance - transferAmount);
    }

 function testInitialSupplyAndSymbol() public view {
        assertEq(itoken.totalSupply(), INITIAL_SUPPLY);
        assertEq(itoken.name(), "iToken");
        assertEq(itoken.symbol(), "ITK");
        assertEq(itoken.decimals(), 18);
    }

    function testTransferFromInsufficientBalance() public {
        uint256 approvalAmount = STARTING_BALANCE + 10 ether;
        uint256 transferAmount = STARTING_BALANCE + 1 ether;
        
        // First approve (can approve more than balance)
        vm.prank(mahmud);
        itoken.approve(vane, approvalAmount);
        
        // Then try to transfer more than balance
        vm.prank(vane);
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InsufficientBalance.selector,
                mahmud,
                STARTING_BALANCE,
                transferAmount
            )
        );
        // Return value is irrelevant because we expect a revert.
        // Assigning it avoids the forge lint warning about unchecked return values.
        bool success = itoken.transferFrom(mahmud, owner, transferAmount);
        success;
    }

}
