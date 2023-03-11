import type { ContractMetadata, ContractMetadataInterface } from "../ContractMetadata";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class ContractMetadata__factory {
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
        inputs: never[];
        name: string;
        outputs: {
            internalType: string;
            name: string;
            type: string;
        }[];
        stateMutability: string;
        type: string;
        anonymous?: undefined;
    } | {
        inputs: {
            internalType: string;
            name: string;
            type: string;
        }[];
        name: string;
        outputs: never[];
        stateMutability: string;
        type: string;
        anonymous?: undefined;
    })[];
    static createInterface(): ContractMetadataInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): ContractMetadata;
}
//# sourceMappingURL=ContractMetadata__factory.d.ts.map