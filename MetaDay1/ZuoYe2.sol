// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ZuoYe2 {
    function resever(string memory str) public pure returns (string memory ret_str){
        bytes memory bytes_str = bytes(str);
        uint length = bytes_str.length;
        bytes memory ret_bytes = new bytes(length);
        for (uint i = 0; i < length ; i++) {
            ret_bytes[i] = bytes_str[length -1 - i];
        }
        return string(ret_bytes);
    }
}
