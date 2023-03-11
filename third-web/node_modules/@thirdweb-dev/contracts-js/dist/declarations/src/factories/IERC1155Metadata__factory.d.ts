import type { IERC1155Metadata, IERC1155MetadataInterface } from "../IERC1155Metadata";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IERC1155Metadata__factory {
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
    static createInterface(): IERC1155MetadataInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IERC1155Metadata;
}
//# sourceMappingURL=IERC1155Metadata__factory.d.ts.map