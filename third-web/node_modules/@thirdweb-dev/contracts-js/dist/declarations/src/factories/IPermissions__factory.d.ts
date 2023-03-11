import type { IPermissions, IPermissionsInterface } from "../IPermissions";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IPermissions__factory {
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
    static createInterface(): IPermissionsInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IPermissions;
}
//# sourceMappingURL=IPermissions__factory.d.ts.map