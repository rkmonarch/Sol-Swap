import type { ERC165, ERC165Interface } from "../ERC165";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class ERC165__factory {
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
    static createInterface(): ERC165Interface;
    static connect(address: string, signerOrProvider: Signer | Provider): ERC165;
}
//# sourceMappingURL=ERC165__factory.d.ts.map