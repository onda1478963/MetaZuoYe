// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ZuoYe5 {
    function heBing() public pure returns (uint256[] memory) {
        uint256[] memory arr1 = new uint256[](3);
        uint256[] memory arr2 = new uint256[](6);
        uint256[] memory sorted = new uint256[](arr1.length + arr2.length);
        
        arr1[0] = 1;
        arr1[1] = 5;
        arr1[2] = 11;

        arr2[0] = 111;
        arr2[1] = 615;
        arr2[2] = 66;
        arr2[3] = 4;
        arr2[4] = 7;
        arr2[5] = 112;
        // 此时sorted = [1, 5, 11, 111, 615, 66, 4, 7]
        // 合并数组
        for (uint i = 0; i < arr1.length; i++) {
            sorted[i] = arr1[i];
        }
        for (uint i = 0; i < arr2.length; i++) {
            sorted[arr1.length + i] = arr2[i];
        }

        // 插入排序
        for (uint i = 1; i < sorted.length; i++) {
            uint256 key = sorted[i];
            uint j = i;
            
            while (j > 0 && sorted[j - 1] > key) {
                sorted[j] = sorted[j - 1];
                j--;
            }
            sorted[j] = key;
        }

        return sorted;
    }
}
