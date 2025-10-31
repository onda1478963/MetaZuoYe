// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ZuoYe6{
    /**
     * 二分查找函数
     * @param arr 有序数组（升序）
     * @param target 要查找的目标值
     * @return 如果找到目标值，返回其索引；如果未找到，返回type(uint256).max
     */
    function binarySearch(uint256[] memory arr, uint256 target) public pure returns (uint256) {
        // 处理空数组的情况
        if (arr.length == 0) {
            return type(uint256).max;
        }
        
        uint256 left = 0;
        uint256 right = arr.length - 1;
        
        while (left <= right) {
            // 计算中间索引，防止溢出
            uint256 mid = left + (right - left) / 2;
            
            if (arr[mid] == target) {
                // 找到目标值，返回索引
                return mid;
            } else if (arr[mid] < target) {
                // 目标值在右半部分
                left = mid + 1;
            } else {
                // 目标值在左半部分
                // 防止下溢（当mid为0时）
                if (mid == 0) {
                    break;
                }
                right = mid - 1;
            }
        }
        
        // 未找到目标值
        return type(uint256).max;
    }
    
    /**
     * 测试函数 - 演示二分查找的使用
     */
    function testBinarySearch() public pure returns (uint256[] memory results) {
        // 创建有序测试数组 [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
        uint256[] memory sortedArray = new uint256[](10);
        for (uint256 i = 0; i < 10; i++) {
            sortedArray[i] = i * 2 + 1;
        }
        
        // 测试不同的查找情况
        results = new uint256[](5);
        
        // 测试1：查找存在的值（中间位置）
        results[0] = binarySearch(sortedArray, 7);  // 应该返回3
        
        // 测试2：查找存在的值（开头位置）
        results[1] = binarySearch(sortedArray, 1);  // 应该返回0
        
        // 测试3：查找存在的值（末尾位置）
        results[2] = binarySearch(sortedArray, 19); // 应该返回9
        
        // 测试4：查找不存在的值（在数组范围内）
        results[3] = binarySearch(sortedArray, 8);  // 应该返回type(uint256).max
        
        // 测试5：查找不存在的值（超出数组范围）
        results[4] = binarySearch(sortedArray, 25); // 应该返回type(uint256).max
        
        return results;
    }
    
    /**
     * 递归版本的二分查找
     */
    function binarySearchRecursive(uint256[] memory arr, uint256 target) public pure returns (uint256) {
        return _binarySearchRecursive(arr, target, 0, arr.length - 1);
    }
    
    function _binarySearchRecursive(uint256[] memory arr, uint256 target, uint256 left, uint256 right) 
        private pure returns (uint256) {
        
        // 基准情况：搜索范围无效
        if (left > right) {
            return type(uint256).max;
        }
        
        uint256 mid = left + (right - left) / 2;
        
        if (arr[mid] == target) {
            return mid;
        } else if (arr[mid] < target) {
            // 在右半部分递归搜索
            return _binarySearchRecursive(arr, target, mid + 1, right);
        } else {
            // 在左半部分递归搜索
            if (mid == 0) return type(uint256).max; // 防止下溢
            return _binarySearchRecursive(arr, target, left, mid - 1);
        }
    }
    
    /**
     * 查找目标值的插入位置（用于插入排序等场景）
     * @return 目标值应该插入的位置索引
     */
    function findInsertPosition(uint256[] memory arr, uint256 target) public pure returns (uint256) {
        uint256 left = 0;
        uint256 right = arr.length;
        
        while (left < right) {
            uint256 mid = left + (right - left) / 2;
            
            if (arr[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return left;
    }
}
