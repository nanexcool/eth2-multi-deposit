// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Eth2MultiDeposit.sol";

contract Eth2MultiDepositTest is DSTest {
    Eth2MultiDeposit multi;

    function setUp() public {
        multi = new Eth2MultiDeposit();
    }

    // obviously never use these credentials, they are for testing only :)
    function test_basic_sanity() public {
        bytes[] memory pubkey = new bytes[](5);
        pubkey[0] = hex"af5276e12e23483893408594e7722328782732aeda2578c00f8ae677038b2948ab8d41af746dd956bc92a5557dd80636";
        pubkey[1] = hex"b9ece68b8a669b8c249d320c3a19fa83c4b2e2abe4b21fd410ce3ad91fb41c8480e0c52eca5eb3740ec4ee6c1cc22f88";
        pubkey[2] = hex"a3d142421907df4a04f07e568855d2a0b4f9d87b73b2d7036cd53c7ca3891cc584aeaadbfbcc0aabcd4db24e3c4d8dff";
        pubkey[3] = hex"8a54b58e36d97dbe1cb52af0f5ee2d028a77d5c05c03975abf87d2206ae43ecb4bcc31e0fd17a3c0567058c3e07c69e9";
        pubkey[4] = hex"b21a68844ed554cb6fbdcc8198752ea0d78ae70a177e23a5d16c159edb951cd9453cb9567275d8e5d05c2a9d424be2d9";
        emit log_bytes(pubkey[0]);
        emit log_named_uint("pubkey.length", pubkey[0].length);
        bytes[] memory withdrawal_credentials = new bytes[](5);
        withdrawal_credentials[0] = hex"004b4ae7eed2fb6a81805d7aa408605dc2a240ee97446711cd90e1443f7e3e14";
        withdrawal_credentials[1] = hex"0010797f502ea70405973c50ff09adcdc604976b0435d9806b166163eb7e1a2d";
        withdrawal_credentials[2] = hex"00e54c1f78f2c538b3d67b836acdf9a4a29cf2345884e5368f0a0662846f7809";
        withdrawal_credentials[3] = hex"00e340c7e3b000a0d816b9969864994585412b13845f9b8ba254c54b03577c68";
        withdrawal_credentials[4] = hex"00b1ff2a920da0c192c0b3fe08aac7f552be5b93149a129e186110b6c29e7d3a";

        bytes[] memory signature = new bytes[](5);
        signature[0] = hex"8b6f7b190068930dfbb5c5de6c41580e5b55050a81d14fd1040854fde8644263874eba99ab49977450a93b0960c0100e0119c7de0591e12feedaed4769e265c20f35e70d0f4778c4e251650553a4cd1b04e18d3dc6319811f43b633aec85c176";
        signature[1] = hex"aa27afdc303907003f9cd8c88be075d77706afb58931e55de20ce9e066ff970fa69721857bfc6efb4b706a171f0cce9214e93b54726401f837aba08d3b13fb710b0d77ded13ea9c2e741e2cd2aa6f0c2225368db3289cb9e291c95e6869a5aaa";
        signature[2] = hex"86189e7c44cce1766f4b74286b4650f5017e46fcfa6421b6070ac9d40cd38029548940cc63b8fcd128b1ab338262dbd209f310f0aba637439413683b7b8f03f561c7170949286b3486d9bc9aaaffcc132c24f24dafac80f3b54b57b0b69e795b";
        signature[3] = hex"974f6d41770753278c981f014b28562ee849878f6b6cb2a5491ac1f10b92d5deca8fe85947ee634739301b2da241871e00fe43701e4338fa89b9660a30360a433c33710276b03f808c00f51e6e9413c41605268fc17f23d0cdf8c417002f01fa";
        signature[4] = hex"93369f05498c8213cf0e5a417cb7933c728843a7e93f4a85ede71e57e820caa8aaed77c4dcb2ba9e2bcea81546259dcc19bf28716ccf11d8f503b38be84c836fe66a40a3b1fe9ae730bd8583b964d1aa411e8c8dc0d038e7554cd34a4a61620f";

        bytes32[] memory deposit_data_root = new bytes32[](5);
        deposit_data_root[0] = 0xbf79764edff68c44e75845874b3d02b77496c206355a4e4cba29bbb2c4d51f29;
        deposit_data_root[1] = 0x0afc28943c1d02419c0f1afb8d9513eac313af03aaf06a1f8666fac02224002f;
        deposit_data_root[2] = 0x4f3bda56bbd37dba733b3ea743e3fd852931c0a81f840ec5b30308ab37922db4;
        deposit_data_root[3] = 0x49b01431393d4dac92a37dd1ac04607cbfe2f27fb691ecfbedc3c894e1657546;
        deposit_data_root[4] = 0xdf69f22c2a2abd13165a3efb03da37d7c3947201f8b9d54e08ca5e3f740ccc80;

        multi.deposit{value: 32 ether * pubkey.length}(pubkey, withdrawal_credentials, signature, deposit_data_root);
    }
}
