import type { ERC1155Receiver, ERC1155ReceiverInterface } from "../ERC1155Receiver";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class ERC1155Receiver__factory {
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
    static createInterface(): ERC1155ReceiverInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): ERC1155Receiver;
}
//# sourceMappingURL=ERC1155Receiver__factory.d.ts.map