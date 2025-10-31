// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ZuoYe4{
    mapping(bytes1 => uint256) private charToValue; 
    constructor() {
        charToValue['I'] = 1;
        charToValue['V'] = 5;
        charToValue['X'] = 10;
        charToValue['L'] = 50;
        charToValue['C'] = 100;
        charToValue['D'] = 500;
        charToValue['M'] = 1000;
    }
    function LuoMaToNum(string memory s) public  view  returns (uint256) {
        bytes memory  bytes_s = bytes(s);
        uint256 totle = 0;
        uint256 prevValue = 0;

        for (uint256 i = bytes_s.length; i > 0 ; i --) {
            // bytes memory currenValue = bytes_s[i-1];
            uint256  currenValue = charToValue[bytes_s[i-1]];
            if (currenValue < prevValue){
                totle -= currenValue;
            }else {
                totle += currenValue;
            }
             prevValue = currenValue; // 10 1 50 10 100 100 500
             
        }
        // 10  9  59 49 149 249 749
        return totle;
    }
    
}
