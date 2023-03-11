declare const _default: {
    readonly name: "zkSync Era Mainnet";
    readonly chain: "ETH";
    readonly rpc: readonly ["https://zksync-era.rpc.thirdweb.com/${THIRDWEB_API_KEY}", "https://zksync2-mainnet.zksync.io"];
    readonly faucets: readonly [];
    readonly nativeCurrency: {
        readonly name: "Ether";
        readonly symbol: "ETH";
        readonly decimals: 18;
    };
    readonly infoURL: "https://zksync.io/";
    readonly shortName: "zksync";
    readonly chainId: 324;
    readonly networkId: 324;
    readonly icon: {
        readonly url: "ipfs://Qma6H9xd8Ydah1bAFnmDuau1jeMh5NjGEL8tpdnjLbJ7m2";
        readonly width: 512;
        readonly height: 512;
        readonly format: "svg";
    };
    readonly explorers: readonly [{
        readonly name: "zkSync Era Block Explorer";
        readonly url: "https://explorer.zksync.io";
        readonly icon: "zksync-era";
        readonly standard: "EIP3091";
    }];
    readonly parent: {
        readonly type: "L2";
        readonly chain: "eip155-1";
        readonly bridges: readonly [{
            readonly url: "https://portal.zksync.io/bridge";
        }];
    };
    readonly testnet: false;
    readonly slug: "zksync-era";
};
export default _default;
//# sourceMappingURL=324.d.ts.map