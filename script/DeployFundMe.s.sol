//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    // function run() external returns (FundMe, HelperConfig) {
    function run() external returns (FundMe) {
        // Before startBroadcast -> not a "real" tx
        HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
        address priceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        // After startBroadcast -> "real" tx
        FundMe fundMe = new FundMe(priceFeed);
        vm.stopBroadcast();
        // return (fundMe, helperConfig);
        return fundMe;
    }
}


// pragma solidity ^0.8.19;

// import {Script} from "forge-std/Script.sol";
// import {FundMe} from "../src/FundMe.sol";

// contract DeployFundMe is Script {
//     function run() external returns (FundMe) {
//         vm.startBroadcast();
//         FundMe fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
//         vm.stopBroadcast();
//         return fundMe;
//     }
// }