import type { SoulboundERC721A, SoulboundERC721AInterface } from "../SoulboundERC721A";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class SoulboundERC721A__factory {
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
    static createInterface(): SoulboundERC721AInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): SoulboundERC721A;
}
//# sourceMappingURL=SoulboundERC721A__factory.d.ts.map