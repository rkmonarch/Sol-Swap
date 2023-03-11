import type { IDelayedRevealDeprecated, IDelayedRevealDeprecatedInterface } from "../IDelayedRevealDeprecated";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IDelayedRevealDeprecated__factory {
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
    static createInterface(): IDelayedRevealDeprecatedInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IDelayedRevealDeprecated;
}
//# sourceMappingURL=IDelayedRevealDeprecated__factory.d.ts.map