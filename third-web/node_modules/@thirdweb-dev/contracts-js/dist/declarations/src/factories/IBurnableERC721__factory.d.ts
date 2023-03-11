import type { IBurnableERC721, IBurnableERC721Interface } from "../IBurnableERC721";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IBurnableERC721__factory {
    static readonly abi: {
        inputs: {
            internalType: string;
            name: string;
            type: string;
        }[];
        name: string;
        outputs: never[];
        stateMutability: string;
        type: string;
    }[];
    static createInterface(): IBurnableERC721Interface;
    static connect(address: string, signerOrProvider: Signer | Provider): IBurnableERC721;
}
//# sourceMappingURL=IBurnableERC721__factory.d.ts.map