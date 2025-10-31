// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract Voting {
    //一个mapping来存储候选人的得票数
    // 一个vote函数， 允许用户投票给某个候选人
    // 一个getVotes函数，    返回某个候选人的得票数
    // 一个resetVotes函数，重置所有候选人的得票数
    mapping(string => uint) public votes;
    string[] public vote_list;

    function vote(string memory _candidate) public {
        votes[_candidate] += 1;
        vote_list.push(_candidate);
    }
    function getVotes(string memory _candidate) public view returns (uint) {
        return votes[_candidate];
    }
    function resetVites()public {
        for (uint i =0 ;i <vote_list.length; i++) {
            votes[vote_list[i]]=0;
        }
    }
}