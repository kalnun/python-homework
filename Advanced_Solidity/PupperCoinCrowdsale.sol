pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale{
    uint fakenow = now;
    
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet,
        uint256 goal,
        PupperCoin token
    )
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        TimedCrowdsale(fakenow, fakenow + 5 minutes)
        RefundableCrowdsale(goal)
        CappedCrowdsale(1)
        Crowdsale(1, wallet, token)
        public
    {
        // constructor can stay empty
    }
    
    function fastforward() public {
        fakenow += 1 hours;
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet,
        uint256 goal
    )
        public
    {
        // @TODO: create the PupperCoin and keep its address handy
        PupperCoin token = new PupperCoin(name, symbol, 18);
        token_address = address(token);
        // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        PupperCoinSale pupper_sale = new PupperCoinSale(name, symbol, wallet, goal, token);
        token_sale_address = address(pupper_sale);
        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}