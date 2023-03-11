import type { IDelayedReveal, IDelayedRevealInterface } from "../IDelayedReveal";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IDelayedReveal__factory {
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
    static createInterface(): IDelayedRevealInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IDelayedReveal;
}
//# sourceMappingURL=IDelayedReveal__factory.d.ts.map