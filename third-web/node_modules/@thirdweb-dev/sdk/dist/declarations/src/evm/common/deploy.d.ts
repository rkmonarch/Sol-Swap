import { PrebuiltContractType, DeploySchemaForPrebuiltContractType } from "../core";
import { Signer } from "ethers";
import { z } from "zod";
/**
 *
 * @param contractType
 * @param metadata
 * @param contractURI
 * @returns
 * @internal
 */
export declare function getDeployArguments<TContractType extends PrebuiltContractType>(contractType: TContractType, metadata: z.input<DeploySchemaForPrebuiltContractType<TContractType>>, contractURI: string, signer: Signer): Promise<any[]>;
//# sourceMappingURL=deploy.d.ts.map