import type { IERC20Permit, IERC20PermitInterface } from "../IERC20Permit";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IERC20Permit__factory {
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
    static createInterface(): IERC20PermitInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IERC20Permit;
}
//# sourceMappingURL=IERC20Permit__factory.d.ts.map