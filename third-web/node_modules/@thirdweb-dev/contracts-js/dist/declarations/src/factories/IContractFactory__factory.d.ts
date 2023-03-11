import type { IContractFactory, IContractFactoryInterface } from "../IContractFactory";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IContractFactory__factory {
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
    static createInterface(): IContractFactoryInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IContractFactory;
}
//# sourceMappingURL=IContractFactory__factory.d.ts.map