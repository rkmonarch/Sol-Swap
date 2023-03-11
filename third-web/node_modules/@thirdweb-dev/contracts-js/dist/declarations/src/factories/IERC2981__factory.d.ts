import type { IERC2981, IERC2981Interface } from "../IERC2981";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IERC2981__factory {
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
    static createInterface(): IERC2981Interface;
    static connect(address: string, signerOrProvider: Signer | Provider): IERC2981;
}
//# sourceMappingURL=IERC2981__factory.d.ts.map