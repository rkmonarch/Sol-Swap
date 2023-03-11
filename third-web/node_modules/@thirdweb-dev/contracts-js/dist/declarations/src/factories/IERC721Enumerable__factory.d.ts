import type { IERC721Enumerable, IERC721EnumerableInterface } from "../IERC721Enumerable";
import type { Provider } from "@ethersproject/providers";
import { Signer } from "ethers";
export declare class IERC721Enumerable__factory {
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
    static createInterface(): IERC721EnumerableInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): IERC721Enumerable;
}
//# sourceMappingURL=IERC721Enumerable__factory.d.ts.map