export type Chain = {
    name: string;
    chain: string;
    icon?: {
        url: string;
        width: number;
        height: number;
        format: string;
        sizes?: readonly number[];
    };
    rpc: readonly string[];
    features?: Readonly<Array<{
        name: string;
    }>>;
    faucets?: readonly string[];
    nativeCurrency: {
        name: string;
        symbol: string;
        decimals: number;
    };
    infoURL?: string;
    shortName: string;
    chainId: number;
    networkId?: number;
    ens?: {
        registry: string;
    };
    explorers?: Readonly<Array<{
        name: string;
        url: string;
        standard: string;
    }>>;
    testnet: boolean;
    slug: string;
    slip44?: number;
    status?: string;
};
export type MinimalChain = Pick<Chain, "name" | "chain" | "rpc" | "nativeCurrency" | "shortName" | "chainId" | "testnet" | "slug">;
//# sourceMappingURL=types.d.ts.map