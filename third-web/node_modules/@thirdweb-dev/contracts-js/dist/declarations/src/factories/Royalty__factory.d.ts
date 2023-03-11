import type { Royalty, RoyaltyInterface } from "../Royalty";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class Royalty__factory {
    static readonly abi: ({
        anonymous: boolean;
        inputs: {
            indexed: boolean;
            internalType: string;
            name: string;
            type: string;
        }[];
        name: string;
        type: string;
        outputs?: undefined;
        stateMutability?: undefined;
    } | {
        inputs: {
            internalType: string;
            name: string;
            type: string;
        }[];
        name: string;
        outputs: {
            internalType: string;
            name: string;
            type: string;
        }[];
        stateMutability: string;
        type: string;
        anonymous?: undefined;
    })[];
    static createInterface(): RoyaltyInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): Royalty;
}
//# sourceMappingURL=Royalty__factory.d.ts.map