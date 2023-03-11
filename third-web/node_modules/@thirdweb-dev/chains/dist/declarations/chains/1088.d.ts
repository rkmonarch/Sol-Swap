declare const _default: {
    readonly name: "Metis Andromeda Mainnet";
    readonly chain: "ETH";
    readonly rpc: readonly ["https://metis-andromeda.rpc.thirdweb.com/${THIRDWEB_API_KEY}", "https://andromeda.metis.io/?owner=1088"];
    readonly faucets: readonly [];
    readonly nativeCurrency: {
        readonly name: "Metis";
        readonly symbol: "METIS";
        readonly decimals: 18;
    };
    readonly infoURL: "https://www.metis.io";
    readonly shortName: "metis-andromeda";
    readonly chainId: 1088;
    readonly networkId: 1088;
    readonly explorers: readonly [{
        readonly name: "blockscout";
        readonly url: "https://andromeda-explorer.metis.io";
        readonly standard: "EIP3091";
    }];
    readonly parent: {
        readonly type: "L2";
        readonly chain: "eip155-1";
        readonly bridges: readonly [{
            readonly url: "https://bridge.metis.io";
        }];
    };
    readonly testnet: false;
    readonly slug: "metis-andromeda";
};
export default _default;
//# sourceMappingURL=1088.d.ts.map