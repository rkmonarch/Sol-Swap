import type { IWETH, IWETHInterface } from "../IWETH";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IWETH__factory {
    static readonly abi: {
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
    }[];
    static createInterface(): IWETHInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IWETH;
}
//# sourceMappingURL=IWETH__factory.d.ts.map