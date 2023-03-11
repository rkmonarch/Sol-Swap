import { NFT, NFTMetadata, NFTMetadataInput, NFTMetadataOrUri } from "../../../core/schema/nft";
import { TieredDropPayloadInput, TieredDropPayloadWithSignature } from "../../schema/contracts/tiered-drop";
import { UploadProgressEvent } from "../../types/events";
import { DetectableFeature } from "../interfaces/DetectableFeature";
import { TransactionResult, TransactionResultWithId } from "../types";
import { ContractWrapper } from "./contract-wrapper";
import { Erc721 } from "./erc-721";
import type { TieredDrop } from "@thirdweb-dev/contracts-js";
import { ThirdwebStorage } from "@thirdweb-dev/storage";
import { BigNumberish } from "ethers";
export declare class Erc721TieredDrop implements DetectableFeature {
    featureName: "ERC721TieredDrop";
    private contractWrapper;
    private erc721;
    private storage;
    constructor(erc721: Erc721, contractWrapper: ContractWrapper<TieredDrop>, storage: ThirdwebStorage);
    getMetadataInTier(tier: string): Promise<Omit<NFTMetadata, "id">[]>;
    getTokensInTier(tier: string): Promise<NFT[]>;
    createBatchWithTier(metadatas: NFTMetadataOrUri[], tier: string, options?: {
        onProgress: (event: UploadProgressEvent) => void;
    }): Promise<TransactionResultWithId<NFTMetadata>[]>;
    createDelayedRevealBatchWithTier(placeholder: NFTMetadataInput, metadatas: NFTMetadataInput[], password: string, tier: string, options?: {
        onProgress: (event: UploadProgressEvent) => void;
    }): Promise<TransactionResultWithId<NFTMetadata>[]>;
    reveal(batchId: BigNumberish, password: string): Promise<TransactionResult>;
    generate(payloadToSign: TieredDropPayloadInput): Promise<TieredDropPayloadWithSignature>;
    generateBatch(payloadsToSign: TieredDropPayloadInput[]): Promise<TieredDropPayloadWithSignature[]>;
    verify(signedPayload: TieredDropPayloadWithSignature): Promise<boolean>;
    claimWithSignature(signedPayload: TieredDropPayloadWithSignature): Promise<TransactionResultWithId<NFT>[]>;
    private mapPayloadToContractStruct;
}
//# sourceMappingURL=erc-721-tiered-drop.d.ts.map